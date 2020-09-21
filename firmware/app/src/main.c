/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/


#include "stm32f4xx_conf.h"
#include "critical_err.h"
#include "debug.h"
#include "led.h"
#include "hwctl.h"
#include "ui_engine.h"
#include "widget_date_time.h"
#include "rtc.h"


int main(void) {

    DBG_OUT("main start");

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1 | RCC_AHB1Periph_DMA2, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_BKPSRAM, ENABLE);
    RCC_AHB1PeriphClockCmd( RCC_AHB1Periph_GPIOA |
                            RCC_AHB1Periph_GPIOB |
                            RCC_AHB1Periph_GPIOC |
                            RCC_AHB1Periph_GPIOD, ENABLE);

    bool rtc_inited = rtc_init();

    led_start();
    hwctl_start();
    hwctl_bkl_power(true);

    if(ui_engine_start()) {

        for(;;) {
            if(rtc_inited) {
                widget_date_time();
            } else {
                widget_date_lse_fail();
            }
            critical_err_stack_check();
        }

    } else {
        led_set(true);
        DBG_OUT("UI engine failed");
        for(;;);
    }

    ui_engine_stop();
    hwctl_bkl_power(false);
    hwctl_stop();
    led_stop();
    RCC_AHB1PeriphClockCmd( RCC_AHB1Periph_GPIOA |
                            RCC_AHB1Periph_GPIOB |
                            RCC_AHB1Periph_GPIOC |
                            RCC_AHB1Periph_GPIOD, DISABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_BKPSRAM, DISABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1 | RCC_AHB1Periph_DMA2, DISABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, DISABLE);

    return 0;
}
