/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#include "sdr.h"
#include <fftw.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>


#ifndef SDR_BUF_SIZE
#error SDR_BUF_SIZE not defined!
#elif ((SDR_BUF_SIZE) < 2) || ((SDR_BUF_SIZE) & ((SDR_BUF_SIZE) - 1))
#error SDR_BUF_SIZE invalid size!
#endif

#ifdef FFTW_ENABLE_FLOAT
#define cos(x)  cosf(x)
#endif

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif


static sdr_band_t sdr_band = sdr_LSB;
static size_t sdr_n_cut = SDR_BUF_SIZE;


extern const fftw_real * sdr_get_input_i_buffer(void);
extern const fftw_real * sdr_get_input_q_buffer(void);
extern void sdr_set_spectrum(const fftw_real * data);
extern void sdr_set_output_i_buffer(const fftw_real * data);
extern void sdr_set_output_q_buffer(const fftw_real * data);


static fftw_real * sdr_hann_window(size_t N);


void sdr_routine(void) {

    fftw_real    * window           = sdr_hann_window((SDR_BUF_SIZE) << 1);
    fftw_complex * buf_time         = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * ((SDR_BUF_SIZE) << 1));
    fftw_complex * buf_frequency    = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * ((SDR_BUF_SIZE) << 1));
    fftw_real    * spectrum         = (fftw_real *)malloc(sizeof(fftw_real) * ((SDR_BUF_SIZE) << 1));
    fftw_plan p_fwd = fftw_create_plan(((SDR_BUF_SIZE) << 1), FFTW_FORWARD, FFTW_ESTIMATE);
    fftw_plan p_rew = fftw_create_plan(((SDR_BUF_SIZE) << 1), FFTW_BACKWARD, FFTW_ESTIMATE);

    fftw_real    * buf_ii_tmp       = (fftw_real *)malloc(sizeof(fftw_real) * (SDR_BUF_SIZE));
    fftw_real    * buf_iq_tmp       = (fftw_real *)malloc(sizeof(fftw_real) * (SDR_BUF_SIZE));
    fftw_real    * buf_oi_tmp       = (fftw_real *)malloc(sizeof(fftw_real) * (SDR_BUF_SIZE));
    fftw_real    * buf_oq_tmp       = (fftw_real *)malloc(sizeof(fftw_real) * (SDR_BUF_SIZE));

    memset(buf_oi_tmp, 0, sizeof(fftw_real) * (SDR_BUF_SIZE));
    memset(buf_oq_tmp, 0, sizeof(fftw_real) * (SDR_BUF_SIZE));

    const fftw_real * ini = sdr_get_input_i_buffer();
    const fftw_real * inq = sdr_get_input_q_buffer();
    if(ini && inq) {
        for(size_t i = 0; i < (SDR_BUF_SIZE); i++) {
            buf_ii_tmp[i] = ini[i];
            buf_iq_tmp[i] = inq[i];
        }
        for(;;) {
            ini = sdr_get_input_i_buffer();
            inq = sdr_get_input_q_buffer();
            if(ini && inq) {
                for(size_t i = 0; i < (SDR_BUF_SIZE); i++) {
                    buf_time[i].re = buf_ii_tmp[i] * window[i];
                    buf_time[(SDR_BUF_SIZE) + i].re = ini[i] * window[(SDR_BUF_SIZE) + i];
                    buf_time[i].im = buf_iq_tmp[i] * window[i];
                    buf_time[(SDR_BUF_SIZE) + i].im = inq[i] * window[(SDR_BUF_SIZE) + i];
                    buf_ii_tmp[i] = ini[i];
                    buf_iq_tmp[i] = inq[i];
                }

                fftw_one(p_fwd, buf_time, buf_frequency);

                for(size_t i = 0; i < ((SDR_BUF_SIZE) << 1); i++) {
                    spectrum[i] = sqrt(buf_frequency[i].re * buf_frequency[i].re + buf_frequency[i].im * buf_frequency[i].im) / ((SDR_BUF_SIZE) >> 1);
                }
                sdr_set_spectrum(spectrum);

                /* LPF */
                for(size_t i = sdr_n_cut + 1; i < SDR_BUF_SIZE; i++) {
                    buf_frequency[i].re = 0;
                    buf_frequency[i].im = 0;
                }

                /* phase shift by Pi/2 */
                if(sdr_band == sdr_USB) {
                    for(size_t i = 1; i < (SDR_BUF_SIZE); i++) {
                        buf_frequency[i].re *= 2;
                        buf_frequency[i].im *= 2;
                        buf_frequency[(SDR_BUF_SIZE) + i].re = 0;
                        buf_frequency[(SDR_BUF_SIZE) + i].im = 0;
                    }
                } else {
                    for(size_t i = 1; i < (SDR_BUF_SIZE); i++) {
                        buf_frequency[i].re = 0;
                        buf_frequency[i].im = 0;
                        buf_frequency[(SDR_BUF_SIZE) + i].re *= 2;
                        buf_frequency[(SDR_BUF_SIZE) + i].im *= 2;
                    }
                }

                // Next lines just to test filter
                // for(size_t i = 0; i < ((SDR_BUF_SIZE) << 1); i++) {
                //     spectrum[i] = sqrt(buf_frequency[i].re * buf_frequency[i].re + buf_frequency[i].im * buf_frequency[i].im) / ((SDR_BUF_SIZE) >> 1);
                // }
                // sdr_set_spectrum(spectrum);

                fftw_one(p_rew, buf_frequency, buf_time);

                for(size_t i = 0; i < (SDR_BUF_SIZE); i++) {
                    buf_oi_tmp[i] += buf_time[i].re / ((SDR_BUF_SIZE) << 1);
                    buf_oq_tmp[i] += buf_time[i].im / ((SDR_BUF_SIZE) << 1);
                }
                sdr_set_output_i_buffer(buf_oi_tmp);
                sdr_set_output_q_buffer(buf_oq_tmp);
                for(size_t i = 0; i < (SDR_BUF_SIZE); i++) {
                    buf_oi_tmp[i] = buf_time[(SDR_BUF_SIZE) + i].re / ((SDR_BUF_SIZE) << 1);
                    buf_oq_tmp[i] = buf_time[(SDR_BUF_SIZE) + i].im / ((SDR_BUF_SIZE) << 1);
                }
            } else {
                sdr_set_output_i_buffer(buf_oi_tmp);
                sdr_set_output_q_buffer(buf_oq_tmp);
                break;
            }
        }
    }

    free(buf_oq_tmp);
    free(buf_oi_tmp);
    free(buf_iq_tmp);
    free(buf_ii_tmp);

    fftw_destroy_plan(p_rew);
    fftw_destroy_plan(p_fwd);
    free(spectrum);
    fftw_free(buf_frequency);
    fftw_free(buf_time);
    free(window);
}

void sdr_set_band(sdr_band_t band) {
    sdr_band = band;
}

void sdr_set_fcut(size_t n_cut) {
    sdr_n_cut = n_cut;
}


fftw_real * sdr_hann_window(size_t N) {
    fftw_real * p = (fftw_real *)malloc(sizeof(fftw_real) * N);
    for(size_t i = 0; i < N/2 + N%2; i++) {
        p[i] = 0.5 - 0.5*cos(2.*M_PI * i/(N - 1));
    }
    for(size_t i = 0; i < N/2; i++) {
        p[N - 1 - i] = p[i];
    }

    return p;
}
