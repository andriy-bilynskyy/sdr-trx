/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    codec stub extensions source file
*/


#include "codec_ext.h"
#include "codec.h"
#include <math.h>


#define M_PI            3.14159265358979323846f


static float            time = 0;
static const float      dt[] = {1.0f / 8000, 1.0f / 32000, 1.0f / 48000, 1.0f / 96000};


void codec_mk_signal(volatile app_handle_t * app_handle, uint32_t f_signal) {

    for(uint16_t i = 0; i < codec_buf_elements; i++) {

        if(app_handle->ctl_state->transmission) {
            codec_get_audio_buf()[i].left    = sinf(2.0f * M_PI * f_signal * time + M_PI/4) * INT16_MAX;    /* microphone or line input */
            codec_get_audio_buf()[i].right   = sinf(2.0f * M_PI * f_signal * time + M_PI/4) * INT16_MAX;    /* data of both channels is more or less the same */
        } else {
            codec_get_audio_buf()[i].left    = sinf(2.0f * M_PI * f_signal * time) * INT16_MAX;             /* detector output */
            codec_get_audio_buf()[i].right   = cosf(2.0f * M_PI * f_signal * time) * INT16_MAX;             /* 90 degree phase shift between channels */
        }

        time += dt[app_handle->settings->codec_samplerate];
    }
}

float codec_get_buf_time(volatile app_handle_t * app_handle, uint16_t idx) {

    return time - dt[app_handle->settings->codec_samplerate] * codec_buf_elements + dt[app_handle->settings->codec_samplerate] * idx;
}
