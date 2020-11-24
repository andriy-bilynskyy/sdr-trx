/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    UI images header file
*/

#ifndef __APP_IMAGES_H
#define __APP_IMAGES_H


#include <stdint.h>

typedef const struct {
    uint16_t      width;
    uint16_t      height;
    uint8_t       bytes_per_pixel;
    uint8_t       pixel_data[];
} app_bitmap_t;


extern app_bitmap_t app_bitmap_logo;


#endif
