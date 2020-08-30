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


typedef enum {
    LED_OFF = 0,
    LED_ON,
    LED_BLINK_SLOW,
    LED_BLINK_FAST
} led_mode_t;


void led_start(void);
void led_stop(void);
void led_set(led_mode_t mode);
void led_invert(void);

#endif
