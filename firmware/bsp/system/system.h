/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    System on/off driver header file
*/

#ifndef __SYSTEM_H
#define __SYSTEM_H


#include <stdint.h>
#include <stdbool.h>

typedef enum {
    SYSTEM_HW_KEY_PWR,
    SYSTEM_HW_KEY_PTT
} system_hw_key_t;


void system_pwr_hold_on(void);
void system_pwr_hold_off(void);
void system_hw_key_start(void);
void system_hw_key_stop(void);
bool system_hw_key_pressed(system_hw_key_t key);


#endif
