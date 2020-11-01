/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Miscellaneous BSP FreeRTOS extensions
*/


#include "FreeRTOS.h"
#include "task.h"


void misc_hal_sleep_ms(uint32_t ms) {

    if(xTaskGetSchedulerState() != taskSCHEDULER_NOT_STARTED) {
        vTaskDelay(ms);
    } else {
        RCC_ClocksTypeDef clk;
        RCC_GetClocksFreq(&clk);
        const uint32_t delay_ms = ((uint64_t)clk.HCLK_Frequency * 126) / 1000000;
        while(ms--) {
            volatile uint32_t tmp = delay_ms;
            while(tmp--) {
                __asm("nop");
            }
        }
    }
}
