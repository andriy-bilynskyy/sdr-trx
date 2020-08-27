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


void led_start(void) {
    GPIO_InitTypeDef  led;

    led.GPIO_Mode = GPIO_Mode_OUT;
    led.GPIO_OType = GPIO_OType_PP;
    led.GPIO_PuPd = GPIO_PuPd_NOPULL;
    led.GPIO_Speed = GPIO_Speed_2MHz;
    led.GPIO_Pin = LED_PIN;

    GPIO_Init(LED_PORT, &led);
    GPIO_WriteBit(LED_PORT, LED_PIN, Bit_RESET);
}

void led_stop(void) {
    GPIO_InitTypeDef  led;

    led.GPIO_Mode = GPIO_Mode_IN;
    led.GPIO_OType = GPIO_OType_PP;
    led.GPIO_PuPd = GPIO_PuPd_NOPULL;
    led.GPIO_Speed = GPIO_Speed_2MHz;
    led.GPIO_Pin = LED_PIN;

    GPIO_Init(LED_PORT, &led);
    GPIO_WriteBit(LED_PORT, LED_PIN, Bit_RESET);
}

void led_set(led_mode_t mode) {
    switch(mode) {
    case LED_ON:
        GPIO_WriteBit(LED_PORT, LED_PIN, Bit_SET);
        break;
    case LED_OFF:
    default:
        GPIO_WriteBit(LED_PORT, LED_PIN, Bit_RESET);
        break;
    }
}

void led_invert(void) {
    if(GPIO_ReadOutputDataBit(LED_PORT, LED_PIN) == Bit_RESET) {
        GPIO_WriteBit(LED_PORT, LED_PIN, Bit_SET);
    } else {
        GPIO_WriteBit(LED_PORT, LED_PIN, Bit_RESET);
    }
}
