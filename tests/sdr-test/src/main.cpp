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
#define TEST_RX_CH_MODULATIN    1
#define TEST_TX_CH_MODULATIN    2


/******************************************************************************
 * Select test to execute
 ******************************************************************************/
#define ACTIVE_TEST             TEST_TX_CH_MODULATIN


#define SIGNAL_HZ               400


int main(void) {

    if(gnuplot2d_t::check_gnuplot()) {

        dsp_proc_set(&app_handle, dsp_proc_sdr_routine, dsp_proc_sdr_set, dsp_proc_sdr_unset);

        gnuplot2d_t plot;
        plot.set_title("SDR process");
        plot.set_color(0xFF0000,    "output L");
        plot.set_color(0x00,        "output R");

#if(ACTIVE_TEST == TEST_RX_TX_MODE)

        app_handle.ctl_state->transmission = false;

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

#elif(ACTIVE_TEST == TEST_RX_CH_MODULATIN)

        app_handle.ctl_state->transmission = false;
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

#elif(ACTIVE_TEST == TEST_TX_CH_MODULATIN)

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

#endif

        dsp_proc_unset(&app_handle);

        plot.draw();

    } else {
        DBG_OUT("gnuplot not detected");
    }
}
