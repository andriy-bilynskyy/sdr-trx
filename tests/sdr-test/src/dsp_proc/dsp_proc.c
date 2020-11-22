/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    DSP source file
*/


#include "dsp_proc.h"
#include "codec.h"
#include <string.h>


static volatile dsp_proc_routine_t dsp_proc_routine = NULL;
static volatile dsp_proc_unset_t   dsp_proc_release = NULL;


void dsp_proc_set(volatile app_handle_t * app_handle, dsp_proc_routine_t routine, dsp_proc_set_t set, dsp_proc_unset_t unset) {

    dsp_proc_unset(app_handle);
    if(set) {
        set(app_handle);
    }
    dsp_proc_release = unset;
    dsp_proc_routine = routine;
}

void dsp_proc_unset(volatile app_handle_t * app_handle) {

    dsp_proc_routine = NULL;
    if(dsp_proc_release) {
        dsp_proc_release(app_handle);
        dsp_proc_release = NULL;
    }
}

void dsp_proc_exec(volatile app_handle_t * app_handle) {

    if(dsp_proc_routine) {
        dsp_proc_routine(app_handle);
    } else {
        memset((void *)codec_get_audio_buf(), 0, codec_buf_elements * sizeof(codec_sample_t));
    }
}
