/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    24 series memory driver source file
    http://ww1.microchip.com/downloads/en/DeviceDoc/21189T.pdf
*/


#include "mem24.h"
#include "i2c_master.h"
#include "misc_hal.h"
#include <string.h>


#define MEM42_I2C_ADDRESS      0x50


uint32_t mem24_write(uint32_t addr, const void * data, uint32_t size) {

    uint32_t wr = 0;
    while(size && data && addr < MEM24_SIZE) {
        uint8_t page_buf[2UL + ((MEM24_PAGE_SIZE - addr % MEM24_PAGE_SIZE < size) ? (MEM24_PAGE_SIZE - addr % MEM24_PAGE_SIZE) : size)];
        page_buf[0] = addr >> 8;
        page_buf[1] = addr;
        memcpy(&page_buf[2], data, sizeof(page_buf) - 2);

        uint32_t bt = i2c_master_write(MEM42_I2C_ADDRESS, page_buf, sizeof(page_buf));
        if(bt >= 2) {
#if MEM24_PAGE_WR_T > 0
            misc_hal_sleep_ms(MEM24_PAGE_WR_T);
#endif
            bt -= 2;
            addr += bt;
            data = (uint8_t *)data + bt;
            size -= bt;
        } else {
            break;
        }
    }

    return wr;
}

uint32_t mem24_read(uint32_t addr, void * data, uint32_t size) {

    uint8_t a_buf[] = {addr >> 8, addr};
    i2c_master_write(MEM42_I2C_ADDRESS, a_buf, sizeof(a_buf));
    return i2c_master_read(MEM42_I2C_ADDRESS, data, size);
}

bool mem24_whole_erase(void) {

    bool result = true;
    uint8_t page_buf[MEM24_PAGE_SIZE + 2] = {[2 ... (MEM24_PAGE_SIZE + 1)] = 0xFF};
    uint32_t addr = 0;

    while(addr < MEM24_SIZE) {
        page_buf[0] = addr >> 8;
        page_buf[1] = addr;

        uint32_t bt = i2c_master_write(MEM42_I2C_ADDRESS, page_buf, sizeof(page_buf));
        if(bt >= 2) {
#if MEM24_PAGE_WR_T > 0
            misc_hal_sleep_ms(MEM24_PAGE_WR_T);
#endif
            addr += bt - 2;
        } else {
            result = false;
            break;
        }
    }
    return result;
}
