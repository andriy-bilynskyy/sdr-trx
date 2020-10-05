/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget main source file
*/


#include "widgets.h"
#include "ui_engine.h"
#include "misc_func.h"
#include "adc.h"
#include <stdbool.h>


/* active widgets tags definitions */
#define WIDGET_MAIN_TAG_DATE_TIME       1
#define WIDGET_MAIN_TAG_SENSORS         2


void * widget_main(void * parent){

    widget_t next_widget = parent;
    bool init = true;

    for(;;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* Time date */
        ui_engine_button(WIDGET_MAIN_TAG_DATE_TIME, 20, 50,  180, 40, UI_ENGINE_FONT30, "Date Time");
        /* Sensors */
        ui_engine_button(WIDGET_MAIN_TAG_SENSORS,   20, 100, 180, 40, UI_ENGINE_FONT30, "Sensors");

        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(init) {
            if(!touch.tag) {
                init = false;
            }
            continue;
        }

        if(touch.tag == WIDGET_MAIN_TAG_DATE_TIME) {
            next_widget = widget_date_time;
            break;
        }
        if(touch.tag == WIDGET_MAIN_TAG_SENSORS) {
            next_widget = widget_sensors;
            break;
        }
    }

    return next_widget;
}
