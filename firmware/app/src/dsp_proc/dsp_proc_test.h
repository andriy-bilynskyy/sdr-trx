/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    DSP test processing header file
*/


#ifndef __DSP_PROC_TEST_H
#define __DSP_PROC_TEST_H


#include "app_data_types.h"


void dsp_proc_test_set(volatile app_handle_t * app_handle);
void dsp_proc_test_unset(volatile app_handle_t * app_handle);
void dsp_proc_test_routine(volatile app_handle_t * app_handle);


#endif
