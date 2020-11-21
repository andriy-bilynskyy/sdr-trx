/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    codec stub header file
*/


#ifndef __CODEC_STUB_H
#define __CODEC_STUB_H


#include "codec_types.h"


extern const uint16_t codec_buf_elements;


codec_sample_t * codec_get_audio_buf(void);


#endif
