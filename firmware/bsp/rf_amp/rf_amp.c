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


static volatile bool rf_amp_started  = false;


bool rf_amp_start(void) {

    if(!rf_amp_started) {
        hwctl_start();
        i2c_master_start();

        hwctl_tx_power(true);
        misc_hal_sleep_ms(10);      /* power stabilization */

        uint8_t bt1[] = {0x40, 0x00};
        uint8_t bt2[] = {0xC0, 0x00};
        rf_amp_started = ((i2c_master_write(POTENTIOMETER_ADDR, bt1, sizeof(bt1)) == sizeof(bt1)) &&
                          (i2c_master_write(POTENTIOMETER_ADDR, bt2, sizeof(bt2)) == sizeof(bt2)));
        if(!rf_amp_started) {
            hwctl_tx_power(false);
        }
    }
    return rf_amp_started;
}

void rf_amp_stop(void) {

    if(rf_amp_started) {
        rf_amp_started = false;
        rf_amp_off();
        hwctl_tx_power(false);
    }
}

bool rf_amp_off(void) {

    bool result = false;
    if(rf_amp_started) {
        uint8_t bt1[] = {0x40, 0x00};
        uint8_t bt2[] = {0xC0, 0x00};

        result = ((i2c_master_write(POTENTIOMETER_ADDR, bt1, sizeof(bt1)) == sizeof(bt1)) &&
                  (i2c_master_write(POTENTIOMETER_ADDR, bt2, sizeof(bt2)) == sizeof(bt2)));
    }
    return result;
}

bool rf_amp_bias1(uint8_t bias) {

    bool result = false;
    if(rf_amp_started) {
        uint8_t bt1[] = {0x00, bias};
        result = (i2c_master_write(POTENTIOMETER_ADDR, bt1, sizeof(bt1)) == sizeof(bt1));
    }
    return result;
}

bool rf_amp_bias2(uint8_t bias) {

    bool result = false;
    if(rf_amp_started) {
        uint8_t bt2[] = {0x80, bias};
        result = (i2c_master_write(POTENTIOMETER_ADDR, bt2, sizeof(bt2)) == sizeof(bt2));
    }
    return result;
}
