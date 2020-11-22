/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    DSP SDR process source file
*/


#include "dsp_proc.h"
#include "codec.h"
#include "arm_math.h"
#include "debug.h"
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>


typedef struct {
    float32_t re;
    float32_t im;
} complex_f32_t;


static const uint32_t dsp_proc_sdr_sr[] = {8000, 32000, 48000, 96000};

static struct {
    complex_f32_t *         fft_buf;
    codec_sample_t *        inp_buf;
    codec_sample_t *        out_buf;
    float32_t *             window;
    float32_t *             magnitude;
    uint16_t                magnitude_iterations;
    arm_cfft_instance_f32   cfft;
    enum {
        DSP_PROC_SDR_START,
        DSP_PROC_SDR_CONTINUE,
        DSP_PROC_SDR_END
    }                       state;
    bool                    transmission;
    sdr_modulation_t        modulation;
    uint32_t                dco_frequency;
} dsp_proc_sdr = {
    .fft_buf = NULL,
    .inp_buf = NULL,
    .out_buf = NULL,
    .window  = NULL,
};


static float32_t * dsp_proc_sdr_hann_window(uint16_t size);


void dsp_proc_sdr_set(app_handle_t * app_handle) {

    DBG_OUT("init SDR process");

    dsp_proc_sdr.fft_buf = malloc(sizeof(complex_f32_t) * (codec_buf_elements << 1));

    dsp_proc_sdr.inp_buf = malloc(sizeof(codec_sample_t) * codec_buf_elements);

    dsp_proc_sdr.out_buf = malloc(sizeof(codec_sample_t) * codec_buf_elements);
    if(dsp_proc_sdr.out_buf) {
        memset(dsp_proc_sdr.out_buf, 0, sizeof(codec_sample_t) * codec_buf_elements);
    }

    dsp_proc_sdr.window = dsp_proc_sdr_hann_window(codec_buf_elements << 1);

    dsp_proc_sdr.magnitude = malloc(sizeof(float32_t) * (codec_buf_elements << 1));
    memset(dsp_proc_sdr.magnitude, 0, sizeof(float32_t) * (codec_buf_elements << 1));
    dsp_proc_sdr.magnitude_iterations = 0;
    app_handle->ctl_state->spectrum.data = malloc(sizeof(float32_t) * (codec_buf_elements << 1));
    app_handle->ctl_state->spectrum.elements = codec_buf_elements << 1;
    app_handle->ctl_state->spectrum.iterarions = 0;
    app_handle->ctl_state->spectrum.valid = false;

    arm_cfft_init_f32(&dsp_proc_sdr.cfft, codec_buf_elements << 1);
    dsp_proc_sdr.state = DSP_PROC_SDR_END;
    dsp_proc_sdr.transmission = app_handle->ctl_state->transmission;
    dsp_proc_sdr.modulation = app_handle->settings->sdr_modulation;
    dsp_proc_sdr.dco_frequency = app_handle->settings->dco_frequency;

}

void dsp_proc_sdr_unset(app_handle_t * app_handle) {

    DBG_OUT("deinit SDR process");

    app_handle->ctl_state->spectrum.valid = false;
    app_handle->ctl_state->spectrum.elements = 0;
    if(app_handle->ctl_state->spectrum.data) {
        free(app_handle->ctl_state->spectrum.data);
    }

    if(dsp_proc_sdr.magnitude) {
        free(dsp_proc_sdr.magnitude);
        dsp_proc_sdr.magnitude = NULL;
    }

    if(dsp_proc_sdr.window) {
        free(dsp_proc_sdr.window);
        dsp_proc_sdr.window = NULL;
    }

    if(dsp_proc_sdr.out_buf) {
        free(dsp_proc_sdr.out_buf);
        dsp_proc_sdr.out_buf = NULL;
    }

    if(dsp_proc_sdr.inp_buf) {
        free(dsp_proc_sdr.inp_buf);
        dsp_proc_sdr.inp_buf = NULL;
    }
    if(dsp_proc_sdr.fft_buf) {
        free(dsp_proc_sdr.fft_buf);
        dsp_proc_sdr.fft_buf = NULL;
    }
}

void dsp_proc_sdr_routine(app_handle_t * app_handle) {

    if(dsp_proc_sdr.fft_buf && dsp_proc_sdr.inp_buf && dsp_proc_sdr.out_buf && dsp_proc_sdr.window && dsp_proc_sdr.magnitude) {

        codec_sample_t * buf = codec_get_audio_buf();

        if(dsp_proc_sdr.transmission != app_handle->ctl_state->transmission) {
            dsp_proc_sdr.state = DSP_PROC_SDR_END;
        }
        if(dsp_proc_sdr.modulation != app_handle->settings->sdr_modulation) {
            dsp_proc_sdr.state = DSP_PROC_SDR_END;
        }
        if(dsp_proc_sdr.dco_frequency != app_handle->settings->dco_frequency) {
            dsp_proc_sdr.state = DSP_PROC_SDR_END;
            memset(dsp_proc_sdr.magnitude, 0, sizeof(float32_t) * (codec_buf_elements << 1));
            dsp_proc_sdr.magnitude_iterations = 0;
        }

        switch(dsp_proc_sdr.state) {
        case DSP_PROC_SDR_END:

            for(uint16_t i = 0; i < codec_buf_elements; i++) {
                if(dsp_proc_sdr.transmission) {
                    buf[i].left  = dsp_proc_sdr.out_buf[i].left;
                    buf[i].right = dsp_proc_sdr.out_buf[i].right;
                } else {
                    buf[i].left  = dsp_proc_sdr.out_buf[i].left;
                    buf[i].right = dsp_proc_sdr.out_buf[i].left;
                }
                dsp_proc_sdr.out_buf[i].left  = 0;
                dsp_proc_sdr.out_buf[i].right = 0;
            }
            dsp_proc_sdr.state = DSP_PROC_SDR_START;

            break;
        case DSP_PROC_SDR_START:

            for(uint16_t i = 0; i < codec_buf_elements; i++) {
                if(dsp_proc_sdr.transmission) {
                    dsp_proc_sdr.inp_buf[i].left = (buf[i].left >> 1) + (buf[i].right >> 1);
                    dsp_proc_sdr.inp_buf[i].right = 0;
                    buf[i].left  = dsp_proc_sdr.out_buf[i].left;
                    buf[i].right = dsp_proc_sdr.out_buf[i].right;

                } else {
                    dsp_proc_sdr.inp_buf[i].left  = buf[i].left;
                    dsp_proc_sdr.inp_buf[i].right = buf[i].right;
                    buf[i].left  = dsp_proc_sdr.out_buf[i].left;
                    buf[i].right = dsp_proc_sdr.out_buf[i].left;
                }
                dsp_proc_sdr.out_buf[i].left  = 0;
                dsp_proc_sdr.out_buf[i].right = 0;
            }
            dsp_proc_sdr.state = DSP_PROC_SDR_CONTINUE;

            break;
        case DSP_PROC_SDR_CONTINUE:

            for(uint16_t i = 0; i < codec_buf_elements; i++) {

                codec_sample_t sample;
                if(dsp_proc_sdr.transmission) {
                    sample.left = (buf[i].left >> 1) + (buf[i].right >> 1);
                    sample.right = 0;
                } else {
                    sample.left = buf[i].left;
                    sample.right = buf[i].right;
                }

                dsp_proc_sdr.fft_buf[i].re = dsp_proc_sdr.window[i] * dsp_proc_sdr.inp_buf[i].left;
                dsp_proc_sdr.fft_buf[i].im = dsp_proc_sdr.window[i] * dsp_proc_sdr.inp_buf[i].right;

                dsp_proc_sdr.fft_buf[codec_buf_elements + i].re = dsp_proc_sdr.window[codec_buf_elements + i] * sample.left;
                dsp_proc_sdr.fft_buf[codec_buf_elements + i].im = dsp_proc_sdr.window[codec_buf_elements + i] * sample.right;

                dsp_proc_sdr.inp_buf[i].left = sample.left;
                dsp_proc_sdr.inp_buf[i].right = sample.right;
            }

            arm_cfft_f32(&dsp_proc_sdr.cfft, (float32_t *)dsp_proc_sdr.fft_buf, 0, 1);

            if(dsp_proc_sdr.magnitude_iterations < (uint16_t)-1) {
                for(uint16_t i = 0; i < codec_buf_elements << 1; i++) {
                    float32_t tmp;
                    (void)arm_sqrt_f32(dsp_proc_sdr.fft_buf[i].re * dsp_proc_sdr.fft_buf[i].re + dsp_proc_sdr.fft_buf[i].im * dsp_proc_sdr.fft_buf[i].im, &tmp);
                    dsp_proc_sdr.magnitude[i] += tmp;
                }
                dsp_proc_sdr.magnitude_iterations++;
            }

            if(!app_handle->ctl_state->spectrum.valid && app_handle->ctl_state->spectrum.data) {
                app_handle->ctl_state->spectrum.iterarions = dsp_proc_sdr.magnitude_iterations;
                memcpy(app_handle->ctl_state->spectrum.data, dsp_proc_sdr.magnitude, sizeof(float32_t) * app_handle->ctl_state->spectrum.elements);
                app_handle->ctl_state->spectrum.valid = true;

                memset(dsp_proc_sdr.magnitude, 0, sizeof(float32_t) * (codec_buf_elements << 1));
                dsp_proc_sdr.magnitude_iterations = 0;
            }

            switch(dsp_proc_sdr.modulation) {
            case APP_SETTINGS_MODULATION_LSB: {

                uint16_t index_lo = ((uint32_t)app_handle->settings->sdr_bpf_lsb.low_hz *  (codec_buf_elements << 1)) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];
                uint16_t index_hi = ((uint32_t)app_handle->settings->sdr_bpf_lsb.high_hz * (codec_buf_elements << 1)) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];

                dsp_proc_sdr.fft_buf[0].re = 0;
                dsp_proc_sdr.fft_buf[0].im = 0;

                for(uint16_t i = 1; i < index_lo; i++) {
                    dsp_proc_sdr.fft_buf[i].re = 0;
                    dsp_proc_sdr.fft_buf[i].im = 0;
                }

                if(dsp_proc_sdr.transmission) {
                    for(uint16_t i = index_lo; i < index_hi; i++) {
                        dsp_proc_sdr.fft_buf[i].re *= 2;
                        dsp_proc_sdr.fft_buf[i].im *= 2;
                    }
                }

                for(uint16_t i = index_hi; i < codec_buf_elements << 1; i++) {
                    dsp_proc_sdr.fft_buf[i].re = 0;
                    dsp_proc_sdr.fft_buf[i].im = 0;
                }

                arm_cfft_f32(&dsp_proc_sdr.cfft, (float32_t *)dsp_proc_sdr.fft_buf, 1, 1);

            }
            break;

            case APP_SETTINGS_MODULATION_USB: {

                uint16_t index_lo = ((uint32_t)app_handle->settings->sdr_bpf_usb.low_hz *  (codec_buf_elements << 1)) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];
                uint16_t index_hi = ((uint32_t)app_handle->settings->sdr_bpf_usb.high_hz * (codec_buf_elements << 1)) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];

                dsp_proc_sdr.fft_buf[0].re = 0;
                dsp_proc_sdr.fft_buf[0].im = 0;

                for(uint16_t i = (codec_buf_elements << 1) - 1; i > (codec_buf_elements << 1) - index_lo; i--) {
                    dsp_proc_sdr.fft_buf[i].re = 0;
                    dsp_proc_sdr.fft_buf[i].im = 0;
                }

                if(dsp_proc_sdr.transmission) {
                    for(uint16_t i = (codec_buf_elements << 1) - index_lo; i > (codec_buf_elements << 1) - index_hi; i--) {
                        dsp_proc_sdr.fft_buf[i].re *= 2;
                        dsp_proc_sdr.fft_buf[i].im *= 2;
                    }
                }

                for(uint16_t i = (codec_buf_elements << 1) - index_hi; i > 0; i--) {
                    dsp_proc_sdr.fft_buf[i].re = 0;
                    dsp_proc_sdr.fft_buf[i].im = 0;
                }

                arm_cfft_f32(&dsp_proc_sdr.cfft, (float32_t *)dsp_proc_sdr.fft_buf, 1, 1);

            }
            break;

            case APP_SETTINGS_MODULATION_AM: {
                memset(dsp_proc_sdr.fft_buf, 0, sizeof(complex_f32_t) * (codec_buf_elements << 1)); /* Not implemented */
            }
            break;

            case APP_SETTINGS_MODULATION_NFM: {
                memset(dsp_proc_sdr.fft_buf, 0, sizeof(complex_f32_t) * (codec_buf_elements << 1)); /* Not implemented */
            }
            break;

            default: {
                memset(dsp_proc_sdr.fft_buf, 0, sizeof(complex_f32_t) * (codec_buf_elements << 1));
            }
            break;

            }

            for(uint16_t i = 0; i < codec_buf_elements; i++) {

                if(dsp_proc_sdr.transmission) {
                    buf[i].left  = dsp_proc_sdr.out_buf[i].left  + (int16_t)dsp_proc_sdr.fft_buf[i].re;
                    buf[i].right = dsp_proc_sdr.out_buf[i].right + (int16_t)dsp_proc_sdr.fft_buf[i].im;
                } else {
                    buf[i].left  = dsp_proc_sdr.out_buf[i].left + (int16_t)dsp_proc_sdr.fft_buf[i].re;
                    buf[i].right = dsp_proc_sdr.out_buf[i].left + (int16_t)dsp_proc_sdr.fft_buf[i].re;
                }
                dsp_proc_sdr.out_buf[i].left = (int16_t)dsp_proc_sdr.fft_buf[codec_buf_elements + i].re;
                dsp_proc_sdr.out_buf[i].right = (int16_t)dsp_proc_sdr.fft_buf[codec_buf_elements + i].im;
            }

            break;
        default:
            break;
        }

        dsp_proc_sdr.transmission = app_handle->ctl_state->transmission;
        dsp_proc_sdr.modulation = app_handle->settings->sdr_modulation;
        dsp_proc_sdr.dco_frequency = app_handle->settings->dco_frequency;
    }
}


static float32_t * dsp_proc_sdr_hann_window(uint16_t size) {

    float32_t * p = malloc(sizeof(float32_t) * size);

    for(size_t i = 0; i < size / 2 + size % 2; i++) {
        p[i] = 0.5f - 0.5f * cosf(2.0f * PI * i / (size - 1));
    }
    for(size_t i = 0; i < size / 2; i++) {
        p[size - 1 - i] = p[i];
    }

    return p;
}
