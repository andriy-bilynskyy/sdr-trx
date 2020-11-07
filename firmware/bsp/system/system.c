/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    System on/off driver source file
*/

#include "system.h"
#include "system_conf.h"
#include "stm32f4xx_conf.h"


static volatile bool system_hw_key_started = false;


void system_pwr_hold_on(void) {

    GPIO_WriteBit(SYSTEM_PWR_OFF_PORT, SYSTEM_PWR_OFF_PIN, Bit_SET);

    GPIO_InitTypeDef  gpio = {
        .GPIO_Pin = SYSTEM_PWR_OFF_PIN,
        .GPIO_Mode = GPIO_Mode_OUT,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_Low_Speed
    };
    GPIO_Init(SYSTEM_PWR_OFF_PORT, &gpio);
}

void system_pwr_hold_off(void) {

    GPIO_InitTypeDef  gpio = {
        .GPIO_Pin = SYSTEM_PWR_OFF_PIN,
        .GPIO_Mode = GPIO_Mode_IN,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_Low_Speed
    };
    GPIO_Init(SYSTEM_PWR_OFF_PORT, &gpio);

    GPIO_WriteBit(SYSTEM_PWR_OFF_PORT, SYSTEM_PWR_OFF_PIN, Bit_RESET);
}

void system_hw_key_start(void) {

    if(!system_hw_key_started) {

        GPIO_WriteBit(SYSTEM_HW_KEY_PWR_PORT, SYSTEM_HW_KEY_PWR_PIN, Bit_RESET);
        GPIO_WriteBit(SYSTEM_HW_KEY_PTT_PORT, SYSTEM_HW_KEY_PTT_PIN, Bit_RESET);

        GPIO_InitTypeDef  gpio = {
            .GPIO_Mode = GPIO_Mode_IN,
            .GPIO_OType = GPIO_OType_PP,
            .GPIO_PuPd = GPIO_PuPd_UP,
            .GPIO_Speed = GPIO_Low_Speed
        };

        gpio.GPIO_Pin = SYSTEM_HW_KEY_PWR_PIN;
        GPIO_Init(SYSTEM_HW_KEY_PWR_PORT, &gpio);
        gpio.GPIO_Pin = SYSTEM_HW_KEY_PTT_PIN;
        GPIO_Init(SYSTEM_HW_KEY_PTT_PORT, &gpio);

        system_hw_key_started = true;
    }
}

void system_hw_key_stop(void) {

    if(system_hw_key_started) {
        system_hw_key_started = false;

        GPIO_InitTypeDef  gpio = {
            .GPIO_Mode = GPIO_Mode_IN,
            .GPIO_OType = GPIO_OType_PP,
            .GPIO_PuPd = GPIO_PuPd_NOPULL,
            .GPIO_Speed = GPIO_Low_Speed
        };

        gpio.GPIO_Pin = SYSTEM_HW_KEY_PWR_PIN;
        GPIO_Init(SYSTEM_HW_KEY_PWR_PORT, &gpio);
        gpio.GPIO_Pin = SYSTEM_HW_KEY_PTT_PIN;
        GPIO_Init(SYSTEM_HW_KEY_PTT_PORT, &gpio);

        GPIO_WriteBit(SYSTEM_HW_KEY_PWR_PORT, SYSTEM_HW_KEY_PWR_PIN, Bit_RESET);
        GPIO_WriteBit(SYSTEM_HW_KEY_PTT_PORT, SYSTEM_HW_KEY_PTT_PIN, Bit_RESET);
    }
}

bool system_hw_key_pressed(system_hw_key_t key) {

    bool result = false;
    if(system_hw_key_started) {
        switch(key) {
        case SYSTEM_HW_KEY_PWR:
            result = (GPIO_ReadInputDataBit(SYSTEM_HW_KEY_PWR_PORT, SYSTEM_HW_KEY_PWR_PIN) == Bit_RESET);
            break;
        case SYSTEM_HW_KEY_PTT:
            result = (GPIO_ReadInputDataBit(SYSTEM_HW_KEY_PTT_PORT, SYSTEM_HW_KEY_PTT_PIN) == Bit_RESET);
            break;
        default:
            break;
        }
    }
    return result;
}
