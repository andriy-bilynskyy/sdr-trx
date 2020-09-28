/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    i2c master driver OS dependencies header file
*/

#ifndef __I2C_MASTER_OS_DEP_H
#define __I2C_MASTER_OS_DEP_H


void i2c_post_sync_obj(void)          __attribute__((weak));
void i2c_pend_sync_obj(void)          __attribute__((weak));

void i2c_lock_sync_obj(void)          __attribute__((weak));
void i2c_unlock_sync_obj(void)        __attribute__((weak));


#endif
