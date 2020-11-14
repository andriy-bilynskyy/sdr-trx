/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    DSP SDR process source file
*/


#include "dsp_proc_sdr.h"
#include "codec.h"
#include <string.h>


void dsp_proc_sdr(app_handle_t * app_handle) {

    (void)app_handle;
    // FFT and inverse FFT
    //memcpy(codec_get_output_buf(), codec_get_input_buf(), codec_buf_elements * sizeof(uint16_t));
}
