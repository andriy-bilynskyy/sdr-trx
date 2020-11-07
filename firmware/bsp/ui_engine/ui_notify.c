/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    UI notify widget source file
*/


#include "ui_notify.h"
#include "ui_engine.h"
#include "ui_engine_events.h"
#include <stdbool.h>


void ui_notify(uint8_t argc, const char * argv[], const char * button, volatile bool * run) {

    if(argc) {
        bool init = true;
        for(;;) {
            ui_engine_draw_start(0, 0, 0);
            ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
            ui_engine_set_fgcolor(31, 31, 255);

            ui_engine_text(0, ui_engine_xsize / 2, 20, UI_ENGINE_FONT29, argv[0], true);

            for(uint8_t i = 1; i < argc && i <= 8; i++) {
                ui_engine_text(0, 50, 30 + i * 20, UI_ENGINE_FONT18, argv[i], false);
            }

            ui_engine_button(1, (ui_engine_xsize - 120) / 2, ui_engine_ysize - 50, 120, 40, UI_ENGINE_FONT28, button);
            ui_engine_draw_end();

            (void)ui_engine_event_wait(UI_ENGINE_EVENT_FLAG_TOUCH);
            if(run) {
                if(*run == false) {
                    break;
                }
            }
            ui_engine_touch_t touch = ui_engine_get_touch();

            if(init) {
                if(!touch.tag) {
                    init = false;
                }
                continue;
            }

            if(touch.tag == 1) {
                break;
            }
        }
    }
}
