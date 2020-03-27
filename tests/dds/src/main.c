/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the MIT.
**
********************************************************************************
*/

#include "stm32f10x_conf.h"

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


#define LED_PIN     GPIO_Pin_13
#define LED_PORT    GPIOC


void sleep_ms(unsigned int ms)
{
    while(ms--)
    {
        volatile unsigned int tmp = 5971u;
        while(tmp--)
        {
            __asm("nop");
        }
    }
}


#define AD9850_CLOCK   125000000
#define AD9850_PORT    GPIOA
#define AD9850_W_CLK   GPIO_Pin_5
#define AD9850_FQ_UD   GPIO_Pin_6
#define AD9850_DATA    GPIO_Pin_7
#define AD9850_RESET   GPIO_Pin_4

void AD9850_pulse(uint16_t GPIO_Pin)
{
    GPIO_SetBits(AD9850_PORT, GPIO_Pin);
    GPIO_ResetBits(AD9850_PORT, GPIO_Pin);
}

void AD9850_tfr_byte(uint8_t data)
{
    for(uint8_t i = 0; i < 8; i++, data >>= 1)
    {
        GPIO_WriteBit(AD9850_PORT, AD9850_DATA, data & 0x01);
        AD9850_pulse(AD9850_W_CLK);
    }
}

void AD9850_init(void)
{
    GPIO_InitTypeDef GPIO_InitStruct_AD9850;
    GPIO_InitStruct_AD9850.GPIO_Pin = AD9850_W_CLK | AD9850_FQ_UD | AD9850_DATA | AD9850_RESET;
    GPIO_InitStruct_AD9850.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStruct_AD9850.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(AD9850_PORT, &GPIO_InitStruct_AD9850);

    AD9850_pulse(AD9850_RESET);
    AD9850_pulse(AD9850_W_CLK);
    // this pulse enables serial mode - Datasheet page 12 figure 10
    AD9850_pulse(AD9850_FQ_UD);
}

void AD9850_set_frequency(uint32_t frequency)
{
    uint32_t reg = ((uint64_t)frequency << 32) / AD9850_CLOCK;
    for(uint8_t i = 0; i < 4; i++, reg >>= 8)
    {
        AD9850_tfr_byte(reg & 0xFF);
    }
    AD9850_tfr_byte(0x00);
    AD9850_pulse(AD9850_FQ_UD);
}

void AD9850_sleep(void)
{
    for(uint8_t i = 0; i < 4; i++)
    {
        AD9850_tfr_byte(0x00);
    }
    AD9850_tfr_byte(1<<2);
    AD9850_pulse(AD9850_FQ_UD);
}

#define DELAY 100

int main(void) {
    DBG_INIT();
    DBG_OUT("main() start");

    RCC_APB2PeriphClockCmd( RCC_APB2Periph_AFIO  |   \
                            RCC_APB2Periph_GPIOA |   \
                            RCC_APB2Periph_GPIOB |   \
                            RCC_APB2Periph_GPIOC |   \
                            RCC_APB2Periph_GPIOD |   \
                            RCC_APB2Periph_GPIOE |   \
                            RCC_APB2Periph_GPIOF |   \
                            RCC_APB2Periph_GPIOG, ENABLE);

    GPIO_InitTypeDef GPIO_InitStruct_LED;
    GPIO_InitStruct_LED.GPIO_Pin = LED_PIN;
    GPIO_InitStruct_LED.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStruct_LED.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(LED_PORT, &GPIO_InitStruct_LED);

    AD9850_init();


    for(;;) {
        // S
        AD9850_set_frequency(10000000);
        sleep_ms(DELAY);
        AD9850_sleep();
        sleep_ms(DELAY);

        AD9850_set_frequency(10000000);
        sleep_ms(DELAY);
        AD9850_sleep();
        sleep_ms(DELAY);

        AD9850_set_frequency(10000000);
        sleep_ms(DELAY);
        AD9850_sleep();
        sleep_ms(3 * DELAY);

        // K
        AD9850_set_frequency(10000000);
        sleep_ms(3 * DELAY);
        AD9850_sleep();
        sleep_ms(DELAY);

        AD9850_set_frequency(10000000);
        sleep_ms(DELAY);
        AD9850_sleep();
        sleep_ms(DELAY);

        AD9850_set_frequency(10000000);
        sleep_ms(3 * DELAY);
        AD9850_sleep();
        sleep_ms(3 * DELAY);

        // Y
        AD9850_set_frequency(10000000);
        sleep_ms(3 * DELAY);
        AD9850_sleep();
        sleep_ms(DELAY);

        AD9850_set_frequency(10000000);
        sleep_ms(DELAY);
        AD9850_sleep();
        sleep_ms(DELAY);

        AD9850_set_frequency(10000000);
        sleep_ms(3 * DELAY);
        AD9850_sleep();
        sleep_ms(DELAY);

        AD9850_set_frequency(10000000);
        sleep_ms(3 * DELAY);
        AD9850_sleep();
        sleep_ms(3 * DELAY);

        // N
        AD9850_set_frequency(10000000);
        sleep_ms(3 * DELAY);
        AD9850_sleep();
        sleep_ms(DELAY);

        AD9850_set_frequency(10000000);
        sleep_ms(DELAY);
        AD9850_sleep();
        sleep_ms(3 * DELAY);

        // E
        AD9850_set_frequency(10000000);
        sleep_ms(DELAY);
        AD9850_sleep();
        sleep_ms(3 * DELAY);

        // T
        AD9850_set_frequency(10000000);
        sleep_ms(3 * DELAY);
        AD9850_sleep();
        sleep_ms(7 * DELAY);
    }

    RCC_APB2PeriphClockCmd( RCC_APB2Periph_AFIO  |   \
                            RCC_APB2Periph_GPIOA |   \
                            RCC_APB2Periph_GPIOB |   \
                            RCC_APB2Periph_GPIOC |   \
                            RCC_APB2Periph_GPIOD |   \
                            RCC_APB2Periph_GPIOE |   \
                            RCC_APB2Periph_GPIOF |   \
                            RCC_APB2Periph_GPIOG, DISABLE);
}


#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line) {
    DBG_OUT("assertion in %s:%04u", file, (unsigned int)line);
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
    for(;;);
}
