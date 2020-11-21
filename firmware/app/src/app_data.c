/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Application data source file
*/


#include "app_data.h"
#include "rf_amp.h"
#include "mem24.h"
#include "debug.h"
#include <string.h>


#define APP_SETTINGS_NVRAM_OFFSET       0


static struct {

    const struct app_settings_header_t {
        uint32_t            marker;
        uint32_t            version;
    }                   header;

    app_settings_t      settings;

} app_settings = {

    .header   = {
        .marker                 = 0xAD0CC0DE,
        .version                = 3                     /* !!! <- Increment on each app_settings_t modification */
    },
    /**************************************************************************
     * Default application settings
     **************************************************************************/
    .settings = {
        .ui_engine_brightness       = 100,
        .codec_samplerate           = CODEC_SR_96K,
        .codec_spk_volume           = {.mute = false, .volume = 0x49},
        .codec_hp_volume            = {.mute = false, .volume = 0x49},
        .codec_tx_line_sensivity    = {.mute = false, .volume = 0x17},
        .codec_mic_sensivity        = {.mute = false, .volume = 0x01},
        .hwctl_ext_mic              = false,
        .dco_frequency              = 10000000,
        .rf_amp_bias                = RF_AMP_VAL(3.3f),
        .codec_tx_inp_src           = CODEC_INP_MIC,
        .system_ptt_button          = APP_SETTINGS_PTT_SW,
        .sdr_modulation             = APP_SETTINGS_MODULATION_LSB,
        .sdr_bpf_lsb                = {.low_hz = 100, .high_hz = 3500},
        .sdr_bpf_usb                = {.low_hz = 100, .high_hz = 3500},
        .sdr_bpf_am                 = {.low_hz = 100, .high_hz = 3500},
        .sdr_bpf_nfm                = {.low_hz = 100, .high_hz = 3500}
    }

};

static app_ctl_state_t app_ctl_state = {
    .transmission                   = false,                           /* PTT pressed */
    .codec_rx_line_sensivity        = {.mute = false, .volume = 0x17}  /* adjustment during reception DSP process */
};


volatile app_handle_t app_handle = {
    .system_ctive = true,
    .running_tasks_cnt = 0,
    .settings = &app_settings.settings,
    .ctl_state = &app_ctl_state
};


bool app_settings_load(void) {

    bool result = false;
    struct app_settings_header_t nvram_header;
    if(mem24_read(APP_SETTINGS_NVRAM_OFFSET  + ((uint32_t)&app_settings.header - (uint32_t)&app_settings), &nvram_header, sizeof(nvram_header)) == sizeof(nvram_header)) {
        result = true;
        if(!memcmp(&nvram_header, &app_settings.header, sizeof(struct app_settings_header_t))) {
            (void)mem24_read(APP_SETTINGS_NVRAM_OFFSET  + ((uint32_t)&app_settings.settings - (uint32_t)&app_settings), &app_settings.settings, sizeof(app_settings.settings));
        } else {
            DBG_OUT("using default application settings");
        }
    }
    return result;
}

bool app_setting_save(void) {

    return (mem24_write(APP_SETTINGS_NVRAM_OFFSET, &app_settings, sizeof(app_settings)) == sizeof(app_settings));
}
