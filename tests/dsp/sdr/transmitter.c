/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#include "transmitter.h"
#include <fftw.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>


#ifndef SDR_TX_BUF_SIZE
#error SDR_TX_BUF_SIZE not defined!
#elif ((SDR_TX_BUF_SIZE) < 2) || ((SDR_TX_BUF_SIZE) & ((SDR_TX_BUF_SIZE) - 1))
#error SDR_TX_BUF_SIZE invalid size!
#endif

#ifdef FFTW_ENABLE_FLOAT
#define cos(x)  cosf(x)
#endif

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif


static transmitter_band_t transmitter_band = transmitter_LSB;
static size_t transmitter_n_cut = SDR_TX_BUF_SIZE;


extern const fftw_real * transmitter_get_input_buffer(void);
extern void transmitter_set_output_i_buffer(const fftw_real * data);
extern void transmitter_set_output_q_buffer(const fftw_real * data);


static fftw_real * transmitter_hann_window(size_t N);


void transmitter_routine(void) {

    fftw_real    * window           = transmitter_hann_window((SDR_TX_BUF_SIZE) << 1);
    fftw_complex * buf_time         = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * ((SDR_TX_BUF_SIZE) << 1));
    fftw_complex * buf_frequency    = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * ((SDR_TX_BUF_SIZE) << 1));
    fftw_plan p_fwd = fftw_create_plan(((SDR_TX_BUF_SIZE) << 1), FFTW_FORWARD, FFTW_ESTIMATE);
    fftw_plan p_rew = fftw_create_plan(((SDR_TX_BUF_SIZE) << 1), FFTW_BACKWARD, FFTW_ESTIMATE);

    fftw_real    * buf_in_tmp       = (fftw_real *)malloc(sizeof(fftw_real) * (SDR_TX_BUF_SIZE));
    fftw_real    * buf_oi_tmp       = (fftw_real *)malloc(sizeof(fftw_real) * (SDR_TX_BUF_SIZE));
    fftw_real    * buf_oq_tmp       = (fftw_real *)malloc(sizeof(fftw_real) * (SDR_TX_BUF_SIZE));

    memset(buf_oi_tmp, 0, sizeof(fftw_real) * (SDR_TX_BUF_SIZE));
    memset(buf_oq_tmp, 0, sizeof(fftw_real) * (SDR_TX_BUF_SIZE));

    const fftw_real * in = transmitter_get_input_buffer();
    if(in) {
        for(size_t i = 0; i < (SDR_TX_BUF_SIZE); i++) {
            buf_in_tmp[i] = in[i];
        }
        for(;;) {
            in = transmitter_get_input_buffer();
            if(in) {
                for(size_t i = 0; i < (SDR_TX_BUF_SIZE); i++) {
                    buf_time[i].re = buf_in_tmp[i] * window[i];
                    buf_time[(SDR_TX_BUF_SIZE) + i].re = in[i] * window[(SDR_TX_BUF_SIZE) + i];
                    buf_time[i].im = 0;
                    buf_time[(SDR_TX_BUF_SIZE) + i].im = 0;
                    buf_in_tmp[i] = in[i];
                }

                fftw_one(p_fwd, buf_time, buf_frequency);

                /* LPF */
                for(size_t i = transmitter_n_cut + 1; i < SDR_TX_BUF_SIZE; i++) {
                    buf_frequency[i].re = 0;
                    buf_frequency[i].im = 0;
                }

                /* phase shift by Pi/2 */
                for(size_t i = 1; i < (SDR_TX_BUF_SIZE); i++) {
                    buf_frequency[i].re *= 2;
                    buf_frequency[(SDR_TX_BUF_SIZE) + i].re = 0;
                    buf_frequency[i].im *= 2;
                    buf_frequency[(SDR_TX_BUF_SIZE) + i].im = 0;
                }

                fftw_one(p_rew, buf_frequency, buf_time);

                for(size_t i = 0; i < (SDR_TX_BUF_SIZE); i++) {
                    buf_oi_tmp[i] += buf_time[i].re / ((SDR_TX_BUF_SIZE) << 1);
                    buf_oq_tmp[i] += buf_time[i].im / ((SDR_TX_BUF_SIZE) << 1);
                }
                if(transmitter_band == transmitter_LSB) {
                    transmitter_set_output_i_buffer(buf_oi_tmp);
                    transmitter_set_output_q_buffer(buf_oq_tmp);
                } else {
                    transmitter_set_output_i_buffer(buf_oq_tmp);
                    transmitter_set_output_q_buffer(buf_oi_tmp);
                }
                for(size_t i = 0; i < (SDR_TX_BUF_SIZE); i++) {
                    buf_oi_tmp[i] = buf_time[(SDR_TX_BUF_SIZE) + i].re / ((SDR_TX_BUF_SIZE) << 1);
                    buf_oq_tmp[i] = buf_time[(SDR_TX_BUF_SIZE) + i].im / ((SDR_TX_BUF_SIZE) << 1);
                }
            } else {
                if(transmitter_band == transmitter_LSB) {
                    transmitter_set_output_i_buffer(buf_oi_tmp);
                    transmitter_set_output_q_buffer(buf_oq_tmp);
                } else {
                    transmitter_set_output_i_buffer(buf_oq_tmp);
                    transmitter_set_output_q_buffer(buf_oi_tmp);
                }
                break;
            }
        }
    }

    free(buf_oq_tmp);
    free(buf_oi_tmp);
    free(buf_in_tmp);

    fftw_destroy_plan(p_rew);
    fftw_destroy_plan(p_fwd);
    fftw_free(buf_frequency);
    fftw_free(buf_time);
    free(window);
}

void transmitter_set_band(transmitter_band_t band) {
    transmitter_band = band;
}

void transmitter_set_fcut(size_t n_cut) {
    transmitter_n_cut = n_cut;
}


fftw_real * transmitter_hann_window(size_t N) {
    fftw_real * p = (fftw_real *)malloc(sizeof(fftw_real) * N);
    for(size_t i = 0; i < N/2 + N%2; i++) {
        p[i] = 0.5 - 0.5*cos(2.*M_PI * i/(N - 1));
    }
    for(size_t i = 0; i < N/2; i++) {
        p[N - 1 - i] = p[i];
    }

    return p;
}
