/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    hwctl driver source file
    GPO expander based on 74HC595
*/

#include "hwctl.h"
#include "hwctl_conf.h"
#include "stm32f4xx_conf.h"


#define BANDS_NUM       5
#define BAND_MASK       0x07
#define TX_PWR_MASK     0x08
#define RX_PWR_MASK     0x10
#define BL_PWR_MASK     0x20
#define USB_PWR_MASK    0x40
#define EXT_MIC_MASK    0x80


static uint8_t hwctl_reg = 0x00;


static void hwctl_update(uint8_t reg);


void hwctl_start(void) {
    hwctl_reg = 0x01; // just to proceed update

    uint8_t reg = 0x00;

    GPIO_WriteBit(HWCTL_PORT, HWCTL_DATA, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_CLK, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_LAT, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_EN, Bit_SET);

    GPIO_InitTypeDef  ctl;

    ctl.GPIO_Mode = GPIO_Mode_OUT;
    ctl.GPIO_OType = GPIO_OType_PP;
    ctl.GPIO_PuPd = GPIO_PuPd_NOPULL;
    ctl.GPIO_Speed = GPIO_High_Speed;
    ctl.GPIO_Pin = HWCTL_DATA | HWCTL_CLK | HWCTL_LAT | HWCTL_EN;

    GPIO_Init(HWCTL_PORT, &ctl);

    hwctl_update(reg);

    GPIO_WriteBit(HWCTL_PORT, HWCTL_EN, Bit_RESET);
}

void hwctl_stop(void) {
    GPIO_WriteBit(HWCTL_PORT, HWCTL_EN, Bit_SET);

    GPIO_InitTypeDef  ctl;

    ctl.GPIO_Mode = GPIO_Mode_IN;
    ctl.GPIO_OType = GPIO_OType_PP;
    ctl.GPIO_PuPd = GPIO_PuPd_NOPULL;
    ctl.GPIO_Speed = GPIO_Low_Speed;
    ctl.GPIO_Pin = HWCTL_DATA | HWCTL_CLK | HWCTL_LAT | HWCTL_EN;

    GPIO_Init(HWCTL_PORT, &ctl);

    GPIO_WriteBit(HWCTL_PORT, HWCTL_DATA, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_CLK, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_LAT, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_EN, Bit_RESET);
}

void hwctl_set_band(uint8_t band) {
    uint8_t reg = hwctl_reg & ~BAND_MASK;
    if(band >= BANDS_NUM) {
        band = 0;
    }
    reg |= band;
    hwctl_update(reg);
}

void hwctl_tx_power(hwctl_mode_t mode) {
    uint8_t reg = hwctl_reg & ~TX_PWR_MASK;
    if(mode) {
        reg |= TX_PWR_MASK;
    }
    hwctl_update(reg);
}

void hwctl_rx_power(hwctl_mode_t mode) {
    uint8_t reg = hwctl_reg & ~RX_PWR_MASK;
    if(mode) {
        reg |= RX_PWR_MASK;
    }
    hwctl_update(reg);
}

void hwctl_bkl_power(hwctl_mode_t mode) {
    uint8_t reg = hwctl_reg & ~BL_PWR_MASK;
    if(mode) {
        reg |= BL_PWR_MASK;
    }
    hwctl_update(reg);
}

void hwctl_usb_power(hwctl_mode_t mode) {
    uint8_t reg = hwctl_reg & ~USB_PWR_MASK;
    if(mode) {
        reg |= USB_PWR_MASK;
    }
    hwctl_update(reg);
}

void hwctl_ext_mic(hwctl_mode_t mode) {
    uint8_t reg = hwctl_reg & ~EXT_MIC_MASK;
    if(mode) {
        reg |= EXT_MIC_MASK;
    }
    hwctl_update(reg);
}

static void hwctl_update(uint8_t reg) {
    if(reg != hwctl_reg) {
        for(uint8_t i = 0, tmp = reg; i < 8; i++) {
            if(tmp & 0x80) {
                GPIO_WriteBit(HWCTL_PORT, HWCTL_DATA, Bit_SET);
            } else {
                GPIO_WriteBit(HWCTL_PORT, HWCTL_DATA, Bit_RESET);
            }
            GPIO_WriteBit(HWCTL_PORT, HWCTL_CLK, Bit_SET);
            GPIO_WriteBit(HWCTL_PORT, HWCTL_CLK, Bit_RESET);
            tmp <<= 1;
        }
        GPIO_WriteBit(HWCTL_PORT, HWCTL_LAT, Bit_SET);
        GPIO_WriteBit(HWCTL_PORT, HWCTL_LAT, Bit_RESET);
        hwctl_reg = reg;
    }
}
