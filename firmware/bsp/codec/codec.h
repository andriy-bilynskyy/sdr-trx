/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Audio codec driver header file
    https://statics.cirrus.com/pubs/proDatasheet/WM8731_v4.9.pdf
*/

#ifndef __CODEC_H
#define __CODEC_H


#include "codec_types.h"


bool            codec_start(void);
void            codec_stop(void);
codec_volume_t  codec_get_headphone_volume(void);
codec_volume_t  codec_get_speaker_volume(void);
bool            codec_set_headphone_volume(codec_volume_t volume);
bool            codec_set_speaker_volume(codec_volume_t volume);
codec_volume_t  codec_get_input_volume(void);
bool            codec_set_input_volume(codec_volume_t volume);
codec_volume_t  codec_get_mic_volume(void);
bool            codec_set_mic_volume(codec_volume_t volume);
out_src_t       codec_get_out_src();
bool            codec_set_out_src(out_src_t out_src);
inp_src_t       codec_get_inp_src();
bool            codec_set_inp_src(inp_src_t inp_src);


#endif
