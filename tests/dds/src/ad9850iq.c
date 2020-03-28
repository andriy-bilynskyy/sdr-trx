/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    ad9850 IQ driver header file (2 x AD9850 all control pins except data parallel)
    output frequencies of both chips are the same.
    output phases are shifted by 90 degrees.
    https://www.analog.com/media/en/technical-documentation/data-sheets/AD9850.pdf
*/

#include "ad9850iq.h"
#include "ad9850iq_conf.h"
#include "stm32f10x_conf.h"
#include <stdbool.h>


#define AD9850_SLEEP_EN_BIT         2
#define AD9850_PHASE_OFFSET         3
#define AD9850_PHASE_00             (0 << AD9850_PHASE_OFFSET)
#define AD9850_PHASE_90             (8 << AD9850_PHASE_OFFSET)


static bool ad9850iq_started = false;
static uint32_t ad9850iq_frequency_hz = 0;

static void ad9850iq_pulse(uint16_t GPIO_Pin);
static void ad9850iq_tfr_byte(uint8_t data_i, uint8_t data_q);
static void ad9850iq_update(bool sleep);

void ad9850iq_start(void) {
    if(!ad9850iq_started) {
        GPIO_InitTypeDef GPIO_InitStruct_AD9850;
        GPIO_InitStruct_AD9850.GPIO_Pin = AD9850IQ_W_CLK  |
                                          AD9850IQ_FQ_UD  |
                                          AD9850IQ_DATA_I |
                                          AD9850IQ_DATA_Q |
                                          AD9850IQ_RESET;
        GPIO_InitStruct_AD9850.GPIO_Speed = GPIO_Speed_50MHz;
        GPIO_InitStruct_AD9850.GPIO_Mode = GPIO_Mode_Out_PP;
        GPIO_Init(AD9850IQ_PORT, &GPIO_InitStruct_AD9850);

        GPIO_ResetBits(AD9850IQ_PORT, AD9850IQ_W_CLK  |
                       AD9850IQ_FQ_UD  |
                       AD9850IQ_DATA_I |
                       AD9850IQ_DATA_Q |
                       AD9850IQ_RESET);

        ad9850iq_pulse(AD9850IQ_RESET);
        /* the next pulse enables serial mode, see datasheet p. 12 fig. 10 */
        ad9850iq_pulse(AD9850IQ_W_CLK);

        ad9850iq_frequency_hz = 0;
        ad9850iq_started = true;

        ad9850iq_sleep();
    }
}

void ad9850iq_stop(void) {
    if(ad9850iq_started) {
        ad9850iq_sleep();

        GPIO_ResetBits(AD9850IQ_PORT, AD9850IQ_W_CLK  |
                       AD9850IQ_FQ_UD  |
                       AD9850IQ_DATA_I |
                       AD9850IQ_DATA_Q |
                       AD9850IQ_RESET);

        GPIO_InitTypeDef GPIO_InitStruct_AD9850;
        GPIO_InitStruct_AD9850.GPIO_Pin = AD9850IQ_W_CLK  |
                                          AD9850IQ_FQ_UD  |
                                          AD9850IQ_DATA_I |
                                          AD9850IQ_DATA_Q |
                                          AD9850IQ_RESET;
        GPIO_InitStruct_AD9850.GPIO_Speed = GPIO_Speed_10MHz;
        GPIO_InitStruct_AD9850.GPIO_Mode = GPIO_Mode_IN_FLOATING;
        GPIO_Init(AD9850IQ_PORT, &GPIO_InitStruct_AD9850);

        ad9850iq_started = false;
    }
}

void ad9850iq_sleep(void) {
    if(ad9850iq_started) {
        ad9850iq_update(true);
    }
}

void ad9850iq_wakeup(void) {
    if(ad9850iq_started) {
        ad9850iq_update(false);
    }
}

void ad9850iq_set_frequency(uint32_t frequency_hz) {
    if(ad9850iq_started && frequency_hz < AD9850IQ_CLK_HZ / 2) {
        ad9850iq_frequency_hz = frequency_hz;
        ad9850iq_update(false);
    }
}


static void ad9850iq_pulse(uint16_t GPIO_Pin) {
    GPIO_SetBits(AD9850IQ_PORT, GPIO_Pin);
    GPIO_ResetBits(AD9850IQ_PORT, GPIO_Pin);
}

static void ad9850iq_tfr_byte(uint8_t data_i, uint8_t data_q) {
    for(uint8_t i = 0; i < 8; i++, data_i >>= 1, data_q >>= 1) {
        GPIO_WriteBit(AD9850IQ_PORT, AD9850IQ_DATA_I, data_i & 0x01);
        GPIO_WriteBit(AD9850IQ_PORT, AD9850IQ_DATA_Q, data_q & 0x01);
        ad9850iq_pulse(AD9850IQ_W_CLK);
    }
}

static void ad9850iq_update(bool sleep) {
    uint32_t reg = ((uint64_t)ad9850iq_frequency_hz << 32) / AD9850IQ_CLK_HZ;
    for(uint8_t i = 0; i < 4; i++, reg >>= 8) {
        ad9850iq_tfr_byte(reg & 0xFF, reg & 0xFF);
    }
    if(sleep) {
        ad9850iq_tfr_byte(((uint8_t)1 << AD9850_SLEEP_EN_BIT) | AD9850_PHASE_00,
                          ((uint8_t)1 << AD9850_SLEEP_EN_BIT) | AD9850_PHASE_90);
    } else {
        ad9850iq_tfr_byte(AD9850_PHASE_00, AD9850_PHASE_90);
    }
    ad9850iq_pulse(AD9850IQ_FQ_UD);
}
