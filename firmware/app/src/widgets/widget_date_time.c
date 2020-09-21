/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget date time source file
*/


#include "widget_date_time.h"
#include "ui_engine.h"
#include "misc_func.h"
#include "rtc.h"
#include <stdbool.h>
#include <string.h>


/* active widgets tags definitions */
#define WIDGET_DATE_TIME_TAG_HOUR       50
#define WIDGET_DATE_TIME_TAG_MIN        51
#define WIDGET_DATE_TIME_TAG_SEC        52
#define WIDGET_DATE_TIME_TAG_MON        53
#define WIDGET_DATE_TIME_TAG_Y_DOWN     54
#define WIDGET_DATE_TIME_TAG_Y_UP       55
#define WIDGET_DATE_TIME_TAG_EXIT       56
/* continue touch reporting after first touch */
#define WIDGET_DATE_TIME_TOUCH_SKIP_CNT 5


void widget_date_time(void) {

    bool    touched = false;
    uint8_t touched_cnt = WIDGET_DATE_TIME_TOUCH_SKIP_CNT;

    for(;;) {
        date_time_t ti = rtc_get_time();
        char buf[5];

        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_DATE_TIME_TAG_EXIT, 5,  5, 20, 20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                           30, 0,         UI_ENGINE_FONT29, "Date Time Settings", false);
        /* time H:M:S */
        buf[0] = '0';
        ui_engine_button(WIDGET_DATE_TIME_TAG_HOUR, 5,   ui_engine_ysize - 80, 50, 50, UI_ENGINE_FONT30, strlen(utoa(ti.hours, &buf[1], 10)) == 1 ? buf : &buf[1]);
        ui_engine_button(WIDGET_DATE_TIME_TAG_MIN,  65,  ui_engine_ysize - 80, 50, 50, UI_ENGINE_FONT30, strlen(utoa(ti.minutes,  &buf[1], 10)) == 1 ? buf : &buf[1]);
        ui_engine_button(WIDGET_DATE_TIME_TAG_SEC,  125, ui_engine_ysize - 80, 50, 50, UI_ENGINE_FONT30, strlen(utoa(ti.seconds,  &buf[1], 10)) == 1 ? buf : &buf[1]);
        /* year */
        ui_engine_text  (0,          90,  65,         UI_ENGINE_FONT30, utoa(ti.year, buf, 10), true);
        ui_engine_button(WIDGET_DATE_TIME_TAG_Y_DOWN, 5,   50, 30, 30, UI_ENGINE_FONT26, "<");
        ui_engine_button(WIDGET_DATE_TIME_TAG_Y_UP,   145, 50, 30, 30, UI_ENGINE_FONT26, ">");
        /* month */
        const char * months[] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
        ui_engine_button(WIDGET_DATE_TIME_TAG_MON, 5, 90, 170, 30, UI_ENGINE_FONT29, months[ti.month - 1]);
        /* calendar header */
        for(uint8_t i = 0; i < 7; i++) {
            const char * wdays[] = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
            ui_engine_text(0, ui_engine_xsize - 40 * (7 - i), ui_engine_ysize - 35 * 7 + 15, UI_ENGINE_FONT27, wdays[i], false);
        }
        /* calendar days */
        uint8_t day = 1;
        for(uint8_t j = 0; j < 6; j++) {
            for(uint8_t i = (j ? 0 : rtc_get_weekday(ti.year, ti.month, 1)); i < 7 && day <= rtc_days_in_month(ti.year, ti.month); i++) {
                if(day == ti.day) {
                    ui_engine_set_fgcolor(31, 128, 31);
                }
                ui_engine_button(day, ui_engine_xsize - 40 * (7 - i), ui_engine_ysize - 35 * (6 - j), 35, 30, UI_ENGINE_FONT28, utoa(day, buf, 10));
                if(day == ti.day) {
                    ui_engine_set_fgcolor(31, 31, 255);
                }
                day++;
            }
        }
        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(!touch.tag) {
            touched = false;
            touched_cnt = WIDGET_DATE_TIME_TOUCH_SKIP_CNT;
        } else {
            if(!touched || !touched_cnt) {
                if(touch.tag == WIDGET_DATE_TIME_TAG_Y_DOWN) {
                    if(ti.year > RTC_YEAR_MIN) {
                        ti.year--;
                        while(ti.day > rtc_days_in_month(ti.year, ti.month)) {
                            ti.day--;
                        }
                        rtc_set_time(&ti);
                    }
                }
                if(touch.tag == WIDGET_DATE_TIME_TAG_Y_UP) {
                    if(ti.year < RTC_YEAR_MAX) {
                        ti.year++;
                        while(ti.day > rtc_days_in_month(ti.year, ti.month)) {
                            ti.day--;
                        }
                        rtc_set_time(&ti);
                    }
                }
                if(touch.tag == WIDGET_DATE_TIME_TAG_MON) {
                    if(ti.month < 12) {
                        ti.month++;
                    } else {
                        ti.month = 1;
                    }
                    while(ti.day > rtc_days_in_month(ti.year, ti.month)) {
                        ti.day--;
                    }
                    rtc_set_time(&ti);
                }
                if(touch.tag == WIDGET_DATE_TIME_TAG_HOUR) {
                    if(ti.hours < 23) {
                        ti.hours++;
                    } else {
                        ti.hours = 0;
                    }
                    rtc_set_time(&ti);
                }
                if(touch.tag == WIDGET_DATE_TIME_TAG_MIN) {
                    if(ti.minutes < 59) {
                        ti.minutes++;
                    } else {
                        ti.minutes = 0;
                    }
                    rtc_set_time(&ti);
                }
                if(touch.tag == WIDGET_DATE_TIME_TAG_SEC) {
                    if(ti.seconds) {
                        ti.seconds = 0;
                        rtc_set_time(&ti);
                    }
                }
                if(touch.tag > 0 && touch.tag <= 31) {
                    if(ti.day != touch.tag) {
                        ti.day = touch.tag;
                        rtc_set_time(&ti);
                    }
                }
                if(touch.tag == WIDGET_DATE_TIME_TAG_EXIT) {
                    break;
                }
            }
            touched = true;
            if(touched_cnt) {
                touched_cnt--;
            }
        }
    }
}

void widget_date_lse_fail(void) {

    for(;;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_DATE_TIME_TAG_EXIT, 5,  5, 20, 20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                           30, 0,         UI_ENGINE_FONT29, "Date Time Settings", false);
        /* Error message */
        ui_engine_text(0, ui_engine_xsize / 2, ui_engine_ysize / 2, UI_ENGINE_FONT31, "LSE Failed", true);
        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(touch.tag == WIDGET_DATE_TIME_TAG_EXIT) {
            break;
        }
    }
}
