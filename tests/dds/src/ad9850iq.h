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

#ifndef __AD9850IQ_H
#define __AD9850IQ_H

#include <stdint.h>

void ad9850iq_start(void);
void ad9850iq_stop(void);
void ad9850iq_sleep(void);
void ad9850iq_wakeup(void);
void ad9850iq_set_frequency(uint32_t frequency_hz);

#endif
