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

static const uint16_t dsp_proc_sdr_rx_inp_ref = ((1.0f / sqrtf(2.0f)) * INT16_MAX);
static const uint16_t dsp_proc_sdr_rx_out_ref = ((1.0f / sqrtf(2.0f)) * INT16_MAX);
static const uint16_t dsp_proc_sdr_tx_out_ref = ((1.0f / sqrtf(2.0f)) * INT16_MAX);


static struct {
    arm_cfft_instance_f32   cfft;
    complex_f32_t *         fft_buf;
    codec_sample_t *        inp_buf;
    complex_f32_t *         out_buf;
    float32_t *             window;

    float32_t *             magnitude;
    uint16_t                magnitude_iterations;

    enum {
        DSP_PROC_SDR_START,
        DSP_PROC_SDR_CONTINUE,
        DSP_PROC_SDR_END
    }                       state;

    bool                    transmission;
    sdr_modulation_t        modulation;
    uint32_t                dco_frequency;

    /*See https://en.wikipedia.org/wiki/Moving_average#Exponential_moving_average */
    float32_t               ac_alpha;
    float32_t               inp_rx_gain;
    float32_t               out_rx_offset;
    float32_t               out_rx_gain;
    float32_t               out_tx_gain;
} dsp_proc_sdr = {
    .fft_buf   = NULL,
    .inp_buf   = NULL,
    .out_buf   = NULL,
    .window    = NULL,
    .magnitude = NULL
};


static inline float32_t *   dsp_proc_sdr_hann_window(uint16_t size)                                             __attribute__((always_inline));
static inline void          dsp_proc_sdr_modem(volatile app_handle_t * app_handle)                              __attribute__((always_inline));
static inline void          dsp_proc_sdr_rx_gain(volatile app_handle_t * app_handle, float gain)                __attribute__((always_inline));
static inline int16_t       float32_to_int16(float32_t x)                                                       __attribute__((always_inline));


void dsp_proc_sdr_set(volatile app_handle_t * app_handle) {

    DBG_OUT("init SDR process");

    dsp_proc_sdr.fft_buf = malloc(sizeof(complex_f32_t) * (codec_buf_elements << 1));

    dsp_proc_sdr.inp_buf = malloc(sizeof(codec_sample_t) * codec_buf_elements);

    dsp_proc_sdr.out_buf = malloc(sizeof(complex_f32_t) * codec_buf_elements);
    if(dsp_proc_sdr.out_buf) {
        memset(dsp_proc_sdr.out_buf, 0, sizeof(complex_f32_t) * codec_buf_elements);
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

    dsp_proc_sdr.ac_alpha = (2000.0f * codec_buf_elements) / ((float32_t)app_handle->settings->sdr_agc_tmieout_ms * dsp_proc_sdr_sr[app_handle->settings->codec_samplerate] + 1000.0f * codec_buf_elements);
    dsp_proc_sdr.inp_rx_gain = 1.0f;
    dsp_proc_sdr.out_rx_offset = 0.0f;
    dsp_proc_sdr.out_rx_gain = 1.0f;
    dsp_proc_sdr.out_tx_gain = 1.0f;

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

        if(dsp_proc_sdr.transmission  != app_handle->ctl_state->transmission) {
            dsp_proc_sdr.state = DSP_PROC_SDR_END;
        }
        if(dsp_proc_sdr.modulation    != app_handle->settings->sdr_modulation) {
            dsp_proc_sdr.state = DSP_PROC_SDR_END;
        }
        if(dsp_proc_sdr.dco_frequency != app_handle->settings->dco_frequency) {
            dsp_proc_sdr.state = DSP_PROC_SDR_END;
            memset(dsp_proc_sdr.magnitude, 0, sizeof(float32_t) * (codec_buf_elements << 1));
            dsp_proc_sdr.magnitude_iterations = 0;
        }

        if(dsp_proc_sdr.state == DSP_PROC_SDR_END) {

            /* reset FFT result*/
            memset(dsp_proc_sdr.fft_buf, 0, sizeof(complex_f32_t) * (codec_buf_elements << 1));
            dsp_proc_sdr.state = DSP_PROC_SDR_START;

        } else {

            /* prepare input ADC data */
            complex_f32_t inp_rx_rms = {.re = 0, .im = 0};
            for(uint16_t i = 0; i < codec_buf_elements; i++) {

                codec_sample_t sample = {
                    .left  = dsp_proc_sdr.transmission ? (buf[i].left >> 1) + (buf[i].right >> 1) : buf[i].left,
                    .right = dsp_proc_sdr.transmission ? 0                                        : buf[i].right
                };

                if(!dsp_proc_sdr.transmission) {
                    inp_rx_rms.re += (uint32_t)sample.left  * sample.left;
                    inp_rx_rms.im += (uint32_t)sample.right * sample.right;
                }

                if(dsp_proc_sdr.state == DSP_PROC_SDR_CONTINUE) {

                    dsp_proc_sdr.fft_buf[i].re = dsp_proc_sdr.window[i] * dsp_proc_sdr.inp_buf[i].left;
                    dsp_proc_sdr.fft_buf[i].im = dsp_proc_sdr.window[i] * dsp_proc_sdr.inp_buf[i].right;

                    dsp_proc_sdr.fft_buf[codec_buf_elements + i].re = dsp_proc_sdr.window[codec_buf_elements + i] * sample.left;
                    dsp_proc_sdr.fft_buf[codec_buf_elements + i].im = dsp_proc_sdr.window[codec_buf_elements + i] * sample.right;

                }

                dsp_proc_sdr.inp_buf[i].left  = sample.left;
                dsp_proc_sdr.inp_buf[i].right = sample.right;

            }

            if(!dsp_proc_sdr.transmission) {
                float32_t rx_gain = (float32_t)dsp_proc_sdr_rx_inp_ref / sqrtf(((inp_rx_rms.re > inp_rx_rms.im) ? inp_rx_rms.re : inp_rx_rms.im) / codec_buf_elements);
                dsp_proc_sdr.inp_rx_gain = dsp_proc_sdr.ac_alpha * rx_gain + (1.0f - dsp_proc_sdr.ac_alpha) * dsp_proc_sdr.inp_rx_gain;
                dsp_proc_sdr_rx_gain(app_handle, dsp_proc_sdr.inp_rx_gain);
            }

            if(dsp_proc_sdr.state == DSP_PROC_SDR_CONTINUE) {

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

            }

            dsp_proc_sdr.state = DSP_PROC_SDR_CONTINUE;

        }

        /* prepare output DAC data */
        float32_t out_rx_mean = 0, out_rx_rms = 0;
        complex_f32_t out_tx_rms = {.re = 0, .im = 0};
        for(uint16_t i = 0; i < codec_buf_elements; i++) {

            if(dsp_proc_sdr.transmission) {
                complex_f32_t sample = {
                    .re = (dsp_proc_sdr.out_buf[i].re + dsp_proc_sdr.fft_buf[i].re) * dsp_proc_sdr.out_tx_gain,
                    .im = (dsp_proc_sdr.out_buf[i].im + dsp_proc_sdr.fft_buf[i].im) * dsp_proc_sdr.out_tx_gain
                };
                buf[i].left  = float32_to_int16(sample.re);
                buf[i].right = float32_to_int16(sample.im);
                out_tx_rms.re += sample.re * sample.re;
                out_tx_rms.im += sample.im * sample.im;
            } else {
                float32_t sample = (dsp_proc_sdr.out_buf[i].re + dsp_proc_sdr.fft_buf[i].re) * dsp_proc_sdr.out_rx_gain - dsp_proc_sdr.out_rx_offset;
                out_rx_mean += sample;
                out_rx_rms += sample * sample;
                buf[i].right = buf[i].left  = float32_to_int16(sample);
            }
            dsp_proc_sdr.out_buf[i].re = (int16_t)dsp_proc_sdr.fft_buf[codec_buf_elements + i].re;
            dsp_proc_sdr.out_buf[i].im = (int16_t)dsp_proc_sdr.fft_buf[codec_buf_elements + i].im;
        }

        if(dsp_proc_sdr.transmission) {
            float32_t tx_gain = (float32_t)dsp_proc_sdr_tx_out_ref / sqrtf(((out_tx_rms.re > out_tx_rms.im) ? out_tx_rms.re : out_tx_rms.im) / codec_buf_elements);
            if(tx_gain < 10) {
                dsp_proc_sdr.out_tx_gain = dsp_proc_sdr.ac_alpha * tx_gain + (1.0f - dsp_proc_sdr.ac_alpha) * dsp_proc_sdr.out_tx_gain;
            }
        } else {
            out_rx_mean /= codec_buf_elements;
            dsp_proc_sdr.out_rx_offset = dsp_proc_sdr.ac_alpha * out_rx_mean + (1.0f - dsp_proc_sdr.ac_alpha) * dsp_proc_sdr.out_rx_offset;

            float32_t rx_gain = (float32_t)dsp_proc_sdr_rx_out_ref / sqrtf(out_rx_rms / codec_buf_elements);
            if(rx_gain < 10) {
                dsp_proc_sdr.out_rx_gain = dsp_proc_sdr.ac_alpha * rx_gain + (1.0f - dsp_proc_sdr.ac_alpha) * dsp_proc_sdr.out_rx_gain;
            }
        }

        dsp_proc_sdr.transmission  = app_handle->ctl_state->transmission;
        dsp_proc_sdr.modulation    = app_handle->settings->sdr_modulation;
        dsp_proc_sdr.dco_frequency = app_handle->settings->dco_frequency;

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

            uint16_t index_hi = ((uint32_t)app_handle->settings->sdr_bpf_am.high_hz * (codec_buf_elements << 1)) / dsp_proc_sdr_sr[app_handle->settings->codec_samplerate];
            for(uint16_t i = index_hi + 1; i < (codec_buf_elements << 1) - index_hi; i++) {
                dsp_proc_sdr.fft_buf[i].re = 0;
                dsp_proc_sdr.fft_buf[i].im = 0;
            }
            arm_cfft_f32(&dsp_proc_sdr.cfft, (float32_t *)dsp_proc_sdr.fft_buf, 1, 1);

            for(uint16_t i = 0; i < (codec_buf_elements << 1); i++) {
                float32_t tmp;
                (void)arm_sqrt_f32(dsp_proc_sdr.fft_buf[i].re * dsp_proc_sdr.fft_buf[i].re + dsp_proc_sdr.fft_buf[i].im * dsp_proc_sdr.fft_buf[i].im, &tmp);
                dsp_proc_sdr.fft_buf[i].re = tmp;
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

static inline int16_t float32_to_int16(float32_t x) {

    int16_t result;
    if(x >= INT16_MAX) {
        result = INT16_MAX;
    } else if (x <= INT16_MIN) {
        result = INT16_MIN;
    } else {
        result = (int16_t)x;
    }
    return result;
}
