/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    FT813 interrupt display driver source file
    https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT81x.pdf
*/

#include "ft813_interrupt.h"
#include "ui_engine_conf.h"
#include "ui_engine_os_dep.h"
#include "stm32f4xx_conf.h"


void ft813_interrupt_start(void) {

    ft813_int_create_sync();

    GPIO_WriteBit(UI_FT813_INT_PORT, UI_FT813_INT_PIN, Bit_RESET);

    GPIO_InitTypeDef  gpio = {
        .GPIO_Pin = UI_FT813_INT_PIN,
        .GPIO_Mode = GPIO_Mode_IN,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_UP,
        .GPIO_Speed = GPIO_High_Speed
    };
    GPIO_Init(UI_FT813_INT_PORT, &gpio);

    SYSCFG_EXTILineConfig(UI_FT813_INT_PORT_SRC, UI_FT813_INT_PIN_SRC);

    EXTI_InitTypeDef ext_int;
    EXTI_StructInit(&ext_int);
    ext_int.EXTI_Line = UI_FT813_INT_LINE;
    ext_int.EXTI_LineCmd = ENABLE;
    EXTI_Init(&ext_int);

    NVIC_SetPriority(UI_FT813_INT_IRQ, UI_FT813_INT_IRQ_PRIO);
    NVIC_EnableIRQ(UI_FT813_INT_IRQ);
}

void ft813_interrupt_stop(void) {

    NVIC_DisableIRQ(UI_FT813_INT_IRQ);

    EXTI_InitTypeDef ext_int;
    EXTI_StructInit(&ext_int);
    ext_int.EXTI_Line = UI_FT813_INT_LINE;
    EXTI_Init(&ext_int);

    GPIO_InitTypeDef  gpio = {
        .GPIO_Pin = UI_FT813_INT_PIN,
        .GPIO_Mode = GPIO_Mode_IN,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_Low_Speed
    };
    GPIO_Init(UI_FT813_INT_PORT, &gpio);

    GPIO_WriteBit(UI_FT813_INT_PORT, UI_FT813_INT_PIN, Bit_RESET);

    ft813_int_delete_sync();
}

void ft813_interrupt_wait(void) {
    ft813_int_sync_wait(UI_ENGINE_TOUCH_UNBLOCK_MS);
}

void UI_FT813_INT_IRQ_HANDL(void) {
    if(EXTI_GetITStatus(UI_FT813_INT_LINE) != RESET) {
        EXTI_ClearITPendingBit(UI_FT813_INT_LINE);
        ft813_int_sync_set_isr();
    }
}
