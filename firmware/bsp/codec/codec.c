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
#include "codec_conf.h"
#include "wm8731_ctl.h"
#include "wm8731_i2s.h"
#include "hwctl.h"


const uint16_t codec_buf_elements = CODEC_BUF_SIZE;


bool codec_start(codec_sample_rate_t sr) {

    hwctl_start();
    bool result = wm8731_ctl_start(sr);

    if(result) {
        wm8731_i2s_start(sr);
    }

    return result;
}

void codec_stop(void) {

    wm8731_i2s_stop();
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

codec_out_src_t codec_get_out_src() {

    return wm8731_ctl_get_out_src();
}

bool codec_set_out_src(codec_out_src_t out_src) {

    return wm8731_ctl_set_out_src(out_src);
}

codec_inp_src_t codec_get_inp_src() {

    return wm8731_ctl_get_inp_src();
}

bool codec_set_inp_src(codec_inp_src_t inp_src) {

    return wm8731_ctl_set_inp_src(inp_src);
}

void codec_set_callback(codec_data_ready_cb_t adc_data_ready) {

    wm8731_i2s_set_callback(adc_data_ready);
}

const int16_t * codec_get_input_buf() {

    return wm8731_i2s_get_input_buf();
}

int16_t * codec_get_output_buf() {

    return wm8731_i2s_get_output_buf();
}
