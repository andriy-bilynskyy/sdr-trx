/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#ifndef SDR_H_
#define SDR_H_


#include "sdr_conf.h"


#include <stddef.h>


#ifdef __cplusplus
extern "C" {
#endif


#define sdr_ncut(Fc, Fs)    ((Fc * ((SDR_BUF_SIZE) << 1)) / Fs)

typedef enum {
    sdr_LSB,
    sdr_USB
} sdr_band_t;

void sdr_routine(void);
void sdr_set_band(sdr_band_t band);
void sdr_set_fcut(size_t n_cut);


#ifdef __cplusplus
}
#endif

#endif
