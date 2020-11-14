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


#include "dsp_proc_copy.h"
#include "dsp_proc_sdr.h"


typedef void (*dsp_proc_t)(app_handle_t * app_handle);


extern dsp_proc_t dsp_proc;


#endif
