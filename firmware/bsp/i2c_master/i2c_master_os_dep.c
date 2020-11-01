/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    i2c master driver OS dependencies source file
    It's good idea to re-implement next functions in case of using RTOS
*/


#include "i2c_master_os_dep.h"
#include <stdbool.h>


static volatile bool i2c_master_sync = false;


void i2c_master_create_lock(void) {
}

void i2c_master_delete_lock(void) {
}

void i2c_master_lock(void) {
}

void i2c_master_unlock(void) {
}

void i2c_master_create_sync(void) {

    i2c_master_sync = false;
}

void i2c_master_delete_sync(void) {
}

void i2c_master_sync_set_isr(void) {

    i2c_master_sync = true;
}

void i2c_master_sync_wait(void) {

    while(!i2c_master_sync);
    i2c_master_sync = false;
}
