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
#include "misc_func.h"
#include "adc.h"


/* active widgets tags definitions */
#define WIDGET_TRX_TAG_EXIT           50
#define WIDGET_TRX_TAG_UP_F           51
#define WIDGET_TRX_TAG_DOWN_F         52
#define WIDGET_TRX_TAG_PTT            53
#define WIDGET_TRX_TAG_MODULATION     54
/* continue touch reporting after first touch */
#define WIDGET_TRX_TOUCH_SKIP_CNT     5
/* spectrum data constants */
#define WIDGET_TRX_SPECTRUM_SIZE      256
/* frequency grid step */
#define WIDGET_TRX_FGRID_STEP_HZ      (10*1000)


static const uint32_t widget_trx_sdr_sr[] = {8000, 32000, 48000, 96000};


static bool widget_trx_show_errors(volatile app_handle_t * app_handle, rf_unit_state_t state);
static void widget_trx_update_spectrum(const volatile sdr_spectrum_t * spectrum);


void widget_trx(volatile app_handle_t * app_handle) {

    uint8_t  frequency_pos = 3;

    bool init = true;
    bool touched = false;
    uint8_t touched_cnt = WIDGET_TRX_TOUCH_SKIP_CNT;

    dsp_proc_set(app_handle, dsp_proc_sdr_routine, dsp_proc_sdr_set, dsp_proc_sdr_unset);
    (void)widget_trx_show_errors(app_handle, rf_unit_start(app_handle));

    for(; app_handle->system_ctive;) {
        static const uint32_t f_grid[] = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000};

        if(app_handle->ctl_state->spectrum.valid && app_handle->ctl_state->spectrum.data) {
            widget_trx_update_spectrum(&app_handle->ctl_state->spectrum);
            app_handle->ctl_state->spectrum.valid = false;
        }

        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        ui_engine_set_color(255, 255, 255);
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
        ui_engine_button(WIDGET_TRX_TAG_DOWN_F,     300,                   50,                   70, 30, UI_ENGINE_FONT28, "DOWN");
        ui_engine_button(WIDGET_TRX_TAG_UP_F,       380,                   50,                   70, 30, UI_ENGINE_FONT28, "UP");

        if(app_handle->ctl_state->transmission) {
            /* output power & swr */
            char buf[16] = "TX: ";
            uint8_t pos;
            swr_meter_t power_swr = adc_swr();
            gcvtf(power_swr.power, 2, &buf[4]);
            pos = strlen(buf);
            buf[pos] = 'W';
            buf[pos + 1] = '\0';
            ui_engine_text(0, 25, 110, UI_ENGINE_FONT28, buf, false);
            strcpy(buf, "SWR: ");
            gcvtf(power_swr.swr, 2, &buf[5]);
            ui_engine_text(0, 25, 140, UI_ENGINE_FONT28, buf, false);
        } else {
            /* frequency grid */
            ui_engine_set_color(0, 0, 0);
            ui_engine_line(ui_engine_xsize >> 1, 90, ui_engine_xsize >> 1, ui_engine_ysize, 10);
            ui_engine_set_color(96, 96, 96);
            uint16_t dx = ((uint32_t)WIDGET_TRX_FGRID_STEP_HZ * ui_engine_xsize) / widget_trx_sdr_sr[app_handle->settings->codec_samplerate];
            for(uint8_t i = 0; i < (ui_engine_xsize >> 1) / dx; i++) {
                ui_engine_line((ui_engine_xsize >> 1) + dx * (i + 1), 90, (ui_engine_xsize >> 1) + dx * (i + 1), ui_engine_ysize, 10);
                ui_engine_line((ui_engine_xsize >> 1) - dx * (i + 1), 90, (ui_engine_xsize >> 1) - dx * (i + 1), ui_engine_ysize, 10);
            }
            /* spectrum */
            ui_engine_set_color(255, 128, 0);
            ui_engine_bargraph(0,                    90, ui_engine_xsize >> 1, ui_engine_ysize - 91, 0);
            ui_engine_bargraph(ui_engine_xsize >> 1, 90, ui_engine_xsize >> 1, ui_engine_ysize - 91, WIDGET_TRX_SPECTRUM_SIZE);
            ui_engine_set_color(255, 255, 255);
            /* RX level */
            char buf[] = "RX: 00";
            (void)utoa(CODEC_INPUT_MAX_VOLUME - app_handle->ctl_state->codec_rx_line_sensitivity.volume, &buf[4], 10);
            ui_engine_text(0, 25, 110, UI_ENGINE_FONT28, buf, false);
        }
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
            init = init || widget_trx_show_errors(app_handle, rf_unit_update(app_handle));
        }
        init = init || widget_trx_show_errors(app_handle, rf_unit_update_rx_sensitivity(app_handle));

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
                    if(app_handle->settings->dco_frequency <= DCO_MAX_FREQUENCY - f_grid[frequency_pos]) {
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
                    if(app_handle->settings->dco_frequency  >= DCO_MIN_FREQUENCY + f_grid[frequency_pos]) {
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


static bool widget_trx_show_errors(volatile app_handle_t * app_handle, rf_unit_state_t state) {

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

static void widget_trx_update_spectrum(const volatile sdr_spectrum_t * spectrum) {

    const uint8_t f_s = spectrum->elements / (WIDGET_TRX_SPECTRUM_SIZE * 2);
    spectrum->data[0] /= 2;
    spectrum->data[spectrum->elements >> 1] /= 2;

    float32_t tmp, max = 0;
    for(uint16_t i = 0; i < WIDGET_TRX_SPECTRUM_SIZE; i++) {

        arm_mean_f32(&spectrum->data[(WIDGET_TRX_SPECTRUM_SIZE + i) * f_s], f_s, &tmp);
        if(tmp > max) {
            max = tmp;
        }
        spectrum->data[(WIDGET_TRX_SPECTRUM_SIZE + i) * f_s] = tmp;

        arm_mean_f32(&spectrum->data[i * f_s], f_s, &tmp);
        if(tmp > max) {
            max = tmp;
        }
        spectrum->data[i * f_s] = tmp;
    }

    uint8_t band[2][WIDGET_TRX_SPECTRUM_SIZE];
    for(uint16_t i = 0; i < WIDGET_TRX_SPECTRUM_SIZE; i++) {

        band[0][i] = 255 - (spectrum->data[(WIDGET_TRX_SPECTRUM_SIZE + i) * f_s] / max) * 255;
        band[1][i] = 255 - (spectrum->data[i * f_s]                              / max) * 255;
    }

    (void)ui_engine_load_bitmap(0, band, sizeof(band));
}
