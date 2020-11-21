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


#include "dsp_proc.h"
#include "codec.h"


void dsp_proc_copy_routine(app_handle_t * app_handle) {

    (void)app_handle;
    codec_sample_t * buf = codec_get_audio_buf();
    for(uint32_t i = 0; i < codec_buf_elements; i++) {
        uint16_t tmp = ((uint32_t)(buf[i].left) + buf[i].right) >> 1;
        buf[i].left  = tmp;
        buf[i].right = tmp;
    }
}
