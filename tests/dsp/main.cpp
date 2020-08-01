/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#include "safeout.h"
#include "CPlot2D.h"
#include <math.h>
#include <fftw.h>
#include <stdio.h>

double window_hann(size_t N, ssize_t i) {
    if(N < 2) {
        return 0.;
    }
    return 0.5 - 0.5*cos(2.*M_PI * i/(N - 1));
}

int main() {
    dbg::sout.set_dbg_level(dbg::DBG_INFO);
    dbg::sout.set_default_msg_level(dbg::DBG_INFO);
    dbg::sout << "DSP test application" << dbg::endl;

    if(gnuplot2d_t::check_gnuplot()) {

        const size_t Fs = 96000;
        const size_t Ft = 1000;
        const double At = 100;
        const size_t N  = 512;
        const size_t Num = 8;

        double * x = new(double[N * Num]);

        for(uint32_t i = 0; i < N * Num; i++) {
            x[i] = At * cos(2.*M_PI * Ft * i / Fs);
        }

        double * comp_i = new(double[N * Num]);
        double * comp_q = new(double[N * Num]);

        fftw_complex * buf_t = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * N);
        fftw_complex * buf_f = (fftw_complex *)fftw_malloc(sizeof(fftw_complex) * N);
        fftw_plan p_fwd = fftw_create_plan(N, FFTW_FORWARD, FFTW_ESTIMATE);
        fftw_plan p_rew = fftw_create_plan(N, FFTW_BACKWARD, FFTW_ESTIMATE);

        for(uint32_t i = 0; i < N/2; i++) {
            comp_i[i] = 0;
            comp_q[i] = 0;
        }

        for(uint32_t j = 0; j < Num*2; j++) {
            dbg::sout << "iteration" << dbg::endl;
            for(uint32_t i = 0; i < N; i++) {
                if(j * N/2 + i < N * Num) {
                    buf_t[i].re = x[j * N/2 + i] * window_hann(N, i);
                } else {
                    buf_t[i].re = 0;
                }
                buf_t[i].im = 0;
            }

            fftw_one(p_fwd, buf_t, buf_f);

            /* phase shift by Pi/2 */
            for(size_t i = 1; i < N/2 + N%2; i++) {
                buf_f[i].re *= 2;
                buf_f[i].im *= 2;
            }

            for(size_t i = N/2 + 1; i < N; i++) {
                buf_f[i].re = 0;
                buf_f[i].im = 0;
            }

            fftw_one(p_rew, buf_f, buf_t);
            for(uint32_t i = 0; i < N/2; i++) {
                if(j * N/2 + i < N * Num) {
                    comp_i[j * N/2 + i] += buf_t[i].re / N;
                    comp_q[j * N/2 + i] += buf_t[i].im / N;
                }
            }
            for(uint32_t i = N/2; i < N; i++) {
                if(j * N/2 + i < N * Num) {
                    comp_i[j * N/2 + i] = buf_t[i].re / N;
                    comp_q[j * N/2 + i] = buf_t[i].im / N;
                }
            }
        }

        fftw_destroy_plan(p_rew);
        fftw_destroy_plan(p_fwd);
        fftw_free(buf_f);
        fftw_free(buf_t);


        gnuplot2d_t plotOrig;
        plotOrig.set_title("Origin");
        plotOrig.set_color(0xFF00, "input");
        for(uint32_t i = 0; i < N * Num; i++) {
            plotOrig.add_point((double)i / Fs, x[i], "input");
        }
        plotOrig.draw();

        gnuplot2d_t plotRestored;
        plotRestored.set_title("Restored");
        plotRestored.set_color(0xFF, "component I");
        plotRestored.set_color(0xFF0000, "component Q");
        for(uint32_t i = 0; i < N * Num; i++) {
            plotRestored.add_point((double)i / Fs, comp_i[i], "component I");
            plotRestored.add_point((double)i / Fs, comp_q[i], "component Q");
        }
        plotRestored.draw();

        delete [] comp_q;
        delete [] comp_i;
        delete [] x;

    } else {
        dbg::sout << dbg::err << "gnuplot not detected on current system!" << dbg::endl;
    }

    dbg::sout << "Bye!" << dbg::endl;
    return 0;
}
