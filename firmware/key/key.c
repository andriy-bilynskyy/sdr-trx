/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    key driver source file
*/

#include "key.h"
#include "key_conf.h"
#include "stm32f4xx_conf.h"


#if !defined KEY_TIMER_ID
#error KEY_TIMER_ID not defined!
#elif KEY_TIMER_ID == 1
#define RCC_APBXPeriphClockCmd  RCC_APB2PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB2Periph_TIM1
#define TIMY                    TIM1
#define TIMY_IRQn               TIM1_UP_TIM10_IRQn
#define TIMY_IRQHandler         TIM1_UP_TIM10_IRQHandler
#elif KEY_TIMER_ID == 2
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM2
#define TIMY                    TIM2
#define TIMY_IRQn               TIM2_IRQn
#define TIMY_IRQHandler         TIM2_IRQHandler
#elif KEY_TIMER_ID == 3
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM3
#define TIMY                    TIM3
#define TIMY_IRQn               TIM3_IRQn
#define TIMY_IRQHandler         TIM3_IRQHandler
#elif KEY_TIMER_ID == 4
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM4
#define TIMY                    TIM4
#define TIMY_IRQn               TIM4_IRQn
#define TIMY_IRQHandler         TIM4_IRQHandler
#elif KEY_TIMER_ID == 5
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM5
#define TIMY                    TIM5
#define TIMY_IRQn               TIM5_IRQn
#define TIMY_IRQHandler         TIM5_IRQHandler
#elif KEY_TIMER_ID == 6
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM6
#define TIMY                    TIM6
#define TIMY_IRQn               TIM6_DAC_IRQn
#define TIMY_IRQHandler         TIM6_DAC_IRQHandler
#elif KEY_TIMER_ID == 7
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM7
#define TIMY                    TIM7
#define TIMY_IRQn               TIM7_IRQn
#define TIMY_IRQHandler         TIM7_IRQHandler
#elif KEY_TIMER_ID == 8
#define RCC_APBXPeriphClockCmd  RCC_APB2PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB2Periph_TIM8
#define TIMY                    TIM8
#define TIMY_IRQn               TIM8_UP_TIM13_IRQn
#define TIMY_IRQHandler         TIM8_UP_TIM13_IRQHandler
#elif KEY_TIMER_ID == 9
#define RCC_APBXPeriphClockCmd  RCC_APB2PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB2Periph_TIM9
#define TIMY                    TIM9
#define TIMY_IRQn               TIM1_BRK_TIM9_IRQn
#define TIMY_IRQHandler         TIM1_BRK_TIM9_IRQHandler
#elif KEY_TIMER_ID == 10
#define RCC_APBXPeriphClockCmd  RCC_APB2PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB2Periph_TIM10
#define TIMY                    TIM10
#define TIMY_IRQn               TIM1_UP_TIM10_IRQn
#define TIMY_IRQHandler         TIM1_UP_TIM10_IRQHandler
#elif KEY_TIMER_ID == 11
#define RCC_APBXPeriphClockCmd  RCC_APB2PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB2Periph_TIM11
#define TIMY                    TIM11
#define TIMY_IRQn               TIM1_TRG_COM_TIM11_IRQn
#define TIMY_IRQHandler         TIM1_TRG_COM_TIM11_IRQHandler
#elif KEY_TIMER_ID == 12
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM12
#define TIMY                    TIM12
#define TIMY_IRQn               TIM8_BRK_TIM12_IRQn
#define TIMY_IRQHandler         TIM8_BRK_TIM12_IRQHandler
#elif KEY_TIMER_ID == 13
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM13
#define TIMY                    TIM13
#define TIMY_IRQn               TIM8_UP_TIM13_IRQn
#define TIMY_IRQHandler         TIM8_UP_TIM13_IRQHandler
#elif KEY_TIMER_ID == 14
#define RCC_APBXPeriphClockCmd  RCC_APB1PeriphClockCmd
#define RCC_APBXPeriph_TIMY     RCC_APB1Periph_TIM14
#define TIMY                    TIM14
#define TIMY_IRQn               TIM8_TRG_COM_TIM14_IRQn
#define TIMY_IRQHandler         TIM8_TRG_COM_TIM14_IRQHandler
#else
#error Invaled KEY_TIMER_ID!
#endif


static volatile key_state_t key_pwr_state = KEY_RELEASED;
static volatile uint32_t    key_pwr_cnt   = 0;

static volatile key_state_t key_ptt_state = KEY_RELEASED;
static volatile uint32_t    key_ptt_cnt   = 0;


void key_start(void) {
    GPIO_InitTypeDef  key;

    key.GPIO_Mode = GPIO_Mode_IN;
    key.GPIO_OType = GPIO_OType_PP;
    key.GPIO_PuPd = GPIO_PuPd_UP;
    key.GPIO_Speed = GPIO_Low_Speed;

    key.GPIO_Pin = KEY_PWR_PIN;
    GPIO_Init(KEY_PWR_PORT, &key);
    key.GPIO_Pin = KEY_PTT_PIN;
    GPIO_Init(KEY_PTT_PORT, &key);

    if(GPIO_ReadInputDataBit(KEY_PWR_PORT, KEY_PWR_PIN) == Bit_RESET) {
        key_pwr_state = KEY_ACTIVATED;
    } else {
        key_pwr_state = KEY_RELEASED;
    }

    if(GPIO_ReadInputDataBit(KEY_PTT_PORT, KEY_PTT_PIN) == Bit_RESET) {
        key_ptt_state = KEY_ACTIVATED;
    } else {
        key_ptt_state = KEY_RELEASED;
    }

    RCC_APBXPeriphClockCmd(RCC_APBXPeriph_TIMY, ENABLE);

    TIM_TimeBaseInitTypeDef timer;
    TIM_TimeBaseStructInit(&timer);

    timer.TIM_Period =  KEY_SCAN_T_MS * 10;
    timer.TIM_Prescaler = SystemCoreClock / 10000 - 1;
    TIM_TimeBaseInit(TIMY, &timer);

    TIM_ITConfig(TIMY, TIM_IT_Update, ENABLE);
    TIM_Cmd(TIMY, ENABLE);

    NVIC_SetPriority(TIMY_IRQn, 14);
    NVIC_EnableIRQ(TIMY_IRQn);
}

void key_stop(void) {

    NVIC_DisableIRQ(TIMY_IRQn);

    TIM_Cmd(TIMY, DISABLE);
    TIM_ITConfig(TIMY, TIM_IT_Update, DISABLE);

    RCC_APBXPeriphClockCmd(RCC_APBXPeriph_TIMY, DISABLE);

    GPIO_InitTypeDef  key;

    key.GPIO_Mode = GPIO_Mode_IN;
    key.GPIO_OType = GPIO_OType_PP;
    key.GPIO_PuPd = GPIO_PuPd_NOPULL;
    key.GPIO_Speed = GPIO_Low_Speed;

    key.GPIO_Pin = KEY_PWR_PIN;
    GPIO_Init(KEY_PWR_PORT, &key);
    key.GPIO_Pin = KEY_PTT_PIN;
    GPIO_Init(KEY_PTT_PORT, &key);

    key_pwr_state = KEY_RELEASED;
    key_ptt_state = KEY_RELEASED;
}

key_state_t key_pwr(void) {
    return key_pwr_state;
}

key_state_t key_ptt(void) {
    return key_ptt_state;
}

void TIMY_IRQHandler(void) {
    if(TIM_GetITStatus(TIMY, TIM_IT_Update) != RESET) {
        TIM_ClearITPendingBit(TIMY, TIM_IT_Update);

        if(GPIO_ReadInputDataBit(KEY_PWR_PORT, KEY_PWR_PIN) != Bit_RESET) {
            key_pwr_state = KEY_RELEASED;
        } else {
            switch(key_pwr_state) {
            case KEY_RELEASED:
                key_pwr_state = KEY_PRESSED;
                key_pwr_cnt = 0;
                break;
            case KEY_PRESSED:
                key_pwr_cnt ++;
                if(key_pwr_cnt > KEY_HOLD_T_MS / KEY_SCAN_T_MS) {
                    key_pwr_state = KEY_HOLD;
                }
                break;
            default:
                break;
            }
        }

        if(GPIO_ReadInputDataBit(KEY_PTT_PORT, KEY_PTT_PIN) != Bit_RESET) {
            key_ptt_state = KEY_RELEASED;
        } else {
            switch(key_ptt_state) {
            case KEY_RELEASED:
                key_ptt_state = KEY_PRESSED;
                key_ptt_cnt = 0;
                break;
            case KEY_PRESSED:
                key_ptt_cnt ++;
                if(key_ptt_cnt > KEY_HOLD_T_MS / KEY_SCAN_T_MS) {
                    key_ptt_state = KEY_HOLD;
                }
                break;
            default:
                break;
            }
        }

    }
}

