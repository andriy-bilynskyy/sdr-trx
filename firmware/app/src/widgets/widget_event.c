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


#include "widgets.h"
#include "adc.h"
#include "misc_func.h"
#include <string.h>


bool widget_event(app_handle_t * app_handle, uint32_t event_flg) {

    bool result = false;

    if(event_flg & WIDGET_EVENT_PWR_MENU) {
        widget_pwr_menu(app_handle);
        result = true;
    }

    if(event_flg & WIDGET_EVENT_LOW_BATT) {
        widget_error_battery(app_handle);
        result = true;
    }

    if(event_flg & WIDGET_EVENT_OVER_HEAT) {
        widget_error_overheat(app_handle);
        result = true;
    }

    if(event_flg & WIDGET_EVENT_STORAGE_FAIL) {
        widget_error_storage(app_handle);
        result = true;
    }

    if(event_flg & WIDGET_EVENT_RTC_FAIL) {
        widget_error_rtc(app_handle);
        result = true;
    }

    return result;
}
