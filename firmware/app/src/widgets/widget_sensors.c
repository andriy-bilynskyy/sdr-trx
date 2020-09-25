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
#include <stdbool.h>
#include <string.h>


/* active widgets tags definitions */
#define WIDGET_SENSORS_TAG_EXIT       1


void * widget_sensors(void) {

    void * next_widget = widget_main;
    bool init = true;

    for(;;) {

        char buf[16];
        uint8_t pos;

        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_SENSORS_TAG_EXIT, 5,  5, 20, 20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                         30, 0,         UI_ENGINE_FONT29, "Sensors", false);
        /* Battery voltage */
        ui_engine_text(0, 20,  70,  UI_ENGINE_FONT28, "Battery voltage:", false);
        gcvtf(adc_batt_voltage(), 2, buf);
        pos = strlen(buf);
        buf[pos] = 'V';
        buf[pos + 1] = '\0';
        ui_engine_text(0, 300, 70,  UI_ENGINE_FONT28, buf, false);
        /* Temperature 1 */
        ui_engine_text(0, 20,  100, UI_ENGINE_FONT28, "RF LDMOS 1 temperature:", false);
        gcvtf(adc_temperature1(), 1, buf);
        pos = strlen(buf);
        buf[pos] = 'C';
        buf[pos + 1] = '\0';
        ui_engine_text(0, 300, 100,  UI_ENGINE_FONT28, buf, false);
        /* Temperature 2 */
        ui_engine_text(0, 20,  130, UI_ENGINE_FONT28, "RF LDMOS 2 temperature:", false);
        gcvtf(adc_temperature2(), 1, buf);
        pos = strlen(buf);
        buf[pos] = 'C';
        buf[pos + 1] = '\0';
        ui_engine_text(0, 300, 130,  UI_ENGINE_FONT28, buf, false);
        /* Output power */
        swr_meter_t power_swr = adc_swr();
        ui_engine_text(0, 20,  160, UI_ENGINE_FONT28, "RF TX power:", false);
        gcvtf(power_swr.power, 2, buf);
        pos = strlen(buf);
        buf[pos] = 'W';
        buf[pos + 1] = '\0';
        ui_engine_text(0, 300, 160, UI_ENGINE_FONT28, buf, false);
        /* SWR */
        ui_engine_text(0, 20,  190, UI_ENGINE_FONT28, "SWR:", false);
        ui_engine_text(0, 300, 190, UI_ENGINE_FONT28, gcvtf(power_swr.swr, 2, buf), false);

        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(init) {
            if(!touch.tag) {
                init = false;
            }
            continue;
        }

        if(touch.tag == WIDGET_SENSORS_TAG_EXIT) {
            break;
        }
    }
    return next_widget;
}

