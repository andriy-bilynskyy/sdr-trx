/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    ADC driver source file
*/

#include "adc.h"
#include "adc_conf.h"
#include "stm32f4xx_conf.h"


void adc_start(void) {

}

void adc_stop(void) {

}

float adc_batt_voltage(void) {
    return 12.157f;
}

float adc_temperature1(void) {
    return 25.37f;
}

float adc_temperature2(void) {
    return 27.15f;
}

float adc_power(void) {
    return 4.579f;
}

float adc_swr(void) {
    return 1.571f;
}
