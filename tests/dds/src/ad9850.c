/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    ad9850 driver source file
    https://www.analog.com/media/en/technical-documentation/data-sheets/AD9850.pdf
*/

#include "ad9850.h"
#include "ad9850_conf.h"
#include "stm32f10x_conf.h"
#include <stdbool.h>


#define AD9850_SLEEP_EN_BIT 2
#define AD9850_PHASE_OFFSET 3
#ifdef AD9851_EXT_EN
#define AD9851_6XMUL_EN_BIT 0
#define AD9850_INT_CLK      (AD9850_CLK_HZ * 6)
#else
#define AD9850_INT_CLK      (AD9850_CLK_HZ)
#endif

static bool ad9850_started = false;
static uint32_t ad9850_frequency_hz = 0;
static ad9850_phase_t ad9850_phase = AD9850_0deg;

static void ad9850_pulse(uint16_t GPIO_Pin);
static void ad9850_tfr_byte(uint8_t data);
static void ad9850_update(bool sleep);

void ad9850_start(void) {
    if(!ad9850_started) {
        GPIO_InitTypeDef GPIO_InitStruct_AD9850;
        GPIO_InitStruct_AD9850.GPIO_Pin = AD9850_W_CLK |
                                          AD9850_FQ_UD |
                                          AD9850_DATA  |
                                          AD9850_RESET;
        GPIO_InitStruct_AD9850.GPIO_Speed = GPIO_Speed_50MHz;
        GPIO_InitStruct_AD9850.GPIO_Mode = GPIO_Mode_Out_PP;
        GPIO_Init(AD9850_PORT, &GPIO_InitStruct_AD9850);

        GPIO_ResetBits(AD9850_PORT, AD9850_W_CLK |
                       AD9850_FQ_UD |
                       AD9850_DATA  |
                       AD9850_RESET);

        ad9850_pulse(AD9850_RESET);
        /* the next pulse enables serial mode, see datasheet p. 12 fig. 10 */
        ad9850_pulse(AD9850_W_CLK);

        ad9850_frequency_hz = 0;
        ad9850_phase = 0;
        ad9850_started = true;

        ad9850_sleep();
    }
}

void ad9850_stop(void) {
    if(ad9850_started) {
        ad9850_sleep();

        GPIO_ResetBits(AD9850_PORT, AD9850_W_CLK |
                       AD9850_FQ_UD |
                       AD9850_DATA  |
                       AD9850_RESET);

        GPIO_InitTypeDef GPIO_InitStruct_AD9850;
        GPIO_InitStruct_AD9850.GPIO_Pin = AD9850_W_CLK |
                                          AD9850_FQ_UD |
                                          AD9850_DATA  |
                                          AD9850_RESET;
        GPIO_InitStruct_AD9850.GPIO_Speed = GPIO_Speed_10MHz;
        GPIO_InitStruct_AD9850.GPIO_Mode = GPIO_Mode_IN_FLOATING;
        GPIO_Init(AD9850_PORT, &GPIO_InitStruct_AD9850);

        ad9850_started = false;
    }
}

void ad9850_sleep(void) {
    if(ad9850_started) {
        ad9850_update(true);
    }
}

void ad9850_wakeup(void) {
    if(ad9850_started) {
        ad9850_update(false);
    }
}

void ad9850_set_frequency(uint32_t frequency_hz) {
    if(ad9850_started && frequency_hz < AD9850_INT_CLK / 2) {
        ad9850_frequency_hz = frequency_hz;
        ad9850_update(false);
    }
}

void ad9850_set_phase(ad9850_phase_t phase) {
    if(ad9850_started && phase <= AD9850_348deg75) {
        ad9850_phase = phase;
        ad9850_update(false);
    }
}


static void ad9850_pulse(uint16_t GPIO_Pin) {
    GPIO_SetBits(AD9850_PORT, GPIO_Pin);
    GPIO_ResetBits(AD9850_PORT, GPIO_Pin);
}

static void ad9850_tfr_byte(uint8_t data) {
    for(uint8_t i = 0; i < 8; i++, data >>= 1) {
        GPIO_WriteBit(AD9850_PORT, AD9850_DATA, data & 0x01);
        ad9850_pulse(AD9850_W_CLK);
    }
}

static void ad9850_update(bool sleep) {
    uint32_t reg = ((uint64_t)ad9850_frequency_hz << 32) / AD9850_INT_CLK;
    for(uint8_t i = 0; i < 4; i++, reg >>= 8) {
        ad9850_tfr_byte(reg & 0xFF);
    }
    if(sleep) {
#ifdef AD9851_EXT_EN
        ad9850_tfr_byte(((uint8_t)1 << AD9851_6XMUL_EN_BIT) |
                        ((uint8_t)1 << AD9850_SLEEP_EN_BIT) |
                        ((uint8_t)ad9850_phase << AD9850_PHASE_OFFSET));
#else
        ad9850_tfr_byte(((uint8_t)1 << AD9850_SLEEP_EN_BIT) |
                        ((uint8_t)ad9850_phase << AD9850_PHASE_OFFSET));
#endif
    } else {
#ifdef AD9851_EXT_EN
        ad9850_tfr_byte(((uint8_t)1 << AD9851_6XMUL_EN_BIT) |
                        ((uint8_t)ad9850_phase << AD9850_PHASE_OFFSET));
#else
        ad9850_tfr_byte(((uint8_t)ad9850_phase << AD9850_PHASE_OFFSET));
#endif
    }
    ad9850_pulse(AD9850_FQ_UD);
}
