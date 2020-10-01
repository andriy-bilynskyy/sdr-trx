/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    24 series memory driver header file
    http://ww1.microchip.com/downloads/en/DeviceDoc/21189T.pdf
    Note:
      I2C bus should be started before!
*/


#ifndef __MEM24_H
#define __MEM24_H


#include "mem24_conf.h"
#include <stdint.h>
#include <stdbool.h>


uint32_t mem24_write(uint32_t addr, const void * data, uint32_t size);
uint32_t mem24_read(uint32_t addr, void * data, uint32_t size);
bool     mem24_whole_erase(void);


#endif

