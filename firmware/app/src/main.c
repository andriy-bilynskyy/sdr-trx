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
#include "rtc.h"
#include "adc.h"
#include "widgets.h"


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
    adc_start();

    hwctl_bkl_power(true);

    if(ui_engine_start()) {

        widget_t current_widget = widget_main;

        for(;;) {

            current_widget = (widget_t)current_widget();
            if(current_widget == widget_date_time && !rtc_inited) {
                current_widget = widget_date_time_lse_fail;
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

    adc_stop();
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
