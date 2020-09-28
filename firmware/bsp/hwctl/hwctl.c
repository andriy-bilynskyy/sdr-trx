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
    https://www.ti.com/lit/ds/symlink/sn74hc595.pdf
*/

#include "hwctl.h"
#include "hwctl_conf.h"
#include "hwctl_os_dep.h"
#include "stm32f4xx_conf.h"


#define HWCTL_BANDS_NUM       5
#define HWCTL_BAND_MASK       0x07
#define HWCTL_TX_PWR_MASK     0x08
#define HWCTL_RX_PWR_MASK     0x10
#define HWCTL_BL_PWR_MASK     0x20
#define HWCTL_USB_PWR_MASK    0x40
#define HWCTL_EXT_MIC_MASK    0x80


static uint8_t hwctl_register = 0x00;


static inline void hwctl_update(void)   __attribute__((always_inline));


void hwctl_start(void) {

    HWCTL_SPI_APB_CMD(HWCTL_SPI_PERIPH, ENABLE);

    GPIO_WriteBit(HWCTL_PORT, HWCTL_DATA_PIN, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_CLK_PIN, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_LAT_PIN, Bit_SET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_EN_PIN, Bit_SET);

    GPIO_PinAFConfig(HWCTL_PORT, HWCTL_DATA_PIN_SRC, HWCTL_SPI_DATA_AF);
    GPIO_PinAFConfig(HWCTL_PORT, HWCTL_CLK_PIN_SRC, HWCTL_SPI_CLK_AF);

    GPIO_InitTypeDef  gpio = {
        .GPIO_Mode = GPIO_Mode_AF,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_High_Speed
    };

    gpio.GPIO_Pin = HWCTL_DATA_PIN | HWCTL_CLK_PIN;
    GPIO_Init(HWCTL_PORT, &gpio);

    gpio.GPIO_Pin = HWCTL_LAT_PIN | HWCTL_EN_PIN;
    gpio.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_Init(HWCTL_PORT, &gpio);

    SPI_InitTypeDef spi = {
        .SPI_Direction = SPI_Direction_1Line_Tx,
        .SPI_Mode = SPI_Mode_Master,
        .SPI_DataSize = SPI_DataSize_8b,
        .SPI_CPOL = SPI_CPOL_Low,
        .SPI_CPHA = SPI_CPHA_1Edge,
        .SPI_NSS = SPI_NSS_Soft,
        .SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_4,
        .SPI_FirstBit = SPI_FirstBit_MSB,
        .SPI_CRCPolynomial = 1
    };
    SPI_Init(HWCTL_SPI, &spi);
    SPI_Cmd(HWCTL_SPI, ENABLE);
    SPI_NSSInternalSoftwareConfig(HWCTL_SPI, SPI_NSSInternalSoft_Set);

    NVIC_SetPriority(HWCTL_SPI_IRQ, HWCTL_SPI_IRQ_PRIO);
    NVIC_EnableIRQ(HWCTL_SPI_IRQ);

    hwctl_post_sync_obj();

    hwctl_register = 0;
    hwctl_update();

    GPIO_WriteBit(HWCTL_PORT, HWCTL_EN_PIN, Bit_RESET);
}

void hwctl_stop(void) {

    hwctl_pend_sync_obj();

    GPIO_WriteBit(HWCTL_PORT, HWCTL_EN_PIN, Bit_SET);

    NVIC_DisableIRQ(HWCTL_SPI_IRQ);
    SPI_I2S_ITConfig(HWCTL_SPI, SPI_I2S_IT_TXE, DISABLE);

    SPI_Cmd(HWCTL_SPI, DISABLE);
    SPI_I2S_DeInit(HWCTL_SPI);

    GPIO_InitTypeDef  gpio = {
        .GPIO_Mode = GPIO_Mode_IN,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_Low_Speed,
        .GPIO_Pin = HWCTL_DATA_PIN | HWCTL_CLK_PIN | HWCTL_LAT_PIN | HWCTL_EN_PIN
    };
    GPIO_Init(HWCTL_PORT, &gpio);

    GPIO_WriteBit(HWCTL_PORT, HWCTL_DATA_PIN, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_CLK_PIN, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_LAT_PIN, Bit_RESET);
    GPIO_WriteBit(HWCTL_PORT, HWCTL_EN_PIN, Bit_RESET);

    HWCTL_SPI_APB_CMD(HWCTL_SPI_PERIPH, DISABLE);
}

void hwctl_set_band(uint8_t band) {

    hwctl_pend_sync_obj();
    uint8_t reg = hwctl_register & ~HWCTL_BAND_MASK;
    if(band >= HWCTL_BANDS_NUM) {
        band = 0;
    }
    reg |= band;
    if(reg != hwctl_register) {
        hwctl_register = reg;
        hwctl_update();
    } else {
        hwctl_post_sync_obj();
    }
}

void hwctl_tx_power(bool dev_on) {

    hwctl_pend_sync_obj();
    uint8_t reg = hwctl_register & ~HWCTL_TX_PWR_MASK;
    if(dev_on) {
        reg |= HWCTL_TX_PWR_MASK;
    }
    if(reg != hwctl_register) {
        hwctl_register = reg;
        hwctl_update();
    } else {
        hwctl_post_sync_obj();
    }
}

void hwctl_rx_power(bool dev_on) {

    hwctl_pend_sync_obj();
    uint8_t reg = hwctl_register & ~HWCTL_RX_PWR_MASK;
    if(dev_on) {
        reg |= HWCTL_RX_PWR_MASK;
    }
    if(reg != hwctl_register) {
        hwctl_register = reg;
        hwctl_update();
    } else {
        hwctl_post_sync_obj();
    }
}

void hwctl_bkl_power(bool dev_on) {

    hwctl_pend_sync_obj();
    uint8_t reg = hwctl_register & ~HWCTL_BL_PWR_MASK;
    if(dev_on) {
        reg |= HWCTL_BL_PWR_MASK;
    }
    if(reg != hwctl_register) {
        hwctl_register = reg;
        hwctl_update();
    } else {
        hwctl_post_sync_obj();
    }
}

void hwctl_usb_power(bool dev_on) {

    hwctl_pend_sync_obj();
    uint8_t reg = hwctl_register & ~HWCTL_USB_PWR_MASK;
    if(dev_on) {
        reg |= HWCTL_USB_PWR_MASK;
    }
    if(reg != hwctl_register) {
        hwctl_register = reg;
        hwctl_update();
    } else {
        hwctl_post_sync_obj();
    }
}

void hwctl_ext_mic(bool dev_on) {

    hwctl_pend_sync_obj();
    uint8_t reg = hwctl_register & ~HWCTL_EXT_MIC_MASK;
    if(dev_on) {
        reg |= HWCTL_EXT_MIC_MASK;
    }
    if(reg != hwctl_register) {
        hwctl_register = reg;
        hwctl_update();
    } else {
        hwctl_post_sync_obj();
    }
}

void HWCTL_SPI_IRQ_HANDLER(void) {
    if(SPI_I2S_GetITStatus(HWCTL_SPI, SPI_I2S_IT_TXE) == SET) {
        SPI_I2S_ITConfig(HWCTL_SPI, SPI_I2S_IT_TXE, DISABLE);
        GPIO_WriteBit(HWCTL_PORT, HWCTL_LAT_PIN, Bit_SET);
        hwctl_post_sync_obj();
    }
}


static inline void hwctl_update(void) {
    GPIO_WriteBit(HWCTL_PORT, HWCTL_LAT_PIN, Bit_RESET);
    SPI_I2S_SendData(HWCTL_SPI, hwctl_register);
    SPI_I2S_ITConfig(HWCTL_SPI, SPI_I2S_IT_TXE, ENABLE);
}
