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
#include "debug.h"
#include "led.h"
#include "hwctl.h"
#include "trxctl.h"
#include "key.h"


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
    hwctl_start();
    trxctl_start();
    key_start();

    hwctl_rx_power(DEV_ON);
    trxctl_rxen(true);
    //trxctl_txen(true);
    hwctl_set_band(4);

    // if(trxctl_rxget()) {
    //     led_set(LED_BLINK_FAST);
    // } else {
    //     led_set(LED_BLINK_SLOW);
    // }

    for(;;) {
        if(key_pwr() == KEY_PRESSED) {
            led_set(LED_BLINK_FAST);
        }
        if(key_ptt() == KEY_HOLD) {
            led_set(LED_BLINK_SLOW);
        }
    }

    key_stop();
    trxctl_stop();
    hwctl_stop();
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
