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


#if(CODEC_BUF_SIZE & (CODEC_BUF_SIZE -1) != 0)
#error CODEC_BUF_SIZE should be power of 2.
#endif


const uint16_t codec_buf_elements = CODEC_BUF_SIZE;


static volatile codec_sample_t   audio_buffer[CODEC_BUF_SIZE] = {0};


volatile codec_sample_t * const codec_get_audio_buf(void) {

    return audio_buffer;
}
