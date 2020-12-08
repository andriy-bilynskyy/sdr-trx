/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    DSP test process source file
*/


#include "dsp_proc.h"
#include "codec.h"
#include "arm_math.h"
#include "debug.h"
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>


static const uint16_t dsp_proc_test_frequency_hz = 1000;

static const uint32_t dsp_proc_sdr_sr[] = {8000, 32000, 48000, 96000};


static struct {
    codec_sample_t *        out_buf;
} dsp_proc_test = {
    .out_buf   = NULL,
};


void dsp_proc_test_set(volatile app_handle_t * app_handle) {

    DBG_OUT("init test process");

    dsp_proc_test.out_buf = malloc(sizeof(codec_sample_t) * codec_buf_elements);
    if(dsp_proc_test.out_buf) {

        uint32_t n = ((uint32_t)dsp_proc_test_frequency_hz * codec_buf_elements) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];
        float32_t f_signal = ((float32_t)dsp_proc_sdr_sr[app_handle->settings->codec_samplerate] * n) / codec_buf_elements;

        static float32_t       time = 0;
        static const float32_t dt[] = {1.0f / 8000, 1.0f / 32000, 1.0f / 48000, 1.0f / 96000};

        for(uint16_t i = 0; i < codec_buf_elements; i++) {
            dsp_proc_test.out_buf[i].left  = sinf(2.0f * PI * f_signal * time) * INT16_MAX;
            dsp_proc_test.out_buf[i].right = cosf(2.0f * PI * f_signal * time) * INT16_MAX;
            time += dt[app_handle->settings->codec_samplerate];
        }
    }
}

void dsp_proc_test_unset(volatile app_handle_t * app_handle) {

    DBG_OUT("deinit test process");

    if(dsp_proc_test.out_buf) {
        free(dsp_proc_test.out_buf);
        dsp_proc_test.out_buf = NULL;
    }
}

void dsp_proc_test_routine(volatile app_handle_t * app_handle) {

    if(dsp_proc_test.out_buf) {
        if(app_handle->ctl_state->transmission) {
            memcpy((codec_sample_t * const)codec_get_audio_buf(), dsp_proc_test.out_buf, sizeof(codec_sample_t) * codec_buf_elements);
        } else {
            memset((codec_sample_t * const)codec_get_audio_buf(), 0, sizeof(codec_sample_t) * codec_buf_elements);
        }
    }
}
