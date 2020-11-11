/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget sensors source file
*/


#include "widgets.h"
#include "ui_engine.h"
#include "misc_func.h"
#include "adc.h"
#include "rf_amp.h"
#include <stdbool.h>
#include <string.h>


/* active widgets tags definitions */
#define WIDGET_SENSORS_TAG_EXIT       1
#define WIDGET_SENSORS_TAG_PAON       2
#define WIDGET_SENSORS_TAG_PAVAL      3


void widget_sensors(app_handle_t * app_handle) {

    bool init = true;
    bool touched = false;

    bool rf_amp_on = false;

    if(!rf_amp_start()) {
        widget_error_rf_amp(app_handle);
    } else if(rf_amp_on) {
        rf_amp_bias1(app_handle->settings->rf_amp_bias);
        rf_amp_bias1(app_handle->settings->rf_amp_bias);
    }
    for(; app_handle->system_ctive;) {

        char buf[16];
        uint8_t pos;

        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_SENSORS_TAG_EXIT, 5,  5, 20, 20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                         30, 0,         UI_ENGINE_FONT29, "Sensors", false);
        /* Battery voltage */
        ui_engine_text(0, 20,  35,  UI_ENGINE_FONT28, "Battery voltage:", false);
        gcvtf(adc_batt_voltage(), 2, buf);
        pos = strlen(buf);
        buf[pos] = 'V';
        buf[pos + 1] = '\0';
        ui_engine_text(0, 300, 35,  UI_ENGINE_FONT28, buf, false);
        /* Temperature 1 */
        ui_engine_text(0, 20,  65, UI_ENGINE_FONT28, "RF LDMOS 1 temperature:", false);
        gcvtf(adc_temperature1(), 1, buf);
        pos = strlen(buf);
        buf[pos] = 'C';
        buf[pos + 1] = '\0';
        ui_engine_text(0, 300, 65,  UI_ENGINE_FONT28, buf, false);
        /* Temperature 2 */
        ui_engine_text(0, 20,  95, UI_ENGINE_FONT28, "RF LDMOS 2 temperature:", false);
        gcvtf(adc_temperature2(), 1, buf);
        pos = strlen(buf);
        buf[pos] = 'C';
        buf[pos + 1] = '\0';
        ui_engine_text(0, 300, 95,  UI_ENGINE_FONT28, buf, false);
        /* Output power */
        swr_meter_t power_swr = adc_swr();
        ui_engine_text(0, 20,  125, UI_ENGINE_FONT28, "RF TX power:", false);
        gcvtf(power_swr.power, 2, buf);
        pos = strlen(buf);
        buf[pos] = 'W';
        buf[pos + 1] = '\0';
        ui_engine_text(0, 300, 125, UI_ENGINE_FONT28, buf, false);
        /* SWR */
        ui_engine_text(0, 20,  155, UI_ENGINE_FONT28, "SWR:", false);
        ui_engine_text(0, 300, 155, UI_ENGINE_FONT28, gcvtf(power_swr.swr, 2, buf), false);
        /* RF amp header */
        ui_engine_text(0,                          20,  ui_engine_ysize - 80, UI_ENGINE_FONT28,         "RF power amplifier:", false);
        /* RF amp button */
        ui_engine_button(WIDGET_SENSORS_TAG_PAON,  20,  ui_engine_ysize - 45, 50, 30, UI_ENGINE_FONT28, rf_amp_on ? "ON" : "OFF");
        /* RF amp slider */
        ui_engine_slider(WIDGET_SENSORS_TAG_PAVAL, 110, ui_engine_ysize - 37, ui_engine_xsize - 140, 15, ((uint32_t)(app_handle->settings->rf_amp_bias - RF_AMP_MIN) * 0xFFFF) / (RF_AMP_MAX - RF_AMP_MIN));

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
                if(touch.tag == WIDGET_SENSORS_TAG_EXIT) {
                    break;
                }
                if(touch.tag == WIDGET_SENSORS_TAG_PAON) {
                    rf_amp_on = !rf_amp_on;
                    if(rf_amp_on) {
                        if(!rf_amp_bias1(app_handle->settings->rf_amp_bias) || !rf_amp_bias2(app_handle->settings->rf_amp_bias)) {
                            widget_error_rf_amp(app_handle);
                            init = true;
                        }
                    } else {
                        if(!rf_amp_off()) {
                            widget_error_rf_amp(app_handle);
                            init = true;
                        }
                    }
                }
            }
            if(touch.tag == WIDGET_SENSORS_TAG_PAVAL) {
                app_handle->settings->rf_amp_bias = ((uint32_t)touch.value  * (RF_AMP_MAX - RF_AMP_MIN)) / 0xFFFF + RF_AMP_MIN;
                if(rf_amp_on) {
                    if(!rf_amp_bias1(app_handle->settings->rf_amp_bias) || !rf_amp_bias2(app_handle->settings->rf_amp_bias)) {
                        widget_error_rf_amp(app_handle);
                        init = true;
                    }
                }
            }
            touched = true;
        }
    }
    rf_amp_stop();
}
