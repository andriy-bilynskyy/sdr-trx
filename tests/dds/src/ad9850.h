/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    ad9850 driver header file
    https://www.analog.com/media/en/technical-documentation/data-sheets/AD9850.pdf
*/

#ifndef __AD9850_H
#define __AD9850_H

#include <stdint.h>

typedef enum {
    AD9850_0deg = 0,
    AD9850_11deg25,
    AD9850_22deg5,
    AD9850_33deg75,
    AD9850_45deg,
    AD9850_56deg25,
    AD9850_67deg5,
    AD9850_78deg75,
    AD9850_90deg,
    AD9850_101deg25,
    AD9850_112deg5,
    AD9850_123deg75,
    AD9850_135deg,
    AD9850_146deg25,
    AD9850_157deg5,
    AD9850_168deg75,
    AD9850_180deg,
    AD9850_191deg25,
    AD9850_202deg5,
    AD9850_213deg75,
    AD9850_225deg,
    AD9850_236deg25,
    AD9850_247deg5,
    AD9850_258deg75,
    AD9850_270deg,
    AD9850_281deg25,
    AD9850_292deg5,
    AD9850_303deg75,
    AD9850_315deg,
    AD9850_326deg25,
    AD9850_337deg5,
    AD9850_348deg75
} ad9850_phase_t;

void ad9850_start(void);
void ad9850_stop(void);
void ad9850_sleep(void);
void ad9850_wakeup(void);
void ad9850_set_frequency(uint32_t frequency_hz);
void ad9850_set_phase(ad9850_phase_t phase);

#endif
