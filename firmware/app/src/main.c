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
#include "FreeRTOS.h"
#include "task.h"
#include "tasks_app.h"
#include "app_data.h"
#include "debug.h"


int main(void) {

    DBG_OUT("main start");

    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4);

    xTaskCreate(task_system, TASK_SYSTEM_NAME, TASK_SYSTEM_STACK, (void *)&app_handle, TASK_SYSTEM_PRIO, NULL);
    vTaskStartScheduler();
    for(;;);

    return 0;
}
