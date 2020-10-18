/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Audio codec driver source file
    https://statics.cirrus.com/pubs/proDatasheet/WM8731_v4.9.pdf
*/


#include "codec.h"
#include "wm8731_ctl.h"
#include "hwctl.h"


bool codec_start(void) {

    hwctl_start();
    return wm8731_ctl_start();
}

void codec_stop(void) {

    wm8731_ctl_stop();
}

codec_volume_t codec_get_headphone_volume(void) {

    return wm8731_ctl_get_output_volume_r();
}

codec_volume_t codec_get_speaker_volume(void) {

    return wm8731_ctl_get_output_volume_l();
}

bool codec_set_headphone_volume(codec_volume_t volume) {

    return wm8731_ctl_set_output_volume_r(volume);
}

bool codec_set_speaker_volume(codec_volume_t volume) {

    return wm8731_ctl_set_output_volume_l(volume);
}

codec_volume_t codec_get_input_volume(void) {

    return wm8731_ctl_get_input_volume();
}

bool codec_set_input_volume(codec_volume_t volume) {

    return wm8731_ctl_set_input_volume(volume);
}

codec_volume_t codec_get_mic_volume(void) {

    return wm8731_ctl_get_mic_volume();
}

bool codec_set_mic_volume(codec_volume_t volume) {

    return wm8731_ctl_set_mic_volume(volume);
}

out_src_t codec_get_out_src() {

    return wm8731_ctl_get_out_src();
}

bool codec_set_out_src(out_src_t out_src) {

    return wm8731_ctl_set_out_src(out_src);
}

inp_src_t codec_get_inp_src() {

    return wm8731_ctl_get_inp_src();
}

bool codec_set_inp_src(inp_src_t inp_src) {

    return wm8731_ctl_set_inp_src(inp_src);
}
