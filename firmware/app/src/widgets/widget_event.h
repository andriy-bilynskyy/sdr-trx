/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget events processor header file
*/


#ifndef __WIDGET_EVENT_H
#define __WIDGET_EVENT_H


#include <stdint.h>
#include <stdbool.h>


#define WIDGET_EVENT_MASK           0xFFFFFF

/******************************************************************************
 * Widget events flags definitions use bits 1..23
 ******************************************************************************/
#define WIDGET_EVENT_LOW_BATT       (1<<1)
#define WIDGET_EVENT_OVER_HEAT      (1<<2)
#define WIDGET_EVENT_STORAGE_FAIL   (1<<3)
#define WIDGET_EVENT_RTC_FAIL       (1<<4)


bool widget_event(uint32_t event_flg);


#endif
