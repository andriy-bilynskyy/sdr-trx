/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    ADC driver header file
*/

#ifndef __ADC_H
#define __ADC_H


#include <stdint.h>


typedef struct {
    float power;
    float swr;
} swr_meter_t;


extern const uint16_t adc_batt_lo_voltage_warn_value;
extern const uint16_t adc_batt_lo_voltage_min_value;

extern const uint16_t adc_temperature_high_warn_value;
extern const uint16_t adc_temperature_high_max_value;
extern const uint16_t adc_temperature_high_back_value;


void        adc_start(void);
void        adc_stop(void);
uint16_t    adc_batt_voltage_value(void);
float       adc_batt_voltage(void);
uint16_t    adc_temperature1_value(void);
float       adc_temperature1(void);
uint16_t    adc_temperature2_value(void);
float       adc_temperature2(void);
swr_meter_t adc_swr(void);


#endif
