/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Widget audio source file
*/


#include "widgets.h"
#include "ui_engine.h"
#include "ui_notify.h"
#include "codec.h"
#include "hwctl.h"
#include "trxctl.h"
#include <stdbool.h>
#include <string.h>


/* active widgets tags definitions */
#define WIDGET_AUDIO_TAG_EXIT         1
#define WIDGET_AUDIO_TAG_SPKON        2
#define WIDGET_AUDIO_TAG_SPKVOL       3
#define WIDGET_AUDIO_TAG_HPON         4
#define WIDGET_AUDIO_TAG_HPVOL        5
#define WIDGET_AUDIO_TAG_LINEON       6
#define WIDGET_AUDIO_TAG_LINEVOL      7
#define WIDGET_AUDIO_TAG_MICON        8
#define WIDGET_AUDIO_TAG_MICVOL       9
#define WIDGET_AUDIO_TAG_EXTMIC       10
#define WIDGET_AUDIO_TAG_SRC          11


static void widget_audio_codec_error(void);
static void widget_audio_data_ready(void);


void * widget_audio(void * parent) {

    bool init = true;
    bool touched = false;

    trxctl_transmit(true);

    bool ext_mic = false;
    hwctl_ext_mic(ext_mic);

    if(codec_start()) {
        codec_set_callback(widget_audio_data_ready);
    } else {
        widget_audio_codec_error();
    }
    for(;;) {

        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_AUDIO_TAG_EXIT,    5,    5,  20, 20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                          30,   0,          UI_ENGINE_FONT29, "Audio", false);
        /* speaker volume */
        codec_volume_t speaker = codec_get_speaker_volume();
        ui_engine_text(  0,                        20,   35,         UI_ENGINE_FONT27, "Speaker:", false);
        ui_engine_toggle(WIDGET_AUDIO_TAG_SPKON,   20,   65, 50,     UI_ENGINE_FONT27, speaker.mute, "On", "Off");
        ui_engine_slider(WIDGET_AUDIO_TAG_SPKVOL,  110,  65, ui_engine_xsize - 140, 15, ((uint32_t)(speaker.volume) * 0xFFFF) / CODEC_OUTPUT_MAX_VOLUME);
        /* headphone volume */
        codec_volume_t headphone = codec_get_headphone_volume();
        ui_engine_text(  0,                        20,   90,          UI_ENGINE_FONT27, "Headphone:", false);
        ui_engine_toggle(WIDGET_AUDIO_TAG_HPON,    20,   120, 50,     UI_ENGINE_FONT27, headphone.mute, "On", "Off");
        ui_engine_slider(WIDGET_AUDIO_TAG_HPVOL,   110,  120, ui_engine_xsize - 140, 15, ((uint32_t)(headphone.volume) * 0xFFFF) / CODEC_OUTPUT_MAX_VOLUME);
        /* line input sensitivity */
        codec_volume_t line = codec_get_input_volume();
        ui_engine_text(  0,                        20,   145,         UI_ENGINE_FONT27, "Line input:", false);
        ui_engine_toggle(WIDGET_AUDIO_TAG_LINEON,  20,   175, 50,     UI_ENGINE_FONT27, line.mute, "On", "Off");
        ui_engine_slider(WIDGET_AUDIO_TAG_LINEVOL, 110,  175, ui_engine_xsize - 140, 15, ((uint32_t)(line.volume) * 0xFFFF) / CODEC_INPUT_MAX_VOLUME);
        /* microphone sensitivity */
        codec_volume_t mic = codec_get_mic_volume();
        ui_engine_text(  0,                        20,   200,         UI_ENGINE_FONT27, "Microphone:", false);
        ui_engine_toggle(WIDGET_AUDIO_TAG_MICON,   20,   230, 50,     UI_ENGINE_FONT27, mic.mute, "On", "Off");
        ui_engine_toggle(WIDGET_AUDIO_TAG_MICVOL,  100,  230, 50,     UI_ENGINE_FONT27, mic.volume, "Norm", "Boost");
        ui_engine_toggle(WIDGET_AUDIO_TAG_EXTMIC,  180,  230, 50,     UI_ENGINE_FONT27, ext_mic, "Int.", "Ext.");
        /* source */
        codec_out_src_t src = codec_get_out_src();
        static const char * sources[] = {"None", "Mic.", "Line", "DAC"};
        ui_engine_text(  0,                        280,  225,         UI_ENGINE_FONT27, "Source:", false);
        ui_engine_button(WIDGET_AUDIO_TAG_SRC,     350,  220, ui_engine_xsize - 380, 30, UI_ENGINE_FONT27, sources[src]);

        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(init) {
            if(!touch.tag) {
                init = false;
            }
            continue;
        }

        if(!touch.tag) {
            touched = false;
        } else {
            if(!touched) {
                if(touch.tag == WIDGET_AUDIO_TAG_EXIT) {
                    break;
                }
                if(touch.tag == WIDGET_AUDIO_TAG_SPKON) {
                    speaker.mute = !speaker.mute;
                    if(!codec_set_speaker_volume(speaker)) {
                        widget_audio_codec_error();
                    }
                }
                if(touch.tag == WIDGET_AUDIO_TAG_HPON) {
                    headphone.mute = !headphone.mute;
                    if(!codec_set_headphone_volume(headphone)) {
                        widget_audio_codec_error();
                    }
                }
                if(touch.tag == WIDGET_AUDIO_TAG_LINEON) {
                    line.mute = !line.mute;
                    if(!codec_set_input_volume(line)) {
                        widget_audio_codec_error();
                    }
                }
                if(touch.tag == WIDGET_AUDIO_TAG_MICON) {
                    mic.mute = !mic.mute;
                    if(!codec_set_mic_volume(mic)) {
                        widget_audio_codec_error();
                    }
                }
                if(touch.tag == WIDGET_AUDIO_TAG_MICVOL) {
                    mic.volume = mic.volume ? 0 : CODEC_MIC_MAX_VOLUME;
                    if(!codec_set_mic_volume(mic)) {
                        widget_audio_codec_error();
                    }
                }
                if(touch.tag == WIDGET_AUDIO_TAG_EXTMIC) {
                    ext_mic = !ext_mic;
                    hwctl_ext_mic(ext_mic);
                }
                if(touch.tag == WIDGET_AUDIO_TAG_SRC) {
                    src = ((src == OUT_DAC) ? OUT_MUTE : (codec_out_src_t)(src + 1));
                    if(!codec_set_out_src(src)) {
                        widget_audio_codec_error();
                    }
                }
            }
            if(touch.tag == WIDGET_AUDIO_TAG_SPKVOL) {
                speaker.volume = ((uint32_t)touch.value  * CODEC_OUTPUT_MAX_VOLUME) / 0xFFFF;
                if(!codec_set_speaker_volume(speaker)) {
                    widget_audio_codec_error();
                }
            }
            if(touch.tag == WIDGET_AUDIO_TAG_HPVOL) {
                headphone.volume = ((uint32_t)touch.value  * CODEC_OUTPUT_MAX_VOLUME) / 0xFFFF;
                if(!codec_set_headphone_volume(headphone)) {
                    widget_audio_codec_error();
                }
            }
            if(touch.tag == WIDGET_AUDIO_TAG_LINEVOL) {
                line.volume = ((uint32_t)touch.value  * CODEC_INPUT_MAX_VOLUME) / 0xFFFF;
                if(!codec_set_input_volume(line)) {
                    widget_audio_codec_error();
                }
            }
            touched = true;
        }
    }
    codec_stop();

    return parent;
}


static void widget_audio_codec_error(void) {

    const char * argv[] = {"Codec error"};
    ui_notify(1, argv, "Ok");
}

/******************************************************************************
 * Echo from line input for test
 ******************************************************************************/
static void widget_audio_data_ready(void) {

    memcpy(codec_get_output_buf(), codec_get_input_buf(), codec_buf_elements * sizeof(uint16_t));
}
