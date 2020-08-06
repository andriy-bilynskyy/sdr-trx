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
#include "sdr.h"
#include <fftw.h>
#include <math.h>



#ifdef FFTW_ENABLE_FLOAT
#define cos(x)  cosf(x)
#endif


gnuplot2d_t plot_input;
gnuplot2d_t plot_spectrum;
gnuplot2d_t plot_output;


const size_t Fs = 96000;
const size_t Ft = 1000;
const fftw_real At = 100;
const size_t Num = 9;

extern "C" {

    const fftw_real * sdr_get_input_i_buffer(void) {
        static fftw_real in_buf[(SDR_BUF_SIZE)];
        static size_t idx = 0;

        /* RX mode - samples from mixer I component */
        /* TX mode - microphone */

        dbg::sout << "get i input data" << dbg::endl;
        if(idx >= Num) {
            return NULL;
        }
        for(size_t i = 0; i < (SDR_BUF_SIZE); i++) {
            in_buf[i] = At * cos(2.*M_PI * Ft * (idx * (SDR_BUF_SIZE) + i) / Fs);
            plot_input.add_point(idx * (SDR_BUF_SIZE) + i, in_buf[i], "input i");
        }
        idx++;

        return in_buf;
    }

    const fftw_real * sdr_get_input_q_buffer(void) {
        static fftw_real in_buf[(SDR_BUF_SIZE)];
        static size_t idx = 0;

        /* RX mode - samples from mixer Q component */
        /* TX mode - zeros */

        dbg::sout << "get q input data" << dbg::endl;
        if(idx >= Num) {
            return NULL;
        }
        for(size_t i = 0; i < (SDR_BUF_SIZE); i++) {
            in_buf[i] = At * sin(2.*M_PI * Ft * (idx * (SDR_BUF_SIZE) + i) / Fs); // RX
            //in_buf[i] = 0; // TX
            plot_input.add_point(idx * (SDR_BUF_SIZE) + i, in_buf[i], "input q");
        }
        idx++;

        return in_buf;
    }

    void sdr_set_spectrum(const fftw_real * data) {
        static size_t idx = 0;

        /* RX mode - update waterfall */
        /* TX mode - none */

        dbg::sout << "set spectrum" << dbg::endl;
        if(idx == Num / 2) {
            for(size_t i = (SDR_BUF_SIZE) + 1; i < ((SDR_BUF_SIZE) << 1); i++) {
                plot_spectrum.add_point(-(ssize_t)((Fs * (((SDR_BUF_SIZE) << 1) - i)) / ((SDR_BUF_SIZE) << 1)), data[i], "spectrum");
            }
            plot_spectrum.add_point(0, data[0] / 2, "spectrum");
            for(size_t i = 1; i < (SDR_BUF_SIZE); i++) {
                plot_spectrum.add_point((Fs * i) / ((SDR_BUF_SIZE) << 1), data[i], "spectrum");
            }
            plot_spectrum.add_point(Fs / 2, data[(SDR_BUF_SIZE)] / 2, "spectrum");
        }
        idx++;
    }

    void sdr_set_output_i_buffer(const fftw_real * data) {
        static size_t idx = 0;

        /* RX mode - samples to audio DAC */
        /* TX mode - samples to mixer I component */

        dbg::sout << "set i output data" << dbg::endl;
        for(size_t i = 0; i < (SDR_BUF_SIZE); i++) {
            plot_output.add_point((idx * (SDR_BUF_SIZE)) + i, data[i], "output i");
        }
        idx++;
    }

    void sdr_set_output_q_buffer(const fftw_real * data) {
        static size_t idx = 0;

        /* RX mode - none */
        /* TX mode - samples to mixer Q component */

        dbg::sout << "set q output data" << dbg::endl;
        for(size_t i = 0; i < (SDR_BUF_SIZE); i++) {
            plot_output.add_point((idx * (SDR_BUF_SIZE)) + i, data[i], "output q");
        }
        idx++;
    }
}


int main() {
    dbg::sout.set_dbg_level(dbg::DBG_INFO);
    dbg::sout.set_default_msg_level(dbg::DBG_INFO);
    dbg::sout << "DSP test application" << dbg::endl;

    if(gnuplot2d_t::check_gnuplot()) {

        sdr_set_band(sdr_USB);
        sdr_set_fcut(sdr_ncut(3500, Fs));  // 3.5KHz

        sdr_routine();

        dbg::sout << "transmission done" << dbg::endl;

        plot_input.set_title("Input");
        plot_input.set_color(0xFF0000, "input i");
        plot_input.set_color(0xFF, "input q");
        plot_input.draw();

        plot_spectrum.set_title("Spectrum");
        plot_spectrum.set_color(0xFF00, "spectrum");
        plot_spectrum.draw();

        plot_output.set_title("Output");
        plot_output.set_color(0xFF0000, "output i");
        plot_output.set_color(0xFF, "output q");
        plot_output.draw();

    } else {
        dbg::sout << dbg::err << "gnuplot not detected on current system!" << dbg::endl;
    }

    dbg::sout << "Bye!" << dbg::endl;
    return 0;
}
