/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    DSP copy source file
*/


#include "dsp_proc_copy.h"
#include "codec.h"
#include <string.h>


void dsp_proc_copy(void) {

    memcpy(codec_get_output_buf(), codec_get_input_buf(), codec_buf_elements * sizeof(uint16_t));
}
