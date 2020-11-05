/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    LED driver source file
*/

#include "led.h"
#include "led_conf.h"
#include "stm32f4xx_conf.h"


static volatile bool led_started  = false;


void led_start(void) {

    if(!led_started) {
        GPIO_WriteBit(LED_PORT, LED_PIN, Bit_RESET);

        GPIO_InitTypeDef  gpio = {
            .GPIO_Pin = LED_PIN,
            .GPIO_Mode = GPIO_Mode_OUT,
            .GPIO_OType = GPIO_OType_PP,
            .GPIO_PuPd = GPIO_PuPd_NOPULL,
            .GPIO_Speed = GPIO_Low_Speed
        };
        GPIO_Init(LED_PORT, &gpio);
        led_started = true;
    }
}

void led_stop(void) {

    if(led_started) {
        led_started = false;
        GPIO_InitTypeDef  gpio = {
            .GPIO_Pin = LED_PIN,
            .GPIO_Mode = GPIO_Mode_IN,
            .GPIO_OType = GPIO_OType_PP,
            .GPIO_PuPd = GPIO_PuPd_NOPULL,
            .GPIO_Speed = GPIO_Low_Speed
        };
        GPIO_Init(LED_PORT, &gpio);

        GPIO_WriteBit(LED_PORT, LED_PIN, Bit_RESET);
    }
}

void led_set(bool on) {

    if(led_started) {
        if(on) {
            GPIO_WriteBit(LED_PORT, LED_PIN, Bit_SET);
        } else {
            GPIO_WriteBit(LED_PORT, LED_PIN, Bit_RESET);
        }
    }
}

void led_invert(void) {

    if(led_started) {
        if(GPIO_ReadOutputDataBit(LED_PORT, LED_PIN) == Bit_RESET) {
            GPIO_WriteBit(LED_PORT, LED_PIN, Bit_SET);
        } else {
            GPIO_WriteBit(LED_PORT, LED_PIN, Bit_RESET);
        }
    }
}
