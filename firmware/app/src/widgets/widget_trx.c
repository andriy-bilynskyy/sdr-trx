/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget transceiver source file
*/


#include "widgets.h"
#include "ui_engine.h"
#include "rf_unit.h"
#include "dsp_proc.h"


/* active widgets tags definitions */
#define WIDGET_TRX_TAG_EXIT           50
#define WIDGET_TRX_TAG_UP_F           51
#define WIDGET_TRX_TAG_DOWN_F         52
#define WIDGET_TRX_TAG_PTT            53
#define WIDGET_TRX_TAG_MODULATION     54
/* continue touch reporting after first touch */
#define WIDGET_TRX_TOUCH_SKIP_CNT     5
/* update spectrum counter */
#define WIDGET_TRX_UPDATE_SPEXTRUM    4


static bool widget_trx_show_errors(app_handle_t * app_handle, rf_unit_state_t state);


void widget_trx(app_handle_t * app_handle) {

    uint8_t  frequency_pos = 2;

    bool init = true;
    bool touched = false;
    uint8_t touched_cnt = WIDGET_TRX_TOUCH_SKIP_CNT;
    uint8_t spectrum_cnt = WIDGET_TRX_UPDATE_SPEXTRUM;

    dsp_proc_set(app_handle, dsp_proc_sdr_routine, dsp_proc_sdr_set, dsp_proc_sdr_unset);
    (void)widget_trx_show_errors(app_handle, rf_unit_start(app_handle));

    for(; app_handle->system_ctive;) {

        static const uint32_t f_grid[] = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000};

        if(!spectrum_cnt) {
            if(app_handle->ctl_state->spectrum.valid && app_handle->ctl_state->spectrum.data) {
                /*TODO: process app_handle->ctl_state->spectrum.data */
                app_handle->ctl_state->spectrum.valid = false;
            }
            spectrum_cnt = WIDGET_TRX_UPDATE_SPEXTRUM;
        } else {
            spectrum_cnt--;
        }

        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_TRX_TAG_EXIT, 5,  5, 20, 20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                     30, 0,         UI_ENGINE_FONT29, "Transceiver", false);
        /* Frequency bar */
        for(uint8_t i = 0; i < 8; i++) {
            char buf[2] = {0};
            buf[0] = (app_handle->settings->dco_frequency / f_grid[i]) % 10 + '0';
            if(i == frequency_pos) {
                ui_engine_set_fgcolor(31, 128, 31);
            }
            ui_engine_button(i + 1,  250 - i * 30 - (i / 3) * 10,  50, 25, 30, UI_ENGINE_FONT29, buf);
            if(i == frequency_pos) {
                ui_engine_set_fgcolor(31, 31, 255);
            }
        }
        /* Frequency control buttons */
        ui_engine_button(WIDGET_TRX_TAG_UP_F,       300,                   50,                   70, 30, UI_ENGINE_FONT28, "UP");
        ui_engine_button(WIDGET_TRX_TAG_DOWN_F,     380,                   50,                   70, 30, UI_ENGINE_FONT28, "DOWN");
        /* PTT button */
        ui_engine_button(WIDGET_TRX_TAG_PTT,        20,                    ui_engine_ysize - 50, 80, 30, UI_ENGINE_FONT27, app_handle->ctl_state->transmission ? "Transmit" : "Receive");
        /* Modulation button */
        static const char * modulation[] = {"LSB", "USB", "AM", "NFM"};
        ui_engine_button(WIDGET_TRX_TAG_MODULATION, ui_engine_xsize - 100, ui_engine_ysize - 50, 80, 30, UI_ENGINE_FONT27, modulation[app_handle->settings->sdr_modulation]);

        ui_engine_draw_end();

        uint32_t event_flg = ui_engine_event_wait(WIDGET_EVENT_MASK);
        if(widget_event(app_handle, event_flg)) {
            init = true;
        }
        if(event_flg & WIDGET_EVENT_PTT_CHANGE) {
            init = widget_trx_show_errors(app_handle, rf_unit_update(app_handle));
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
            touched_cnt = WIDGET_TRX_TOUCH_SKIP_CNT;
        } else {
            if(!touched  || !touched_cnt) {
                if(touch.tag == WIDGET_TRX_TAG_EXIT) {
                    break;
                }
                if(touch.tag == WIDGET_TRX_TAG_UP_F) {
                    uint32_t new_frequency = app_handle->settings->dco_frequency;
                    if(app_handle->settings->dco_frequency + f_grid[frequency_pos] <= DCO_MAX_FREQUENCY) {
                        new_frequency += f_grid[frequency_pos];
                    } else {
                        new_frequency = DCO_MAX_FREQUENCY;
                    }
                    if(new_frequency != app_handle->settings->dco_frequency) {
                        app_handle->settings->dco_frequency = new_frequency;
                        init = widget_trx_show_errors(app_handle, rf_unit_update(app_handle));
                    }
                }
                if(touch.tag == WIDGET_TRX_TAG_DOWN_F) {
                    uint32_t new_frequency = app_handle->settings->dco_frequency;
                    if(app_handle->settings->dco_frequency - f_grid[frequency_pos] >= DCO_MIN_FREQUENCY) {
                        new_frequency -= f_grid[frequency_pos];
                    } else {
                        new_frequency = DCO_MIN_FREQUENCY;
                    }
                    if(new_frequency != app_handle->settings->dco_frequency) {
                        app_handle->settings->dco_frequency = new_frequency;
                        init = widget_trx_show_errors(app_handle, rf_unit_update(app_handle));
                    }
                }
                if(!touched && app_handle->settings->system_ptt_button == APP_SETTINGS_PTT_SW && touch.tag == WIDGET_TRX_TAG_PTT) {
                    app_handle->ctl_state->transmission = !app_handle->ctl_state->transmission;
                    init = widget_trx_show_errors(app_handle, rf_unit_update(app_handle));
                }
                if(!touched && touch.tag == WIDGET_TRX_TAG_MODULATION) {
                    app_handle->settings->sdr_modulation = ((app_handle->settings->sdr_modulation == APP_SETTINGS_MODULATION_NFM) ?
                                                            APP_SETTINGS_MODULATION_LSB : (sdr_modulation_t)(app_handle->settings->sdr_modulation + 1));
                }
                if(touch.tag > 0 && touch.tag <= 8) {
                    frequency_pos = touch.tag - 1;
                }
            }
            touched = true;
            if(touched_cnt) {
                touched_cnt--;
            }
        }
    }
    rf_unit_stop(app_handle);
    dsp_proc_set(app_handle, NULL, NULL, NULL);
}


static bool widget_trx_show_errors(app_handle_t * app_handle, rf_unit_state_t state) {

    bool result = false;
    switch(state) {
    case RF_UNIT_DCO_ERROR:
        widget_error_dco(app_handle);
        result =  true;
        break;
    case RF_UNIT_FILTER_ERROR:
        widget_error_filters(app_handle);
        result =  true;
        break;
    case RF_UNIT_RF_AMP_ERROR:
        widget_error_rf_amp(app_handle);
        result =  true;
        break;
    case RF_UNIT_CODEC_ERROR:
        widget_error_codec(app_handle);
        result = true;
        break;
    default:
        break;
    }
    return result;
}
