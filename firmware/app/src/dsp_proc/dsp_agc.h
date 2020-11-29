/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    DSP AGC header file
*/


#ifndef __DSP_AGC_H
#define __DSP_AGC_H


#include <stdint.h>
#include "arm_math.h"
#include "codec.h"


typedef struct {
    float32_t       ref;
    int16_t         max;
    int16_t         min;
    float32_t       alpha;
    float32_t       gain;
} dsp_agc_q15_t;


void        dsp_agc_q15_init(dsp_agc_q15_t * dsp_agc_q15, int16_t reference, uint16_t settle_down_it);
void        dsp_agc_q15_data(dsp_agc_q15_t * dsp_agc_q15, const codec_sample_t * sample);
float32_t   dsp_agc_q15_gain(dsp_agc_q15_t * dsp_agc_q15);


#endif
