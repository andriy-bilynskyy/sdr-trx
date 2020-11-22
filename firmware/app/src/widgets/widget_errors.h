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


void widget_error_codec(volatile app_handle_t * app_handle);
void widget_error_rtc(volatile app_handle_t * app_handle);
void widget_error_battery(volatile app_handle_t * app_handle);
void widget_error_overheat(volatile app_handle_t * app_handle);
void widget_error_storage(volatile app_handle_t * app_handle);
void widget_error_rf_amp(volatile app_handle_t * app_handle);
void widget_error_dco(volatile app_handle_t * app_handle);
void widget_error_filters(volatile app_handle_t * app_handle);


#endif
