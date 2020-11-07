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
#define WIDGET_MAIN_TAG_TRX             3
#define WIDGET_MAIN_TAG_AUDIO           4
#define WIDGET_MAIN_TAG_UI              5


void widget_main(app_handle_t * app_handle) {

    bool init = true;

    for(; app_handle->system_ctive;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* Time date */
        ui_engine_button(WIDGET_MAIN_TAG_DATE_TIME, 20,                    50,  180, 40, UI_ENGINE_FONT30, "Date Time");
        /* Sensors */
        ui_engine_button(WIDGET_MAIN_TAG_SENSORS,   20,                    100, 180, 40, UI_ENGINE_FONT30, "Sensors");
        /* Sensors */
        ui_engine_button(WIDGET_MAIN_TAG_TRX,       20,                    150, 180, 40, UI_ENGINE_FONT30, "Transceiver");
        /* Audio */
        ui_engine_button(WIDGET_MAIN_TAG_AUDIO,     20,                    200, 180, 40, UI_ENGINE_FONT30, "Audio");
        /* Interface */
        ui_engine_button(WIDGET_MAIN_TAG_UI,        ui_engine_xsize - 200, 50,  180, 40, UI_ENGINE_FONT30, "Interface");

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

        if(touch.tag == WIDGET_MAIN_TAG_DATE_TIME) {
            widget_date_time(app_handle);
            init = true;
        }
        if(touch.tag == WIDGET_MAIN_TAG_SENSORS) {
            widget_sensors(app_handle);
            init = true;
        }
        if(touch.tag == WIDGET_MAIN_TAG_TRX) {
            widget_trx(app_handle);
            init = true;
        }
        if(touch.tag == WIDGET_MAIN_TAG_AUDIO) {
            widget_audio(app_handle);
            init = true;
        }
        if(touch.tag == WIDGET_MAIN_TAG_UI) {
            widget_ui(app_handle);
            init = true;
        }
    }
}
