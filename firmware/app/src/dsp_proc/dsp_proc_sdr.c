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
#include "dsp_agc.h"
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

static const uint16_t dsp_proc_sdr_rx_inp_ref = (0.85f * INT16_MAX);

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
    dsp_agc_q15_t           agc_inp;
} dsp_proc_sdr = {
    .fft_buf = NULL,
    .inp_buf = NULL,
    .out_buf = NULL,
    .window  = NULL,
};


static inline float32_t *   dsp_proc_sdr_hann_window(uint16_t size)                                             __attribute__((always_inline));
static inline void          dsp_proc_sdr_modem(volatile app_handle_t * app_handle)                              __attribute__((always_inline));
static inline void          dsp_proc_sdr_rx_gain(volatile app_handle_t * app_handle, float gain)                __attribute__((always_inline));


void dsp_proc_sdr_set(volatile app_handle_t * app_handle) {

    DBG_OUT("init SDR process");

    dsp_proc_sdr.fft_buf = malloc(sizeof(complex_f32_t) * (codec_buf_elements << 1));

    dsp_proc_sdr.inp_buf = malloc(sizeof(codec_sample_t) * codec_buf_elements);

    dsp_proc_sdr.out_buf = malloc(sizeof(codec_sample_t) * codec_buf_elements);
    if(dsp_proc_sdr.out_buf) {
        memset(dsp_proc_sdr.out_buf, 0, sizeof(codec_sample_t) * codec_buf_elements);
    }

    dsp_proc_sdr.window = dsp_proc_sdr_hann_window(codec_buf_elements << 1);

    dsp_proc_sdr.magnitude = malloc(sizeof(float32_t) * (codec_buf_elements << 1));
    if(dsp_proc_sdr.magnitude) {
        memset(dsp_proc_sdr.magnitude, 0, sizeof(float32_t) * (codec_buf_elements << 1));
    }
    dsp_proc_sdr.magnitude_iterations = 0;

    app_handle->ctl_state->spectrum.data = malloc(sizeof(float32_t) * (codec_buf_elements << 1));
    app_handle->ctl_state->spectrum.elements = codec_buf_elements << 1;
    app_handle->ctl_state->spectrum.iterarions = 0;
    app_handle->ctl_state->spectrum.valid = false;

    (void)arm_cfft_init_f32(&dsp_proc_sdr.cfft, codec_buf_elements << 1);
    dsp_proc_sdr.state = DSP_PROC_SDR_END;
    dsp_proc_sdr.transmission = app_handle->ctl_state->transmission;
    dsp_proc_sdr.modulation = app_handle->settings->sdr_modulation;
    dsp_proc_sdr.dco_frequency = app_handle->settings->dco_frequency;

    uint16_t settle_down_it = ((uint64_t)dsp_proc_sdr_sr[app_handle->settings->codec_samplerate] * app_handle->settings->sdr_agc_tmieout_ms) / (1000UL * codec_buf_elements);
    dsp_agc_q15_init(&dsp_proc_sdr.agc_inp, dsp_proc_sdr_rx_inp_ref, settle_down_it);
}

void dsp_proc_sdr_unset(volatile app_handle_t * app_handle) {

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

void dsp_proc_sdr_routine(volatile app_handle_t * app_handle) {

    if(dsp_proc_sdr.fft_buf && dsp_proc_sdr.inp_buf && dsp_proc_sdr.out_buf && dsp_proc_sdr.window && dsp_proc_sdr.magnitude) {

        volatile codec_sample_t * const buf = codec_get_audio_buf();

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

                codec_sample_t sample;
                if(dsp_proc_sdr.transmission) {
                    sample.left = (buf[i].left >> 1) + (buf[i].right >> 1);
                    sample.right = 0;
                    buf[i].left  = dsp_proc_sdr.out_buf[i].left;
                    buf[i].right = dsp_proc_sdr.out_buf[i].right;
                } else {
                    sample.left  = buf[i].left;
                    sample.right = buf[i].right;
                    buf[i].left  = dsp_proc_sdr.out_buf[i].left;
                    buf[i].right = dsp_proc_sdr.out_buf[i].left;

                    dsp_agc_q15_data(&dsp_proc_sdr.agc_inp, &sample);
                }

                dsp_proc_sdr.out_buf[i].left  = 0;
                dsp_proc_sdr.out_buf[i].right = 0;

                dsp_proc_sdr.inp_buf[i].left = sample.left;
                dsp_proc_sdr.inp_buf[i].right = sample.right;
            }
            dsp_proc_sdr.state = DSP_PROC_SDR_CONTINUE;

            break;
        case DSP_PROC_SDR_CONTINUE:

            /* prepare input ADC data to do FFT */
            for(uint16_t i = 0; i < codec_buf_elements; i++) {

                codec_sample_t sample;
                if(dsp_proc_sdr.transmission) {
                    sample.left = (buf[i].left >> 1) + (buf[i].right >> 1);
                    sample.right = 0;
                } else {
                    sample.left = buf[i].left;
                    sample.right = buf[i].right;

                    dsp_agc_q15_data(&dsp_proc_sdr.agc_inp, &sample);
                }

                dsp_proc_sdr.fft_buf[i].re = dsp_proc_sdr.window[i] * dsp_proc_sdr.inp_buf[i].left;
                dsp_proc_sdr.fft_buf[i].im = dsp_proc_sdr.window[i] * dsp_proc_sdr.inp_buf[i].right;

                dsp_proc_sdr.fft_buf[codec_buf_elements + i].re = dsp_proc_sdr.window[codec_buf_elements + i] * sample.left;
                dsp_proc_sdr.fft_buf[codec_buf_elements + i].im = dsp_proc_sdr.window[codec_buf_elements + i] * sample.right;

                dsp_proc_sdr.inp_buf[i].left = sample.left;
                dsp_proc_sdr.inp_buf[i].right = sample.right;
            }

            /* do FFT using input ADC data */
            arm_cfft_f32(&dsp_proc_sdr.cfft, (float32_t *)dsp_proc_sdr.fft_buf, 0, 1);

            /* prepare waterfall data to UI */
            if(!dsp_proc_sdr.transmission) {
                /* mean spectrum data */
                if(dsp_proc_sdr.magnitude_iterations < (uint16_t)-1) {
                    for(uint16_t i = 0; i < codec_buf_elements << 1; i++) {
                        float32_t tmp;
                        (void)arm_sqrt_f32(dsp_proc_sdr.fft_buf[i].re * dsp_proc_sdr.fft_buf[i].re + dsp_proc_sdr.fft_buf[i].im * dsp_proc_sdr.fft_buf[i].im, &tmp);
                        dsp_proc_sdr.magnitude[i] += tmp;
                    }
                    dsp_proc_sdr.magnitude_iterations++;
                }
                /* transmit spectrum data to UI if previous buffer processed by UI */
                if(!app_handle->ctl_state->spectrum.valid && app_handle->ctl_state->spectrum.data) {
                    app_handle->ctl_state->spectrum.iterarions = dsp_proc_sdr.magnitude_iterations;
                    memcpy(app_handle->ctl_state->spectrum.data, dsp_proc_sdr.magnitude, sizeof(float32_t) * app_handle->ctl_state->spectrum.elements);
                    app_handle->ctl_state->spectrum.valid = true;

                    memset(dsp_proc_sdr.magnitude, 0, sizeof(float32_t) * (codec_buf_elements << 1));
                    dsp_proc_sdr.magnitude_iterations = 0;
                }
            }

            /* modem processing: spectrum -> samples */
            dsp_proc_sdr_modem(app_handle);

            /* prepare output DAC data */
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

        dsp_proc_sdr_rx_gain(app_handle, dsp_agc_q15_gain(&dsp_proc_sdr.agc_inp));
    }
}


static inline float32_t * dsp_proc_sdr_hann_window(uint16_t size) {

    float32_t * p = malloc(sizeof(float32_t) * size);

    for(size_t i = 0; i < size / 2 + size % 2; i++) {
        p[i] = 0.5f - 0.5f * cosf(2.0f * PI * i / (size - 1));
    }
    for(size_t i = 0; i < size / 2; i++) {
        p[size - 1 - i] = p[i];
    }

    return p;
}

static inline void dsp_proc_sdr_modem(volatile app_handle_t * app_handle) {

    switch(dsp_proc_sdr.modulation) {
    case APP_SETTINGS_MODULATION_USB: {

        uint16_t index_lo = ((uint32_t)app_handle->settings->sdr_bpf_usb.low_hz *  (codec_buf_elements << 1)) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];
        uint16_t index_hi = ((uint32_t)app_handle->settings->sdr_bpf_usb.high_hz * (codec_buf_elements << 1)) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];

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

    case APP_SETTINGS_MODULATION_LSB: {

        uint16_t index_lo = ((uint32_t)app_handle->settings->sdr_bpf_lsb.low_hz *  (codec_buf_elements << 1)) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];
        uint16_t index_hi = ((uint32_t)app_handle->settings->sdr_bpf_lsb.high_hz * (codec_buf_elements << 1)) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];

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
        if(dsp_proc_sdr.transmission) {
            memset(dsp_proc_sdr.fft_buf, 0, sizeof(complex_f32_t) * (codec_buf_elements << 1));
        } else {
            static float32_t middle_value = 0;
            float32_t middle_alpha = 2000.f / ((float)dsp_proc_sdr_sr[app_handle->settings->codec_samplerate] * app_handle->settings->sdr_agc_tmieout_ms + 1000);

            uint16_t index_hi = ((uint32_t)app_handle->settings->sdr_bpf_am.high_hz * (codec_buf_elements << 1)) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];
            for(uint16_t i = index_hi + 1; i < (codec_buf_elements << 1) - index_hi; i++) {
                dsp_proc_sdr.fft_buf[i].re = 0;
                dsp_proc_sdr.fft_buf[i].im = 0;
            }
            arm_cfft_f32(&dsp_proc_sdr.cfft, (float32_t *)dsp_proc_sdr.fft_buf, 1, 1);

            for(uint16_t i = 0; i < (codec_buf_elements << 1); i++) {
                float32_t tmp;
                (void)arm_sqrt_f32(dsp_proc_sdr.fft_buf[i].re * dsp_proc_sdr.fft_buf[i].re + dsp_proc_sdr.fft_buf[i].im * dsp_proc_sdr.fft_buf[i].im, &tmp);
                middle_value = middle_alpha * tmp + (1.0f - middle_alpha) * middle_value;
                dsp_proc_sdr.fft_buf[i].re = tmp;
            }

            for(uint16_t i = 0; i < (codec_buf_elements << 1); i++) {
                dsp_proc_sdr.fft_buf[i].re -= middle_value;
                dsp_proc_sdr.fft_buf[i].im = 0;
            }
        }
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
}

static inline void dsp_proc_sdr_rx_gain(volatile app_handle_t * app_handle, float gain) {

    float32_t g = (log10f(gain) * 20 - CODEC_INPUT_GAIN_OFFSET) / CODEC_INPUT_GAIN_STEP;

    if(g <= 0) {
        app_handle->ctl_state->codec_rx_line_sensitivity.volume = 0;
    } else if (g >= CODEC_INPUT_MAX_VOLUME) {
        app_handle->ctl_state->codec_rx_line_sensitivity.volume = CODEC_INPUT_MAX_VOLUME;
    } else {
        app_handle->ctl_state->codec_rx_line_sensitivity.volume = (uint8_t)roundf(g);
    }
}
