/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget UI source file
*/


#include "widgets.h"
#include "ui_engine.h"


/* active widgets tags definitions */
#define WIDGET_UI_TAG_EXIT           1
#define WIDGET_UI_TAG_BRIGHTNESS     2


void widget_ui(volatile app_handle_t * app_handle) {

    bool init = true;
    bool touched = false;

    for(; app_handle->system_ctive;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_UI_TAG_EXIT, 5,  5, 20, 20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                    30, 0,         UI_ENGINE_FONT29, "User interface", false);
        /* Brightness */
        ui_engine_text(  0,                        40, 60,                            UI_ENGINE_FONT29, "Brightness:", false);
        ui_engine_slider(WIDGET_UI_TAG_BRIGHTNESS, 40, 100, ui_engine_xsize - 80, 15, (uint32_t)0xFFFF * (app_handle->settings->ui_engine_brightness - 1) / (UI_ENGINE_MAX_BRIGHTNESS -1));

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
                if(touch.tag == WIDGET_UI_TAG_EXIT) {
                    break;
                }
            }
            if(touch.tag == WIDGET_UI_TAG_BRIGHTNESS) {
                app_handle->settings->ui_engine_brightness = 1 + ((uint32_t)touch.value * (UI_ENGINE_MAX_BRIGHTNESS - 1)) / 0xFFFF;
                ui_engine_set_brightness(app_handle->settings->ui_engine_brightness);
            }
            touched = true;
        }
    }
}
