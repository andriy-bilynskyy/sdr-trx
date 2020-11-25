/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget power menu source file
*/


#include "widgets.h"
#include "ui_engine.h"
#include "debug.h"
#include "stm32f4xx_conf.h"


/* active widgets tags definitions */
#define WIDGET_PWR_MENU_TAG_EXIT        1
#define WIDGET_PWR_MENU_TAG_SHUTDOWN    2
#define WIDGET_PWR_MENU_TAG_REBOOT      3


void widget_pwr_menu(volatile app_handle_t * app_handle) {

    bool init = true;
    bool touched = false;

    for(; app_handle->system_ctive;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        ui_engine_set_color(255, 255, 255);

        ui_engine_button(WIDGET_PWR_MENU_TAG_REBOOT,   (ui_engine_xsize - 180) / 2, 50,  180, 40, UI_ENGINE_FONT30, "Reboot");
        ui_engine_button(WIDGET_PWR_MENU_TAG_SHUTDOWN, (ui_engine_xsize - 180) / 2, 120, 180, 40, UI_ENGINE_FONT30, "Shutdown");
        ui_engine_button(WIDGET_PWR_MENU_TAG_EXIT,     (ui_engine_xsize - 180) / 2, 190, 180, 40, UI_ENGINE_FONT30, "Cancel");

        ui_engine_draw_end();

        (void)ui_engine_event_wait(UI_ENGINE_EVENT_FLAG_TOUCH | WIDGET_EVENT_PWR_MENU);

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
                if(touch.tag == WIDGET_PWR_MENU_TAG_EXIT) {
                    break;
                }
                if(touch.tag == WIDGET_PWR_MENU_TAG_SHUTDOWN) {
                    app_handle->system_ctive = false;
                }
                if(touch.tag == WIDGET_PWR_MENU_TAG_REBOOT) {
#ifdef DEBUG
                    DBG_OUT("reboot requested");
                    for(;;);
#else
                    NVIC_SystemReset();
#endif
                }
            }
            touched = true;
        }
    }
}
