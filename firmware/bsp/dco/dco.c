/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Digital controlled oscillator driver source file
    SI5351 CMOS clock generator
    https://www.silabs.com/documents/public/data-sheets/Si5351-B.pdf
    https://www.silabs.com/documents/public/application-notes/AN619.pdf
*/


#include "dco.h"
#include "hwctl.h"
#include "i2c_master.h"
#include "misc_hal.h"


bool dco_start(void) {

    hwctl_start();
    i2c_master_start();

    hwctl_rx_power(true);
    misc_hal_sleep_ms(10);      /* power stabilization */
    return true;
}

void dco_stop(void) {

    hwctl_rx_power(false);
}

bool dco_set_frequency(uint32_t frequency) {

    return true;
}
