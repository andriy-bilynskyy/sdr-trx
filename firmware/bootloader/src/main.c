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
#include "led.h"

#ifdef DEBUG
#include <stdio.h>

extern void initialise_monitor_handles(void);

#define DBG_INIT() initialise_monitor_handles()
#define DBG_OUT(fmt, ...)   \
                printf("%s:%04u " fmt "\n", __FILE__, (unsigned)__LINE__, ##__VA_ARGS__)
#else
#define DBG_INIT()
#define DBG_OUT(fmt, ...)
#endif


void sleep_ms(unsigned int ms) {
    while(ms--) {
        volatile unsigned int tmp = 5971u;
        while(tmp--) {
            __asm("nop");
        }
    }
}


int main(void) {

    DBG_INIT();

    RCC_AHB1PeriphClockCmd( RCC_AHB1Periph_GPIOA |
                            RCC_AHB1Periph_GPIOB |
                            RCC_AHB1Periph_GPIOC |
                            RCC_AHB1Periph_GPIOD, ENABLE);

    led_start();
    led_set(LED_BLINK_FAST);
    for(;;) {
        DBG_OUT("test!");
        sleep_ms(500);
    }
    led_stop();

    RCC_AHB1PeriphClockCmd( RCC_AHB1Periph_GPIOA |
                            RCC_AHB1Periph_GPIOB |
                            RCC_AHB1Periph_GPIOC |
                            RCC_AHB1Periph_GPIOD, DISABLE);

    return 0;
}


#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line) {
    DBG_OUT("assertion in %s:%04u", file, (unsigned int)line);
    led_set(LED_ON);
    for(;;);
}
#endif


__attribute__((naked)) void HardFault_Handler(void) {
    __asm volatile
    (
        " tst lr, #4                    \n"
        " ite eq                        \n"
        " mrseq r0, msp                 \n"
        " mrsne r0, psp                 \n"
        " bl prvGetRegistersFromStack   \n"
    );
    led_set(LED_ON);
    for(;;);
}


void prvGetRegistersFromStack(unsigned int * pStack) {
    DBG_OUT("hard fault\n"
            "R0  = %08x\n"
            "R1  = %08x\n"
            "R2  = %08x\n"
            "R3  = %08x\n"
            "R12 = %08x\n"
            "LR  = %08x\n"
            "PC  = %08x\n"
            "PSR = %08x\n",
            pStack[0], pStack[1], pStack[2], pStack[3],
            pStack[4], pStack[5], pStack[6], pStack[7]);
}


void SystemHseFailed(void) {
    DBG_OUT("HSE failed");
    led_set(LED_ON);
    for(;;);
}
