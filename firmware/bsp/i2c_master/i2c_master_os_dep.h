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


void i2c_master_create_lock(void)      __attribute__((weak));
void i2c_master_delete_lock(void)      __attribute__((weak));
void i2c_master_lock(void)             __attribute__((weak));
void i2c_master_unlock(void)           __attribute__((weak));

void i2c_master_create_sync(void)       __attribute__((weak));
void i2c_master_delete_sync(void)       __attribute__((weak));
void i2c_master_sync_set_isr(void)      __attribute__((weak));
void i2c_master_sync_wait(void)         __attribute__((weak));


#endif
