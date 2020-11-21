/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    DSP SDR processing header file
*/


#ifndef __DSP_PROC_SDR_H
#define __DSP_PROC_SDR_H


#include "app_data_types.h"


void dsp_proc_sdr_set(app_handle_t * app_handle);
void dsp_proc_sdr_unset(app_handle_t * app_handle);
void dsp_proc_sdr_routine(app_handle_t * app_handle);


#endif
