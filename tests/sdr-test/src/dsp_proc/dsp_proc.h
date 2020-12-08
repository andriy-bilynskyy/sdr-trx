/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    DSP header file
*/


#ifndef __DSP_PROC_H
#define __DSP_PROC_H


#include <stddef.h>
#include "dsp_proc_sdr.h"
#include "dsp_proc_test.h"


typedef void (*dsp_proc_routine_t)  (volatile app_handle_t * app_handle);
typedef void (*dsp_proc_set_t)      (volatile app_handle_t * app_handle);
typedef void (*dsp_proc_unset_t)    (volatile app_handle_t * app_handle);


void dsp_proc_set(volatile app_handle_t * app_handle, dsp_proc_routine_t routine, dsp_proc_set_t set, dsp_proc_unset_t unset);
void dsp_proc_unset(volatile app_handle_t * app_handle);
void dsp_proc_exec(volatile app_handle_t * app_handle);


#endif
