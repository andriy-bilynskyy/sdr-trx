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
#include <string.h>


int main(void) {

    DBG_OUT("main start");

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1 | RCC_AHB1Periph_DMA2, ENABLE);
    RCC_AHB1PeriphClockCmd( RCC_AHB1Periph_GPIOA |
                            RCC_AHB1Periph_GPIOB |
                            RCC_AHB1Periph_GPIOC |
                            RCC_AHB1Periph_GPIOD, ENABLE);
    led_start();
    hwctl_start();
    hwctl_bkl_power(true);

    if(ui_engine_start()) {

        for(;;) {
            ui_engine_draw_start(0, 0, 0);
            ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
            ui_engine_text(0, ui_engine_get_xsize() / 2, 20, UI_ENGINE_FONT29, "Test", true);

            ui_engine_button(1, (ui_engine_get_xsize() - 250) / 2, 50, 250, 40, UI_ENGINE_FONT28, "HARD FAULT");
            ui_engine_button(2, (ui_engine_get_xsize() - 250) / 2, 100, 250, 40, UI_ENGINE_FONT28, "ASSERT FAILED");
            ui_engine_button(3, (ui_engine_get_xsize() - 250) / 2, 150, 250, 40, UI_ENGINE_FONT28, "UNHANDLED INTERRUPT");
            ui_engine_button(4, (ui_engine_get_xsize() - 250) / 2, 200, 250, 40, UI_ENGINE_FONT28, "STACK OVERFLOWED");

            ui_engine_draw_end();

            ui_engine_touch_t touch = ui_engine_get_touch(true);

            if(touch.tag == 1) {
                void (*foo)(void) = (void*)0x157;
                foo();
            }

            if(touch.tag == 2) {
                RCC_APB2PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
            }

            if(touch.tag == 3) {
                RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM7, ENABLE);

                TIM_TimeBaseInitTypeDef timer;
                TIM_TimeBaseStructInit(&timer);
                timer.TIM_Period =  0;
                timer.TIM_Prescaler = 0;
                TIM_TimeBaseInit(TIM7, &timer);
                TIM_ITConfig(TIM7, TIM_IT_Update, ENABLE);
                TIM_Cmd(TIM7, ENABLE);
                NVIC_SetPriority(TIM7_IRQn, 15);
                NVIC_EnableIRQ(TIM7_IRQn);
            }

            if(touch.tag == 4) {
                volatile uint8_t data[2048];
                memset((void *)data, 1, sizeof(data));
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
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1 | RCC_AHB1Periph_DMA2, DISABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, DISABLE);

    return 0;
}
