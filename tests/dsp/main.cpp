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
#include "transmitter.h"
#include <fftw.h>
#include <math.h>



#ifdef FFTW_ENABLE_FLOAT
#define cos(x)  cosf(x)
#endif


gnuplot2d_t plot_input;
gnuplot2d_t plot_output;


extern "C" {

    extern const fftw_real * transmitter_get_input_buffer(void) {
        const size_t Fs = 96000;
        const size_t Ft = 1000;
        const double At = 100;
        const size_t Num = 9;

        static fftw_real in_buf[(SDR_TX_BUF_SIZE)];
        static size_t idx = 0;

        dbg::sout << "get input data" << dbg::endl;
        if(idx >= Num) {
            return NULL;
        }
        for(size_t i = 0; i < (SDR_TX_BUF_SIZE); i++) {
            in_buf[i] = At * cos(2.*M_PI * Ft * (idx * (SDR_TX_BUF_SIZE) + i) / Fs);
            plot_input.add_point(idx * (SDR_TX_BUF_SIZE) + i, in_buf[i], "input");
        }
        idx++;

        return in_buf;
    }

    void transmitter_set_output_i_buffer(const fftw_real * data) {
        static size_t idx = 0;

        dbg::sout << "set i output data" << dbg::endl;
        for(size_t i = 0; i < (SDR_TX_BUF_SIZE); i++) {
            plot_output.add_point((idx * (SDR_TX_BUF_SIZE)) + i, data[i], "output i");
        }
        idx++;
    }

    void transmitter_set_output_q_buffer(const fftw_real * data) {
        static size_t idx = 0;

        dbg::sout << "set q output data" << dbg::endl;
        for(size_t i = 0; i < (SDR_TX_BUF_SIZE); i++) {
            plot_output.add_point((idx * (SDR_TX_BUF_SIZE)) + i, data[i], "output q");
        }
        idx++;
    }
}


int main() {
    dbg::sout.set_dbg_level(dbg::DBG_INFO);
    dbg::sout.set_default_msg_level(dbg::DBG_INFO);
    dbg::sout << "DSP test application" << dbg::endl;

    if(gnuplot2d_t::check_gnuplot()) {

        transmitter_routine();

        dbg::sout << "transmission done" << dbg::endl;

        plot_input.set_title("Input");
        plot_input.set_color(0xFF00, "input");
        plot_input.draw();

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
