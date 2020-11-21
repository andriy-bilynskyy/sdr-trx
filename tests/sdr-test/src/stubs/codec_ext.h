/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    codec stub extensions header file
*/


#ifndef __CODEC_STUB_EXT_H
#define __CODEC_STUB_EXT_H


#include "app_data_types.h"


void    codec_mk_signal(app_handle_t * app_handle, uint32_t f_signal);
float   codec_get_buf_time(app_handle_t * app_handle, uint16_t idx);


#endif
