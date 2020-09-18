/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    miscellaneous HAL functions header file
*/

#ifndef __MISC_HAL_H
#define __MISC_HAL_H


#include <stdint.h>


void misc_hal_sleep_ms(uint32_t ms)     __attribute__((weak));


#endif
