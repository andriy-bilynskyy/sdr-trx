/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget SW version source file
*/


#include "widgets.h"
#include "ui_engine.h"
#include "sw_version.h"


/* active widgets tags definitions */
#define WIDGET_SW_VERSION_TAG_EXIT           1


void widget_sw_version(app_handle_t * app_handle) {

    bool init = true;
    bool touched = false;

    for(; app_handle->system_ctive;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_SW_VERSION_TAG_EXIT, 5,                   5,   20, 20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                            30,                  0,           UI_ENGINE_FONT29, "SW version",    false);
        /* SW version */
        ui_engine_text(0,                            ui_engine_xsize / 2, 100,         UI_ENGINE_FONT29, sw_version_id,   true);
        ui_engine_text(0,                            ui_engine_xsize / 2, 150,         UI_ENGINE_FONT29, sw_version_date, true);
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
                if(touch.tag == WIDGET_SW_VERSION_TAG_EXIT) {
                    break;
                }
            }
            touched = true;
        }
    }
}
