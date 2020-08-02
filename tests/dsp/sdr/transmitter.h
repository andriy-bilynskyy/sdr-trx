/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#ifndef TRANSMITTER_H_
#define TRANSMITTER_H_


#include "sdr_conf.h"


#include <stddef.h>


#ifdef __cplusplus
extern "C" {
#endif


#define transmitter_ncut(Fc, Fs)    ((Fc * ((SDR_TX_BUF_SIZE) << 1)) / Fs)

typedef enum {
    transmitter_LSB,
    transmitter_USB
} transmitter_band_t;

void transmitter_routine(void);
void transmitter_set_band(transmitter_band_t band);
void transmitter_set_fcut(size_t n_cut);


#ifdef __cplusplus
}
#endif

#endif
