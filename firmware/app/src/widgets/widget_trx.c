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
#include "ui_notify.h"
#include "hwctl.h"
#include "dco.h"


/* active widgets tags definitions */
#define WIDGET_TRX_TAG_EXIT           50
#define WIDGET_TRX_TAG_UP_F           51
#define WIDGET_TRX_TAG_DOWN_F         52
/* continue touch reporting after first touch */
#define WIDGET_TRX_TOUCH_SKIP_CNT     5
/* initial frequency */
#define WIDGET_TRX_FREQUENCY          10000000UL


static void widget_trx_dco_error(void);


void widget_trx(void) {

    uint32_t frequency     = WIDGET_TRX_FREQUENCY;
    uint8_t  frequency_pos = 2;

    bool init = true;
    bool touched = false;
    uint8_t touched_cnt = WIDGET_TRX_TOUCH_SKIP_CNT;

    hwctl_start();
    hwctl_tx_power(true);
    hwctl_rx_power(true);

    if(!dco_start(frequency)) {
        widget_trx_dco_error();
    }

    for(;;) {

        static const uint32_t f_grid[] = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000};

        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_TRX_TAG_EXIT, 5,  5, 20, 20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                     30, 0,         UI_ENGINE_FONT29, "Transceiver", false);
        /* Frequency bar */
        for(uint8_t i = 0; i < 8; i++) {
            char buf[2] = {0};
            buf[0] = (frequency / f_grid[i]) % 10 + '0';
            if(i == frequency_pos) {
                ui_engine_set_fgcolor(31, 128, 31);
            }
            ui_engine_button(i + 1,  250 - i * 30 - (i / 3) * 10,  50, 25, 30, UI_ENGINE_FONT29, buf);
            if(i == frequency_pos) {
                ui_engine_set_fgcolor(31, 31, 255);
            }
        }
        /* Frequency control buttons */
        ui_engine_button(WIDGET_TRX_TAG_UP_F,   300,  50, 70, 30, UI_ENGINE_FONT28, "UP");
        ui_engine_button(WIDGET_TRX_TAG_DOWN_F, 380,  50, 70, 30, UI_ENGINE_FONT28, "DOWN");

        ui_engine_draw_end();

        uint32_t event_flg = ui_engine_event_wait(WIDGET_EVENT_MASK);
        if(widget_event(event_flg)) {
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
            touched_cnt = WIDGET_TRX_TOUCH_SKIP_CNT;
        } else {
            if(!touched  || !touched_cnt) {
                if(touch.tag == WIDGET_TRX_TAG_EXIT) {
                    break;
                }
                if(touch.tag == WIDGET_TRX_TAG_UP_F) {
                    uint32_t new_frequency = frequency;
                    if(frequency + f_grid[frequency_pos] <= DCO_MAX_FREQUENCY) {
                        new_frequency += f_grid[frequency_pos];
                    } else {
                        new_frequency = DCO_MAX_FREQUENCY;
                    }
                    if(new_frequency != frequency) {
                        if(!dco_set_frequency(new_frequency)) {
                            widget_trx_dco_error();
                            init = true;
                        } else {
                            frequency = new_frequency;
                        }
                    }
                }
                if(touch.tag == WIDGET_TRX_TAG_DOWN_F) {
                    uint32_t new_frequency = frequency;
                    if(frequency - f_grid[frequency_pos] >= DCO_MIN_FREQUENCY) {
                        new_frequency -= f_grid[frequency_pos];
                    } else {
                        new_frequency = DCO_MIN_FREQUENCY;
                    }
                    if(new_frequency != frequency) {
                        if(!dco_set_frequency(new_frequency)) {
                            widget_trx_dco_error();
                            init = true;
                        } else {
                            frequency = new_frequency;
                        }
                    }
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
    dco_stop();
    hwctl_rx_power(false);
    hwctl_tx_power(false);
}


static void widget_trx_dco_error(void) {

    const char * argv[] = {"DCO failed"};
    ui_notify(1, argv, "Ok");
}
