/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    WM8731 control interface driver header file
    https://statics.cirrus.com/pubs/proDatasheet/WM8731_v4.9.pdf
*/

#ifndef __WM8731_CTL_H
#define __WM8731_CTL_H


#include "codec_types.h"


bool            wm8731_ctl_start(codec_sample_rate_t sr);
void            wm8731_ctl_stop(void);
codec_volume_t  wm8731_ctl_get_output_volume_r(void);
codec_volume_t  wm8731_ctl_get_output_volume_l(void);
bool            wm8731_ctl_set_output_volume_r(codec_volume_t volume);
bool            wm8731_ctl_set_output_volume_l(codec_volume_t volume);
codec_volume_t  wm8731_ctl_get_input_volume(void);
bool            wm8731_ctl_set_input_volume(codec_volume_t volume);
codec_volume_t  wm8731_ctl_get_mic_volume(void);
bool            wm8731_ctl_set_mic_volume(codec_volume_t volume);
codec_out_src_t wm8731_ctl_get_out_src();
bool            wm8731_ctl_set_out_src(codec_out_src_t out_src);
codec_inp_src_t wm8731_ctl_get_inp_src();
bool            wm8731_ctl_set_inp_src(codec_inp_src_t inp_src);


#endif
