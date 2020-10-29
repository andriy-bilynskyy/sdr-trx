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


extern const uint16_t codec_buf_elements;


bool                codec_start(void);
void                codec_stop(void);
codec_volume_t      codec_get_headphone_volume(void);
codec_volume_t      codec_get_speaker_volume(void);
bool                codec_set_headphone_volume(codec_volume_t volume);
bool                codec_set_speaker_volume(codec_volume_t volume);
codec_volume_t      codec_get_input_volume(void);
bool                codec_set_input_volume(codec_volume_t volume);
codec_volume_t      codec_get_mic_volume(void);
bool                codec_set_mic_volume(codec_volume_t volume);
codec_out_src_t     codec_get_out_src();
bool                codec_set_out_src(codec_out_src_t out_src);
codec_inp_src_t     codec_get_inp_src();
bool                codec_set_inp_src(codec_inp_src_t inp_src);
/******************************************************************************
 * Callback is executed in interrupt context.
 * So try to avoid use complicated calculations inside.
 * In case of using RTOS just post here sync object and do all calculations
 * in thread unblocked by this object.
 ******************************************************************************/
void                codec_set_callback(codec_data_ready_cb_t adc_data_ready);
const uint16_t *    codec_get_input_buf();
uint16_t *          codec_get_output_buf();


#endif
