/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget events processor source file
*/


#include "widget_event.h"
#include "ui_notify.h"
#include "adc.h"
#include "misc_func.h"
#include <string.h>


bool widget_event(uint32_t event_flg) {

    bool result = false;

    if(event_flg & WIDGET_EVENT_LOW_BATT) {
        char buf[20] = "V = ";
        gcvtf(adc_batt_voltage(), 2, &buf[4]);
        uint8_t pos = strlen(buf);
        buf[pos] = 'V';
        buf[pos + 1] = '\0';
        const char * argv[] = {"Low battery voltage",
                               "", "",
                               buf
                              };
        ui_notify(4, argv, "Ok");
        result = true;
    }

    if(event_flg & WIDGET_EVENT_OVER_HEAT) {
        char buf1[20] = "T1 = ";
        char buf2[20] = "T2 = ";
        uint8_t pos;
        gcvtf(adc_temperature2(), 1, &buf1[5]);
        pos = strlen(buf1);
        buf1[pos] = 'C';
        buf1[pos + 1] = '\0';
        gcvtf(adc_temperature2(), 1, &buf2[5]);
        pos = strlen(buf2);
        buf2[pos] = 'C';
        buf2[pos + 1] = '\0';
        const char * argv[] = {"Overheat",
                               "", "",
                               buf1,
                               buf2
                              };
        ui_notify(5, argv, "Ok");
        result = true;
    }

    if(event_flg & WIDGET_EVENT_STORAGE_FAIL) {
        const char * argv[] = {"Storage failed"};
        ui_notify(1, argv, "Ok");
        result = true;
    }

    if(event_flg & WIDGET_EVENT_RTC_FAIL) {
        const char * argv[] = {"RTC failed"};
        ui_notify(1, argv, "Ok");
        result = true;
    }

    return result;
}
