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
#include "codec.h"
#include "hwctl.h"
#include "trxctl.h"
#include "tasks_app.h"
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


void widget_audio(app_handle_t * app_handle) {

    bool init = true;
    bool touched = false;

    trxctl_transmit(true);

    hwctl_ext_mic(app_handle->settings->hwctl_ext_mic);

    if(codec_start(app_handle->settings->codec_samplerate, false)) {
        dsp_proc = dsp_proc_copy;
        (void)codec_set_speaker_volume(app_handle->settings->codec_spk_volume);
        (void)codec_set_headphone_volume(app_handle->settings->codec_hp_volume);
        (void)codec_set_line_sensivity(app_handle->settings->codec_tx_line_sensivity);
        (void)codec_set_mic_sensivity(app_handle->settings->codec_mic_sensivity);
    } else {
        widget_error_codec(app_handle);
    }
    for(; app_handle->system_ctive;) {

        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_set_fgcolor(31, 31, 255);
        /* header */
        ui_engine_button(WIDGET_AUDIO_TAG_EXIT,    5,    5,  20, 20, UI_ENGINE_FONT26, "-");
        ui_engine_text(0,                          30,   0,          UI_ENGINE_FONT29, "Audio", false);
        /* speaker volume */
        app_handle->settings->codec_spk_volume = codec_get_speaker_volume();
        ui_engine_text(  0,                        20,   35,         UI_ENGINE_FONT27, "Speaker:", false);
        ui_engine_toggle(WIDGET_AUDIO_TAG_SPKON,   20,   65, 50,     UI_ENGINE_FONT27, app_handle->settings->codec_spk_volume.mute, "On", "Off");
        ui_engine_slider(WIDGET_AUDIO_TAG_SPKVOL,  110,  65, ui_engine_xsize - 140, 15, ((uint32_t)(app_handle->settings->codec_spk_volume.volume) * 0xFFFF) / CODEC_OUTPUT_MAX_VOLUME);
        /* headphone volume */
        app_handle->settings->codec_hp_volume = codec_get_headphone_volume();
        ui_engine_text(  0,                        20,   90,          UI_ENGINE_FONT27, "Headphone:", false);
        ui_engine_toggle(WIDGET_AUDIO_TAG_HPON,    20,   120, 50,     UI_ENGINE_FONT27, app_handle->settings->codec_hp_volume.mute, "On", "Off");
        ui_engine_slider(WIDGET_AUDIO_TAG_HPVOL,   110,  120, ui_engine_xsize - 140, 15, ((uint32_t)(app_handle->settings->codec_hp_volume.volume) * 0xFFFF) / CODEC_OUTPUT_MAX_VOLUME);
        /* line input sensitivity */
        app_handle->settings->codec_tx_line_sensivity = codec_get_line_sensivity();
        ui_engine_text(  0,                        20,   145,         UI_ENGINE_FONT27, "Line input:", false);
        ui_engine_toggle(WIDGET_AUDIO_TAG_LINEON,  20,   175, 50,     UI_ENGINE_FONT27, app_handle->settings->codec_tx_line_sensivity.mute, "On", "Off");
        ui_engine_slider(WIDGET_AUDIO_TAG_LINEVOL, 110,  175, ui_engine_xsize - 140, 15, ((uint32_t)(app_handle->settings->codec_tx_line_sensivity.volume) * 0xFFFF) / CODEC_INPUT_MAX_VOLUME);
        /* microphone sensitivity */
        app_handle->settings->codec_mic_sensivity = codec_get_mic_sensivity();
        ui_engine_text(  0,                        20,   200,         UI_ENGINE_FONT27, "Microphone:", false);
        ui_engine_toggle(WIDGET_AUDIO_TAG_MICON,   20,   230, 50,     UI_ENGINE_FONT27, app_handle->settings->codec_mic_sensivity.mute, "On", "Off");
        ui_engine_toggle(WIDGET_AUDIO_TAG_MICVOL,  100,  230, 50,     UI_ENGINE_FONT27, app_handle->settings->codec_mic_sensivity.volume, "Norm", "Boost");
        ui_engine_toggle(WIDGET_AUDIO_TAG_EXTMIC,  180,  230, 50,     UI_ENGINE_FONT27, app_handle->settings->hwctl_ext_mic, "Int.", "Ext.");
        /* source */
        codec_out_src_t src = codec_get_out_src();
        static const char * sources[] = {"None", "Mic.", "Line", "DAC"};
        ui_engine_text(  0,                        280,  225,         UI_ENGINE_FONT27, "Source:", false);
        ui_engine_button(WIDGET_AUDIO_TAG_SRC,     350,  220, ui_engine_xsize - 380, 30, UI_ENGINE_FONT27, sources[src]);

        ui_engine_draw_end();

        uint32_t event_flg = ui_engine_event_wait(WIDGET_EVENT_MASK);
        if(widget_event(app_handle, event_flg)) {
            init = true;
        }

        ui_engine_touch_t touch = ui_engine_get_touch();

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
                    app_handle->settings->codec_spk_volume.mute = !app_handle->settings->codec_spk_volume.mute;
                    if(!codec_set_speaker_volume(app_handle->settings->codec_spk_volume)) {
                        widget_error_codec(app_handle);
                        init = true;
                    }
                }
                if(touch.tag == WIDGET_AUDIO_TAG_HPON) {
                    app_handle->settings->codec_hp_volume.mute = !app_handle->settings->codec_hp_volume.mute;
                    if(!codec_set_headphone_volume(app_handle->settings->codec_hp_volume)) {
                        widget_error_codec(app_handle);
                        init = true;
                    }
                }
                if(touch.tag == WIDGET_AUDIO_TAG_LINEON) {
                    app_handle->settings->codec_tx_line_sensivity.mute = !app_handle->settings->codec_tx_line_sensivity.mute;
                    if(!codec_set_line_sensivity(app_handle->settings->codec_tx_line_sensivity)) {
                        widget_error_codec(app_handle);
                        init = true;
                    }
                }
                if(touch.tag == WIDGET_AUDIO_TAG_MICON) {
                    app_handle->settings->codec_mic_sensivity.mute = !app_handle->settings->codec_mic_sensivity.mute;
                    if(!codec_set_mic_sensivity(app_handle->settings->codec_mic_sensivity)) {
                        widget_error_codec(app_handle);
                        init = true;
                    }
                }
                if(touch.tag == WIDGET_AUDIO_TAG_MICVOL) {
                    app_handle->settings->codec_mic_sensivity.volume = app_handle->settings->codec_mic_sensivity.volume ? 0 : CODEC_MIC_MAX_VOLUME;
                    if(!codec_set_mic_sensivity(app_handle->settings->codec_mic_sensivity)) {
                        widget_error_codec(app_handle);
                        init = true;
                    }
                }
                if(touch.tag == WIDGET_AUDIO_TAG_EXTMIC) {
                    app_handle->settings->hwctl_ext_mic = !app_handle->settings->hwctl_ext_mic;
                    hwctl_ext_mic(app_handle->settings->hwctl_ext_mic);
                }
                if(touch.tag == WIDGET_AUDIO_TAG_SRC) {
                    src = ((src == CODEC_OUT_DAC) ? CODEC_OUT_MUTE : (codec_out_src_t)(src + 1));
                    if(!codec_set_out_src(src)) {
                        widget_error_codec(app_handle);
                        init = true;
                    }
                }
            }
            if(touch.tag == WIDGET_AUDIO_TAG_SPKVOL) {
                app_handle->settings->codec_spk_volume.volume = ((uint32_t)touch.value  * CODEC_OUTPUT_MAX_VOLUME) / 0xFFFF;
                if(!codec_set_speaker_volume(app_handle->settings->codec_spk_volume)) {
                    widget_error_codec(app_handle);
                    init = true;
                }
            }
            if(touch.tag == WIDGET_AUDIO_TAG_HPVOL) {
                app_handle->settings->codec_hp_volume.volume = ((uint32_t)touch.value  * CODEC_OUTPUT_MAX_VOLUME) / 0xFFFF;
                if(!codec_set_headphone_volume(app_handle->settings->codec_hp_volume)) {
                    widget_error_codec(app_handle);
                    init = true;
                }
            }
            if(touch.tag == WIDGET_AUDIO_TAG_LINEVOL) {
                app_handle->settings->codec_tx_line_sensivity.volume = ((uint32_t)touch.value  * CODEC_INPUT_MAX_VOLUME) / 0xFFFF;
                if(!codec_set_line_sensivity(app_handle->settings->codec_tx_line_sensivity)) {
                    widget_error_codec(app_handle);
                    init = true;
                }
            }
            touched = true;
        }
    }
    codec_stop();
    hwctl_ext_mic(false);
    trxctl_transmit(false);
    dsp_proc = NULL;
}
