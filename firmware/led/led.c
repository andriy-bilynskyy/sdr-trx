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


#if !defined LED_TIMER_ID
#error LED_TIMER_ID not defined!
#elif LED_TIMER_ID == 1
#define RCC_APBXPeriphClockCmd  RCC_APB2PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB2Periph_TIM1
#define TIMY                    TIM1
#define TIMY_IRQn               TIM1_UP_TIM10_IRQn
#define TIMY_IRQHandler         TIM1_UP_TIM10_IRQHandler
#elif LED_TIMER_ID == 2
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM2
#define TIMY                    TIM2
#define TIMY_IRQn               TIM2_IRQn
#define TIMY_IRQHandler         TIM2_IRQHandler
#elif LED_TIMER_ID == 3
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM3
#define TIMY                    TIM3
#define TIMY_IRQn               TIM3_IRQn
#define TIMY_IRQHandler         TIM3_IRQHandler
#elif LED_TIMER_ID == 4
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM4
#define TIMY                    TIM4
#define TIMY_IRQn               TIM4_IRQn
#define TIMY_IRQHandler         TIM4_IRQHandler
#elif LED_TIMER_ID == 5
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM5
#define TIMY                    TIM5
#define TIMY_IRQn               TIM5_IRQn
#define TIMY_IRQHandler         TIM5_IRQHandler
#elif LED_TIMER_ID == 6
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM6
#define TIMY                    TIM6
#define TIMY_IRQn               TIM6_DAC_IRQn
#define TIMY_IRQHandler         TIM6_DAC_IRQHandler
#elif LED_TIMER_ID == 7
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM7
#define TIMY                    TIM7
#define TIMY_IRQn               TIM7_IRQn
#define TIMY_IRQHandler         TIM7_IRQHandler
#elif LED_TIMER_ID == 8
#define RCC_APBXPeriphClockCmd  RCC_APB2PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB2Periph_TIM8
#define TIMY                    TIM8
#define TIMY_IRQn               TIM8_UP_TIM13_IRQn
#define TIMY_IRQHandler         TIM8_UP_TIM13_IRQHandler
#elif LED_TIMER_ID == 9
#define RCC_APBXPeriphClockCmd  RCC_APB2PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB2Periph_TIM9
#define TIMY                    TIM9
#define TIMY_IRQn               TIM1_BRK_TIM9_IRQn
#define TIMY_IRQHandler         TIM1_BRK_TIM9_IRQHandler
#elif LED_TIMER_ID == 10
#define RCC_APBXPeriphClockCmd  RCC_APB2PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB2Periph_TIM10
#define TIMY                    TIM10
#define TIMY_IRQn               TIM1_UP_TIM10_IRQn
#define TIMY_IRQHandler         TIM1_UP_TIM10_IRQHandler
#elif LED_TIMER_ID == 11
#define RCC_APBXPeriphClockCmd  RCC_APB2PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB2Periph_TIM11
#define TIMY                    TIM11
#define TIMY_IRQn               TIM1_TRG_COM_TIM11_IRQn
#define TIMY_IRQHandler         TIM1_TRG_COM_TIM11_IRQHandler
#elif LED_TIMER_ID == 12
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM12
#define TIMY                    TIM12
#define TIMY_IRQn               TIM8_BRK_TIM12_IRQn
#define TIMY_IRQHandler         TIM8_BRK_TIM12_IRQHandler
#elif LED_TIMER_ID == 13
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM13
#define TIMY                    TIM13
#define TIMY_IRQn               TIM8_UP_TIM13_IRQn
#define TIMY_IRQHandler         TIM8_UP_TIM13_IRQHandler
#elif LED_TIMER_ID == 14
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM14
#define TIMY                    TIM14
#define TIMY_IRQn               TIM8_TRG_COM_TIM14_IRQn
#define TIMY_IRQHandler         TIM8_TRG_COM_TIM14_IRQHandler
#else
#error Invaled LED_TIMER_ID!
#endif


static void led_start_timer(uint16_t T_0_1ms);
static void led_stop_timer(void);


void led_start(void) {
    GPIO_InitTypeDef  led;

    led.GPIO_Mode = GPIO_Mode_OUT;
    led.GPIO_OType = GPIO_OType_PP;
    led.GPIO_PuPd = GPIO_PuPd_NOPULL;
    led.GPIO_Speed = GPIO_Speed_2MHz;
    led.GPIO_Pin = LED_PIN;

    GPIO_Init(LED_PORT, &led);
    GPIO_WriteBit(LED_PORT, LED_PIN, Bit_RESET);

    RCC_APBXPeriphClockCmd(RCC_APBXPeriph_TIMY, ENABLE);
    led_stop_timer();

    NVIC_SetPriority(TIMY_IRQn, 15);
    NVIC_EnableIRQ(TIMY_IRQn);
}

void led_stop(void) {
    GPIO_InitTypeDef  led;

    NVIC_DisableIRQ(TIMY_IRQn);
    led_stop_timer();
    RCC_APBXPeriphClockCmd(RCC_APBXPeriph_TIMY, DISABLE);

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
        led_stop_timer();
        GPIO_WriteBit(LED_PORT, LED_PIN, Bit_SET);
        break;
    case LED_BLINK_SLOW:
        led_start_timer(5000);
        break;
    case LED_BLINK_FAST:
        led_start_timer(1000);
        break;
    case LED_OFF:
    default:
        led_stop_timer();
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

static void led_start_timer(uint16_t T_0_1ms) {
    TIM_TimeBaseInitTypeDef timer;

    TIM_TimeBaseStructInit(&timer);

    timer.TIM_Period =  T_0_1ms;
    timer.TIM_Prescaler = SystemCoreClock / 10000 - 1;

    TIM_TimeBaseInit(TIMY, &timer);
    TIM_ITConfig(TIMY, TIM_IT_Update, ENABLE);
    TIM_Cmd(TIMY, ENABLE);
}

static void led_stop_timer(void) {
    TIM_Cmd(TIMY, DISABLE);
    TIM_ITConfig(TIMY, TIM_IT_Update, DISABLE);
}

void TIMY_IRQHandler(void) {
    if(TIM_GetITStatus(TIMY, TIM_IT_Update) != RESET) {
        TIM_ClearITPendingBit(TIMY, TIM_IT_Update);
        led_invert();
    }
}
