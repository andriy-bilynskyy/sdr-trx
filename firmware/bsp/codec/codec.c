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


static volatile bool codec_started  = false;


bool codec_start(codec_sample_rate_t sr, bool reset_cb) {

    if(!codec_started) {
        hwctl_start();

        if(wm8731_ctl_start(sr)) {
            wm8731_i2s_start(sr, reset_cb);
            codec_started = true;
        } else {
            wm8731_ctl_stop();
        }
    }
    return codec_started;
}

void codec_stop(void) {

    if(codec_started) {
        codec_started = false;
        wm8731_i2s_stop();
        wm8731_ctl_stop();
    }
}

codec_volume_t codec_get_headphone_volume(void) {

    return wm8731_ctl_get_output_volume_r();
}

codec_volume_t codec_get_speaker_volume(void) {

    return wm8731_ctl_get_output_volume_l();
}

bool codec_set_headphone_volume(codec_volume_t volume) {

    return codec_started ? wm8731_ctl_set_output_volume_r(volume) : false;
}

bool codec_set_speaker_volume(codec_volume_t volume) {

    return codec_started ? wm8731_ctl_set_output_volume_l(volume) : false;
}

codec_volume_t codec_get_line_sensivity(void) {

    return wm8731_ctl_get_line_sensivity();
}

bool codec_set_line_sensivity(codec_volume_t volume) {

    return codec_started ? wm8731_ctl_set_line_sensivity(volume) : false;
}

codec_volume_t codec_get_mic_sensivity(void) {

    return wm8731_ctl_get_mic_sensivity();
}

bool codec_set_mic_sensivity(codec_volume_t volume) {

    return codec_started ? wm8731_ctl_set_mic_sensivity(volume) : false;
}

codec_out_src_t codec_get_out_src(void) {

    return wm8731_ctl_get_out_src();
}

bool codec_set_out_src(codec_out_src_t out_src) {

    return codec_started ? wm8731_ctl_set_out_src(out_src) : false;
}

codec_inp_src_t codec_get_inp_src(void) {

    return wm8731_ctl_get_inp_src();
}

bool codec_set_inp_src(codec_inp_src_t inp_src) {

    return codec_started ? wm8731_ctl_set_inp_src(inp_src) : false;
}

void codec_set_callback(codec_data_ready_cb_t adc_data_ready) {

    wm8731_i2s_set_callback(adc_data_ready);
}

const int16_t * codec_get_input_buf(void) {

    return wm8731_i2s_get_input_buf();
}

int16_t * codec_get_output_buf(void) {

    return wm8731_i2s_get_output_buf();
}
