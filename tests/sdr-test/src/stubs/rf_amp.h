/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    RF amplifier stub header file
*/


#ifndef __RF_AMP_STUB_H
#define __RF_AMP_STUB_H


#include <stdint.h>


#define RF_AMP_VAL(x)   (uint8_t)(((float)(x) * 256) / 5.0f)


#endif
