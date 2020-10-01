/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    RF amplifier driver header file
    Controlling LDMOS bias voltage using AD5243 digital potentiometer
    https://www.analog.com/media/en/technical-documentation/data-sheets/AD5243_5248.pdf
*/


#ifndef __RF_AMP_H
#define __RF_AMP_H


#include "rf_amp_conf.h"
#include <stdint.h>


#define RF_AMP_MIN      (uint8_t)((RF_AMP_MINV * 256) / 5.0f)
#define RF_AMP_MAX      (uint8_t)((RF_AMP_MAXV * 256) / 5.0f)


void rf_amp_start(void);
void rf_amp_stop(void);
void rf_amp_off(void);
void rf_amp_bias1(uint8_t bias);
void rf_amp_bias2(uint8_t bias);


#endif
