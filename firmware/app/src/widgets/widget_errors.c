/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Errors Widgets source file
*/


#include "widget_errors.h"
#include "ui_engine.h"
#include "ui_notify.h"
#include "adc.h"
#include "misc_func.h"
#include <string.h>


void widget_error_codec(app_handle_t * app_handle) {

    const char * argv[] = {"Codec failed"};
    ui_notify(1, argv, "Ok", &app_handle->system_ctive);
}

void widget_error_rtc(app_handle_t * app_handle) {

    const char * argv[] = {"RTC failed"};
    ui_notify(1, argv, "Ok", &app_handle->system_ctive);
}

void widget_error_battery(app_handle_t * app_handle) {

    char buf[20] = "V = ";
    gcvtf(adc_batt_voltage(), 2, &buf[4]);
    uint8_t pos = strlen(buf);
    buf[pos] = 'V';
    buf[pos + 1] = '\0';
    const char * argv[] = {"Low battery voltage",
                           "", "",
                           buf
                          };
    ui_notify(4, argv, "Ok", &app_handle->system_ctive);
}

void widget_error_overheat(app_handle_t * app_handle) {

    char buf1[20] = "T1 = ";
    char buf2[20] = "T2 = ";
    uint8_t pos;
    gcvtf(adc_temperature1(), 1, &buf1[5]);
    pos = strlen(buf1);
    buf1[pos] = 'C';
    buf1[pos + 1] = '\0';
    gcvtf(adc_temperature2(), 1, &buf2[5]);
    pos = strlen(buf2);
    buf2[pos] = 'C';
    buf2[pos + 1] = '\0';
    const char * argv[] = {"RF amplifier overheat",
                           "", "",
                           buf1,
                           buf2
                          };
    ui_notify(5, argv, "Ok", &app_handle->system_ctive);
}

void widget_error_storage(app_handle_t * app_handle) {

    const char * argv[] = {"Storage failed"};
    ui_notify(1, argv, "Ok", &app_handle->system_ctive);
}

void widget_error_rf_amp(app_handle_t * app_handle) {

    const char * argv[] = {"RF amplifier failed"};
    ui_notify(1, argv, "Ok", &app_handle->system_ctive);
}

void widget_error_dco(app_handle_t * app_handle) {

    const char * argv[] = {"DCO failed"};
    ui_notify(1, argv, "Ok", &app_handle->system_ctive);
}

void widget_error_filters(app_handle_t * app_handle) {

}
