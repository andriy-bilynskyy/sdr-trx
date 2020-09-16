/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    LED driver header file
*/

#ifndef __LED_H
#define __LED_H


#include <stdbool.h>


void led_start(void);
void led_stop(void);
void led_set(bool on);
void led_invert(void);

#endif
