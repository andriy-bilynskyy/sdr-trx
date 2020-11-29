/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    DSP AGC source file
*/


#include "dsp_agc.h"


#ifndef ABS_VAL
#define ABS_VAL(x)              ((x) < 0 ? (-(x)) : (x))
#endif


void dsp_agc_q15_init(dsp_agc_q15_t * dsp_agc_q15, int16_t reference, uint16_t settle_down_it) {

    dsp_agc_q15->ref = (float32_t)ABS_VAL(reference) / INT16_MAX;
    dsp_agc_q15->max = 0;
    dsp_agc_q15->min = 0;
    dsp_agc_q15->alpha = dsp_agc_q15->ref / (0.2f * settle_down_it);
    dsp_agc_q15->gain = 1.0f;
}

void dsp_agc_q15_data(dsp_agc_q15_t * dsp_agc_q15, const codec_sample_t * sample) {

    if(sample->left > dsp_agc_q15->max) {
        dsp_agc_q15->max = sample->left;
    } else if(sample->left < dsp_agc_q15->min) {
        dsp_agc_q15->min = sample->left;
    }
    if(sample->right > dsp_agc_q15->max) {
        dsp_agc_q15->max = sample->right;
    } else if(sample->right < dsp_agc_q15->min) {
        dsp_agc_q15->min = sample->right;
    }
}

float32_t dsp_agc_q15_gain(dsp_agc_q15_t * dsp_agc_q15) {

    if(dsp_agc_q15->max != dsp_agc_q15->min) {
        float32_t diff = ((float32_t)dsp_agc_q15->max - dsp_agc_q15->min) / ((uint32_t)INT16_MAX << 1);
        dsp_agc_q15->gain = dsp_agc_q15->gain * (1.0f - dsp_agc_q15->alpha * diff) + dsp_agc_q15->alpha * dsp_agc_q15->ref;
    }
    dsp_agc_q15->max = 0;
    dsp_agc_q15->min = 0;
    return dsp_agc_q15->gain;
}
