/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    RF amplifier driver source file
    Controlling LDMOS bias voltage using AD5243 digital potentiometer
    https://www.analog.com/media/en/technical-documentation/data-sheets/AD5243_5248.pdf
*/


#include "rf_amp.h"
#include "hwctl.h"
#include "i2c_master.h"
#include "misc_hal.h"


#define POTENTIOMETER_ADDR      0x2F


void rf_amp_start(void) {

    hwctl_start();
    i2c_master_start();

    hwctl_tx_power(true);
    misc_hal_sleep_ms(10);      /* power stabilization */
    rf_amp_off();
}

void rf_amp_stop(void) {

    rf_amp_off();
    hwctl_tx_power(false);
}

void rf_amp_off(void) {

    uint8_t bt1[] = {0x40, 0x00};
    uint8_t bt2[] = {0xC0, 0x00};
    (void)i2c_master_write(POTENTIOMETER_ADDR, bt1, sizeof(bt1));
    (void)i2c_master_write(POTENTIOMETER_ADDR, bt2, sizeof(bt2));
}

void rf_amp_bias1(uint8_t bias) {

    uint8_t bt1[] = {0x00, bias};
    (void)i2c_master_write(POTENTIOMETER_ADDR, bt1, sizeof(bt1));
}

void rf_amp_bias2(uint8_t bias) {

    uint8_t bt2[] = {0x80, bias};
    (void)i2c_master_write(POTENTIOMETER_ADDR, bt2, sizeof(bt2));
}
