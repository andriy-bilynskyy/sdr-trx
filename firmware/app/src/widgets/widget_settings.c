/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget settings source file
*/


#include "widgets.h"
#include "ui_engine.h"


/* active widgets tags definitions */
#define WIDGET_SETTINGS_TAG_EXIT           1
#define WIDGET_SETTINGS_TAG_SAMPLERATE     2
#define WIDGET_SETTINGS_TAG_TX_INPUT       3
#define WIDGET_SETTINGS_TAG_PTT_MODE       4


void widget_settings(app_handle_t * app_handle) {
    bool init = true;
    bool touched = false;

    for(; app_handle->system_ctive;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_SETTINGS_TAG_EXIT, 5,    5,   20,  20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                                30,  0,         UI_ENGINE_FONT29, "Transceiver settings", false);
        /* Codec samplerate */
        static const char * samplerates[] = {"8Ksps", "32Ksps", "48Ksps", "96Ksps"};
        ui_engine_text(0,                                20,  50,                            UI_ENGINE_FONT29, "Codec samplerate:", false);
        ui_engine_button(WIDGET_SETTINGS_TAG_SAMPLERATE, 300, 50,  100, 30, UI_ENGINE_FONT27, samplerates[app_handle->settings->codec_samplerate]);
        /* TX input source */
        static const char * inp_srcs[] = {"Mic.", "Line"};
        ui_engine_text(0,                                20,  100,                            UI_ENGINE_FONT29, "TX input source:", false);
        ui_engine_button(WIDGET_SETTINGS_TAG_TX_INPUT,   300, 100, 100, 30, UI_ENGINE_FONT27, inp_srcs[app_handle->settings->codec_tx_inp_src]);
        /* PTT button mode */
        static const char * ptt_modes[] = {"Software", "Hardware"};
        ui_engine_text(0,                                30,  150,                            UI_ENGINE_FONT29, "PTT button mode:", false);
        ui_engine_button(WIDGET_SETTINGS_TAG_PTT_MODE,   300, 150, 100, 30, UI_ENGINE_FONT27, ptt_modes[app_handle->settings->system_ptt_button]);

        ui_engine_draw_end();

        uint32_t event_flg = ui_engine_event_wait(WIDGET_EVENT_MASK);
        if(widget_event(app_handle, event_flg)) {
            init = true;
        }

        ui_engine_touch_t touch = ui_engine_get_touch();

        if(init) {
            if(!touch.tag) {
                init = false;
            }
            continue;
        }

        if(!touch.tag) {
            touched = false;
        } else {
            if(!touched) {
                if(touch.tag == WIDGET_SETTINGS_TAG_EXIT) {
                    break;
                }
                if(touch.tag == WIDGET_SETTINGS_TAG_SAMPLERATE) {
                    app_handle->settings->codec_samplerate = ((app_handle->settings->codec_samplerate == CODEC_SR_96K) ?
                            CODEC_SR_8K : (codec_sample_rate_t)(app_handle->settings->codec_samplerate + 1));
                }
                if(touch.tag == WIDGET_SETTINGS_TAG_TX_INPUT) {
                    app_handle->settings->codec_tx_inp_src = ((app_handle->settings->codec_tx_inp_src == CODEC_INP_LINE) ?
                            CODEC_INP_MIC : (codec_inp_src_t)(app_handle->settings->codec_tx_inp_src + 1));
                }
                if(touch.tag == WIDGET_SETTINGS_TAG_PTT_MODE) {
                    app_handle->settings->system_ptt_button = ((app_handle->settings->system_ptt_button == APP_SETTINGS_PTT_HW) ?
                            APP_SETTINGS_PTT_SW : (ptt_button_t)(app_handle->settings->system_ptt_button + 1));
                }
            }
            touched = true;
        }
    }
}
