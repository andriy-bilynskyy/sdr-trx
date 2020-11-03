/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Task audio digital processing source file
*/


#include <tasks_app.h>
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "atomic.h"
#include "debug.h"
#include "codec.h"
#include <string.h>


#define TASK_DSP_PERIOD_MS       600    /* Timeout based on fulfill half audio buffer at lowest samplerate */


dsp_proc_t dsp_proc = NULL;
static SemaphoreHandle_t task_audio_sync_sem = NULL;


static void task_dsp_data_ready(void);


void task_dsp(void * param) {

    tasks_app_handle_t * app_hnd = (tasks_app_handle_t *)param;
    (void)Atomic_Increment_u32(&app_hnd->running_tasks_cnt);
    DBG_OUT("audio task started");

    task_audio_sync_sem = xSemaphoreCreateBinary();
    codec_set_callback(task_dsp_data_ready);

    for(; app_hnd->system_ctive;) {

        if(xSemaphoreTake(task_audio_sync_sem, TASK_DSP_PERIOD_MS) == pdTRUE) {
            if(dsp_proc) {
                dsp_proc();
            } else {
                memset(codec_get_output_buf(), 0, codec_buf_elements * sizeof(uint16_t));
            }
        }
    }

    codec_set_callback(NULL);
    vSemaphoreDelete(task_audio_sync_sem);
    task_audio_sync_sem = NULL;

    DBG_OUT("audio task stopped");
    (void)Atomic_Decrement_u32(&app_hnd->running_tasks_cnt);

    vTaskDelete(NULL);
}


static void task_dsp_data_ready(void) {

    BaseType_t hprio;
    (void)xSemaphoreGiveFromISR(task_audio_sync_sem, &hprio);
    portYIELD_FROM_ISR(hprio);
}
