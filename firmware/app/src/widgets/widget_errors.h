/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Errors Widgets header file
*/

#ifndef __WIDGET_ERRORS_H
#define __WIDGET_ERRORS_H


#include "app_data_types.h"


void widget_error_codec(app_handle_t * app_handle);
void widget_error_rtc(app_handle_t * app_handle);
void widget_error_battery(app_handle_t * app_handle);
void widget_error_overheat(app_handle_t * app_handle);
void widget_error_storage(app_handle_t * app_handle);
void widget_error_rf_amp(app_handle_t * app_handle);
void widget_error_dco(app_handle_t * app_handle);
void widget_error_filters(app_handle_t * app_handle);


#endif
