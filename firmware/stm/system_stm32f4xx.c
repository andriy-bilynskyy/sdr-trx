/*******************************************************************************
 * @file    system_stm32f4xx.c
 * @author  MCD Application Team
 * @version V1.8.0
 * @date    09-November-2016
 * @brief   CMSIS Cortex-M4 Device Peripheral Access Layer System Source File.
 *          This file contains the system clock configuration for STM32F4xx devices.
 *
 * 1.  This file provides two functions and one global variable to be called from
 *     user application:
 *      - SystemInit(): Setups the system clock (System clock source, PLL Multiplier
 *                      and Divider factors, AHB/APBx prescalers and Flash settings),
 *                      depending on the configuration made in the clock xls tool.
 *                      This function is called at startup just after reset and
 *                      before branch to main program. This call is made inside
 *                      the "startup_stm32f4xx.s" file.
 *
 *      - SystemCoreClock variable: Contains the core clock (HCLK), it can be used
 *                                  by the user application to setup the SysTick
 *                                  timer or configure other parameters.
 *
 *
 * 2. After each device reset the HSI (16 MHz) is used as system clock source.
 *    Then SystemInit() function is called, in "startup_stm32f4xx.s" file, to
 *    configure the system clock before to branch to main program.
 *
 * 3. If the system clock source selected by user fails to startup, the SystemInit()
 *    function will call SystemHseFailed() function. User can
 *    add some code to deal with this issue.
 *
 *
 * 4. This file configures the system clock as follows:
 *==============================================================================
 *==============================================================================
 *------------------------------------------------------------------------------
 *        System Clock source                    | PLL (HSE)
 *------------------------------------------------------------------------------
 *        SYSCLK(Hz)                             | 96000000
 *------------------------------------------------------------------------------
 *        HCLK(Hz)                               | 96000000
 *------------------------------------------------------------------------------
 *        AHB Prescaler                          | 1
 *------------------------------------------------------------------------------
 *        APB1 Prescaler                         | 2
 *------------------------------------------------------------------------------
 *        APB2 Prescaler                         | 1
 *------------------------------------------------------------------------------
 *        HSE Frequency(Hz)                      | 24000000
 *------------------------------------------------------------------------------
 *        PLL_M                                  | 12
 *------------------------------------------------------------------------------
 *        PLL_N                                  | 96
 *------------------------------------------------------------------------------
 *        PLL_P                                  | 2
 *------------------------------------------------------------------------------
 *        PLL_Q                                  | 4
 *------------------------------------------------------------------------------
 *        PLL_R                                  | 2
 *------------------------------------------------------------------------------
 *        PLLI2S_M                               | NA
 *------------------------------------------------------------------------------
 *        PLLI2S_N                               | NA
 *------------------------------------------------------------------------------
 *        PLLI2S_P                               | NA
 *------------------------------------------------------------------------------
 *        PLLI2S_Q                               | NA
 *------------------------------------------------------------------------------
 *        PLLI2S_R                               | NA
 *------------------------------------------------------------------------------
 *        I2S input clock                        | NA
 *------------------------------------------------------------------------------
 *        VDD(V)                                 | 3.3
 *------------------------------------------------------------------------------
 *        Main regulator output voltage          | Scale 1 mode <= 100 MHz
 *------------------------------------------------------------------------------
 *        Flash Latency(WS)                      | 3
 *------------------------------------------------------------------------------
 *        Prefetch Buffer                        | ON
 *------------------------------------------------------------------------------
 *        Instruction cache                      | ON
 *------------------------------------------------------------------------------
 *        Data cache                             | ON
 *------------------------------------------------------------------------------
 *        Require 48MHz for USB OTG FS,          | Disabled
 *        SDIO and RNG clock                     |
 *------------------------------------------------------------------------------
 *==============================================================================
 *******************************************************************************
 * @attention
 *
 * <h2><center>&copy; COPYRIGHT 2016 STMicroelectronics</center></h2>
 *
 * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *
 *        http://www.st.com/software_license_agreement_liberty_v2
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 ******************************************************************************/


#include "stm32f4xx.h"


/* Uncomment the following line if you need to relocate your vector Table in Internal SRAM. */
/* #define VECT_TAB_SRAM */
#define VECT_TAB_OFFSET  0x00 /* Vector Table base offset field. This value must be a multiple of 0x200. */

/* System clock sources frequencies */
#define HSI_CLK_MHZ       16000000UL
#define HSE_CLK_MHZ       24000000UL

/* PLL SECTION */
#define PLL_M      12
#define PLL_Q      4
#define PLL_R      2
#define PLL_N      96
#define PLL_P      2


void system_init(void) {
    /* FPU settings */
#if (__FPU_PRESENT == 1) && (__FPU_USED == 1)
    SCB->CPACR |= ((3UL << 10 * 2)|(3UL << 11 * 2));    /* set CP10 and CP11 Full Access */
#endif
    /* Reset the RCC clock configuration to the default reset state */
    /* Set HSION bit */
    RCC->CR |= (uint32_t)0x00000001;

    /* Reset CFGR register */
    RCC->CFGR = 0x00000000;

    /* Reset HSEON, CSSON and PLLON bits */
    RCC->CR &= (uint32_t)0xFEF6FFFF;

    /* Reset PLLCFGR register */
    RCC->PLLCFGR = 0x24003010;

    /* Reset HSEBYP bit */
    RCC->CR &= (uint32_t)0xFFFBFFFF;

    /* Disable all interrupts */
    RCC->CIR = 0x00000000;

    /* Configure the Vector Table location add offset address */
#ifdef VECT_TAB_SRAM
    SCB->VTOR = SRAM_BASE | VECT_TAB_OFFSET;            /* Vector Table Relocation in Internal SRAM */
#else
    SCB->VTOR = FLASH_BASE | VECT_TAB_OFFSET;           /* Vector Table Relocation in Internal FLASH */
#endif
}

void system_set_clock(void) {

    /***************************************************************************
     * PLL (clocked by HSE) used as System clock source
     **************************************************************************/
    __IO uint32_t startup_cnt = 0, hse_status = 0;

    /* Enable HSE */
    RCC->CR |= ((uint32_t)RCC_CR_HSEON);

    /* Wait till HSE is ready and if Time out is reached exit */
    do {
        hse_status = RCC->CR & RCC_CR_HSERDY;
        startup_cnt ++;
    } while(!hse_status && startup_cnt < HSE_STARTUP_TIMEOUT);

    if ((RCC->CR & RCC_CR_HSERDY) != RESET) {
        hse_status = (uint32_t)0x01;
    } else {
        hse_status = (uint32_t)0x00;
    }

    if (hse_status) {

        /* Enable CSS */
        RCC->CR |= RCC_CR_CSSON;

        /* Select regulator voltage output Scale 1 mode */
        RCC->APB1ENR |= RCC_APB1ENR_PWREN;
        PWR->CR |= PWR_CR_VOS;

        /* HCLK = SYSCLK / 1*/
        RCC->CFGR |= RCC_CFGR_HPRE_DIV1;

        /* PCLK2 = HCLK / 1*/
        RCC->CFGR |= RCC_CFGR_PPRE2_DIV1;

        /* PCLK1 = HCLK / 2*/
        RCC->CFGR |= RCC_CFGR_PPRE1_DIV2;

        /* Configure the main PLL */
        RCC->PLLCFGR = PLL_M | (PLL_N << 6) | (((PLL_P >> 1) - 1) << 16) | (RCC_PLLCFGR_PLLSRC_HSE) | (PLL_Q << 24) | (PLL_R << 28);

        /* Enable the main PLL */
        RCC->CR |= RCC_CR_PLLON;

        /* Wait till the main PLL is ready */
        while((RCC->CR & RCC_CR_PLLRDY) == 0) {
        }

        /* Configure Flash prefetch, Instruction cache, Data cache and wait state */
        FLASH->ACR = FLASH_ACR_PRFTEN | FLASH_ACR_ICEN | FLASH_ACR_DCEN | FLASH_ACR_LATENCY_3WS;

        /* Select the main PLL as system clock source */
        RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
        RCC->CFGR |= RCC_CFGR_SW_PLL;

        /* Wait till the main PLL is used as system clock source */
        while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS ) != RCC_CFGR_SWS_PLL) {
        }
    } else {
        /* If HSE fails to start-up, the application will have wrong clock
             configuration. User can add here some code to deal with this error */
        system_hse_failed();
    }

}

uint32_t system_sys_clk(void) {

    uint32_t sys_clk = 0;

    switch(RCC->CFGR & RCC_CFGR_SWS) {
    case RCC_CFGR_SWS_HSI:
        sys_clk = HSI_CLK_MHZ;
        break;
    case RCC_CFGR_SWS_HSE:
        sys_clk = HSE_CLK_MHZ;
        break;
    case RCC_CFGR_SWS_PLL:
        sys_clk = (((RCC->PLLCFGR & RCC_PLLCFGR_PLLSRC) == RCC_PLLCFGR_PLLSRC_HSE) ? HSE_CLK_MHZ : HSI_CLK_MHZ);
        sys_clk = ((uint64_t)sys_clk * PLL_N) / (PLL_M * PLL_P);
        break;
    default:        /* N/A */
        break;
    }

    return sys_clk;
}

uint32_t system_ahb_clk(void) {

    uint32_t ahb_clk = system_sys_clk();

    switch(RCC->CFGR & RCC_CFGR_HPRE) {
    case RCC_CFGR_HPRE_DIV1:
    default:
        ahb_clk /= 1;
        break;
    case RCC_CFGR_HPRE_DIV2:
        ahb_clk /= 2;
        break;
    case RCC_CFGR_HPRE_DIV4:
        ahb_clk /= 4;
        break;
    case RCC_CFGR_HPRE_DIV8:
        ahb_clk /= 8;
        break;
    case RCC_CFGR_HPRE_DIV16:
        ahb_clk /= 16;
        break;
    case RCC_CFGR_HPRE_DIV64:
        ahb_clk /= 64;
        break;
    case RCC_CFGR_HPRE_DIV128:
        ahb_clk /= 128;
        break;
    case RCC_CFGR_HPRE_DIV256:
        ahb_clk /= 256;
        break;
    case RCC_CFGR_HPRE_DIV512:
        ahb_clk /= 512;
        break;
    }

    return ahb_clk;
}

uint32_t system_apb1_clk(void) {

    uint32_t apb1_clk = system_ahb_clk();

    switch(RCC->CFGR & RCC_CFGR_PPRE1) {
    case RCC_CFGR_PPRE1_DIV1:
    default:
        apb1_clk /= 1;
        break;
    case RCC_CFGR_PPRE1_DIV2:
        apb1_clk /= 2;
        break;
    case RCC_CFGR_PPRE1_DIV4:
        apb1_clk /= 4;
        break;
    case RCC_CFGR_PPRE1_DIV8:
        apb1_clk /= 8;
        break;
    case RCC_CFGR_PPRE1_DIV16:
        apb1_clk /= 16;
        break;
    }

    return apb1_clk;
}

uint32_t system_apb2_clk(void) {

    uint32_t apb2_clk = system_ahb_clk();

    switch(RCC->CFGR & RCC_CFGR_PPRE2) {
    case RCC_CFGR_PPRE2_DIV1:
    default:
        apb2_clk /= 1;
        break;
    case RCC_CFGR_PPRE2_DIV2:
        apb2_clk /= 2;
        break;
    case RCC_CFGR_PPRE2_DIV4:
        apb2_clk /= 4;
        break;
    case RCC_CFGR_PPRE2_DIV8:
        apb2_clk /= 8;
        break;
    case RCC_CFGR_PPRE2_DIV16:
        apb2_clk /= 16;
        break;
    }

    return apb2_clk;
}


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
