/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    SDR test source file
*/

extern "C" {

#include "debug.h"
#include "app_data.h"
#include "codec.h"
#include "codec_ext.h"                             /* Dummy signal generation */
#include "dsp_proc.h"

}

#include <stdint.h>
#include "CPlot2D.h"


#define TEST_RX_TX_MODE         0
#define TEST_RX_MODULATION      1
#define TEST_TX_MODULATION      2
#define TEST_SPECTRUM           3
#define TEST_RX_AGC             5
#define TEST_DSP_TEST           6


/******************************************************************************
 * Select test to execute
 ******************************************************************************/
#define ACTIVE_TEST             TEST_RX_TX_MODE


#define SIGNAL_HZ               400


int main(void) {

    if(gnuplot2d_t::check_gnuplot()) {

        gnuplot2d_t plot;
        plot.set_title("SDR process");
        plot.set_color(0xFF0000,    "output L");
        plot.set_color(0x00,        "output R");
        plot.set_color(0x0000FF,    "spectrum");

#if(ACTIVE_TEST == TEST_RX_TX_MODE)

        dsp_proc_set(&app_handle, dsp_proc_sdr_routine, dsp_proc_sdr_set, dsp_proc_sdr_unset);

        app_handle.ctl_state->transmission = false;
        app_handle.settings->sdr_modulation = APP_SETTINGS_MODULATION_USB;

        for(uint8_t m_cnt = 0; m_cnt < 3; m_cnt++) {
            for(uint8_t b_cnt = 0; b_cnt < 4; b_cnt++) {

                codec_mk_signal(&app_handle, SIGNAL_HZ);

                dsp_proc_exec(&app_handle);

                for(uint16_t i = 0; i < codec_buf_elements; i++) {
                    plot.add_point(codec_get_buf_time(&app_handle, i), codec_get_audio_buf()[i].left,  "output L");
                    plot.add_point(codec_get_buf_time(&app_handle, i), codec_get_audio_buf()[i].right, "output R");
                }

            }
            app_handle.ctl_state->transmission = !app_handle.ctl_state->transmission;
        }

        dsp_proc_unset(&app_handle);

#elif(ACTIVE_TEST == TEST_RX_MODULATION)

        dsp_proc_set(&app_handle, dsp_proc_sdr_routine, dsp_proc_sdr_set, dsp_proc_sdr_unset);

        app_handle.ctl_state->transmission = false;
        app_handle.settings->sdr_modulation = APP_SETTINGS_MODULATION_USB;

        for(uint8_t m_cnt = 0; m_cnt < 3; m_cnt++) {
            for(uint8_t b_cnt = 0; b_cnt < 4; b_cnt++) {

                codec_mk_signal(&app_handle, SIGNAL_HZ);

                dsp_proc_exec(&app_handle);

                for(uint16_t i = 0; i < codec_buf_elements; i++) {
                    plot.add_point(codec_get_buf_time(&app_handle, i), codec_get_audio_buf()[i].left,  "output L");
                    plot.add_point(codec_get_buf_time(&app_handle, i), codec_get_audio_buf()[i].right, "output R");
                }

            }
            if(app_handle.settings->sdr_modulation == APP_SETTINGS_MODULATION_LSB) {
                app_handle.settings->sdr_modulation = APP_SETTINGS_MODULATION_USB;
            } else {
                app_handle.settings->sdr_modulation = APP_SETTINGS_MODULATION_LSB;
            }
        }

        dsp_proc_unset(&app_handle);

#elif(ACTIVE_TEST == TEST_TX_MODULATION)

        dsp_proc_set(&app_handle, dsp_proc_sdr_routine, dsp_proc_sdr_set, dsp_proc_sdr_unset);

        app_handle.ctl_state->transmission = true;
        app_handle.settings->sdr_modulation = APP_SETTINGS_MODULATION_LSB;

        for(uint8_t m_cnt = 0; m_cnt < 3; m_cnt++) {
            for(uint8_t b_cnt = 0; b_cnt < 4; b_cnt++) {

                codec_mk_signal(&app_handle, SIGNAL_HZ);

                dsp_proc_exec(&app_handle);

                for(uint16_t i = 0; i < codec_buf_elements; i++) {
                    plot.add_point(codec_get_buf_time(&app_handle, i), codec_get_audio_buf()[i].left,  "output L");
                    plot.add_point(codec_get_buf_time(&app_handle, i), codec_get_audio_buf()[i].right, "output R");
                }

            }
            if(app_handle.settings->sdr_modulation == APP_SETTINGS_MODULATION_LSB) {
                app_handle.settings->sdr_modulation = APP_SETTINGS_MODULATION_USB;
            } else {
                app_handle.settings->sdr_modulation = APP_SETTINGS_MODULATION_LSB;
            }
        }

        dsp_proc_unset(&app_handle);

#elif(ACTIVE_TEST == TEST_SPECTRUM)

        dsp_proc_set(&app_handle, dsp_proc_sdr_routine, dsp_proc_sdr_set, dsp_proc_sdr_unset);

        app_handle.ctl_state->transmission = false;

        for(uint8_t b_cnt = 0; b_cnt < 4; b_cnt++) {

            codec_mk_signal(&app_handle, SIGNAL_HZ);
            dsp_proc_exec(&app_handle);
        }

        if(app_handle.ctl_state->spectrum.valid && app_handle.ctl_state->spectrum.data) {
            app_handle.ctl_state->spectrum.data[0] /= 2;
            app_handle.ctl_state->spectrum.data[app_handle.ctl_state->spectrum.elements >> 1] /= 2;

            for(uint16_t i = 0; i < app_handle.ctl_state->spectrum.elements >> 1; i++) {
                plot.add_point(i, app_handle.ctl_state->spectrum.data[i] / app_handle.ctl_state->spectrum.iterarions,  "spectrum");
            }
            for(uint16_t i = app_handle.ctl_state->spectrum.elements >> 1; i < app_handle.ctl_state->spectrum.elements; i++) {
                plot.add_point((int)i - app_handle.ctl_state->spectrum.elements, app_handle.ctl_state->spectrum.data[i] / app_handle.ctl_state->spectrum.iterarions,  "spectrum");
            }
            app_handle.ctl_state->spectrum.valid = false;
        }

        dsp_proc_unset(&app_handle);

#elif(ACTIVE_TEST == TEST_RX_AGC)

        dsp_proc_set(&app_handle, dsp_proc_sdr_routine, dsp_proc_sdr_set, dsp_proc_sdr_unset);

        app_handle.ctl_state->transmission = false;
        app_handle.settings->sdr_modulation = APP_SETTINGS_MODULATION_USB;

        for(uint16_t b_cnt = 0; b_cnt < 100; b_cnt++) {

            codec_mk_signal(&app_handle, SIGNAL_HZ);
            dsp_proc_exec(&app_handle);
            DBG_OUT("sensitivity[%u]: %u", b_cnt, app_handle.ctl_state->codec_rx_line_sensitivity.volume);
        }

        dsp_proc_unset(&app_handle);

#elif(ACTIVE_TEST == TEST_DSP_TEST)

        dsp_proc_set(&app_handle, dsp_proc_test_routine, dsp_proc_test_set, dsp_proc_test_unset);

        app_handle.ctl_state->transmission = true;

        for(uint8_t b_cnt = 0; b_cnt < 3; b_cnt++) {

            codec_mk_signal(&app_handle, SIGNAL_HZ);

            dsp_proc_exec(&app_handle);

            for(uint16_t i = 0; i < codec_buf_elements; i++) {
                plot.add_point(codec_get_buf_time(&app_handle, i), codec_get_audio_buf()[i].left,  "output L");
                plot.add_point(codec_get_buf_time(&app_handle, i), codec_get_audio_buf()[i].right, "output R");
            }

        }
        app_handle.ctl_state->transmission = !app_handle.ctl_state->transmission;

        dsp_proc_unset(&app_handle);

#endif

        plot.draw();

    } else {
        DBG_OUT("gnuplot not detected");
    }
}
