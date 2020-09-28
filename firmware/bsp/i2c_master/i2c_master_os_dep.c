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
#include "stm32f4xx_conf.h"


static volatile uint8_t i2c_op_complete = 0;    /* operation complete semaphore */
static volatile uint8_t i2c_dev_enable = 1;     /* device mutex */


void i2c_post_sync_obj(void) {

    i2c_op_complete = 1;
}

void i2c_pend_sync_obj(void) {

    while(!i2c_op_complete);
    i2c_op_complete = 0;
}

void i2c_lock_sync_obj(void) {

    for(;;) {
        uint8_t val = __LDREXB(&i2c_dev_enable);
        if(val) {
            if(!__STREXB(0, &i2c_dev_enable)) {
                __DMB();
                break;
            }
        }
    }
}

void i2c_unlock_sync_obj(void) {

    i2c_dev_enable = 1;
}
