/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    codec stub source file
*/


#include "codec.h"
#include "codec_conf.h"


const uint16_t codec_buf_elements = CODEC_BUF_SIZE;


static codec_sample_t   audio_buffer[CODEC_BUF_SIZE] = {0};


codec_sample_t * codec_get_audio_buf(void) {

    return audio_buffer;
}
