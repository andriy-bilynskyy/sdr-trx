/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    i2c master driver header file
*/


#ifndef __I2C_MASTER_H
#define __I2C_MASTER_H

#include <stdint.h>


void        i2c_master_start(void);
void        i2c_master_stop(void);
uint32_t    i2c_master_write(uint8_t dev_addr, const void * data, uint32_t size);
uint32_t    i2c_master_read(uint8_t dev_addr, void * data, uint32_t size);


#endif
