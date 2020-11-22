/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Application data types header file
*/

#ifndef __APP_DATA_TYPES_H
#define __APP_DATA_TYPES_H


#include <stdint.h>
#include <stdbool.h>
#include "arm_math.h"
#include "codec.h"


/******************************************************************************
 * PTT button mode
 ******************************************************************************/
typedef enum {
    APP_SETTINGS_PTT_SW,
    APP_SETTINGS_PTT_HW
} ptt_button_t;

/******************************************************************************
 * SDR modulation types
 ******************************************************************************/
typedef enum {
    APP_SETTINGS_MODULATION_LSB,
    APP_SETTINGS_MODULATION_USB,
    APP_SETTINGS_MODULATION_AM,
    APP_SETTINGS_MODULATION_NFM
} sdr_modulation_t;

/******************************************************************************
 * SDR BPF type
 ******************************************************************************/
typedef struct {
    uint16_t    low_hz;
    uint16_t    high_hz;
} sdr_bpf_t;

/******************************************************************************
 * SDR spectrum type
 ******************************************************************************/
typedef struct {
    bool        valid;
    uint16_t    iterarions;
    uint16_t    elements;
    float32_t * data;
} sdr_spectrum_t;

/******************************************************************************
 * Application settings data
 * !!! if you make any changes inside of this structure
 * !!! also increment app_settings.header.version
 * !!! see app_data.c
 * !!! otherwise NWRAM data should be erased before SW execution.
 * !!! modification this structure without
 * !!! incrementing app_settings.header.version
 * !!! or
 * !!! erasing NVRAM data
 * !!! causes unexpected SW behavior
 ******************************************************************************/
typedef struct {
    uint8_t             ui_engine_brightness;
    codec_sample_rate_t codec_samplerate;
    codec_volume_t      codec_spk_volume;
    codec_volume_t      codec_hp_volume;
    codec_volume_t      codec_tx_line_sensivity;
    codec_volume_t      codec_mic_sensivity;
    bool                hwctl_ext_mic;
    uint32_t            dco_frequency;
    uint8_t             rf_amp_bias;
    codec_inp_src_t     codec_tx_inp_src;
    ptt_button_t        system_ptt_button;
    sdr_modulation_t    sdr_modulation;
    sdr_bpf_t           sdr_bpf_lsb;
    sdr_bpf_t           sdr_bpf_usb;
    sdr_bpf_t           sdr_bpf_am;
    sdr_bpf_t           sdr_bpf_nfm;
} app_settings_t;

/******************************************************************************
 * Current application non-persist controls and states
 ******************************************************************************/
typedef struct {
    bool                transmission;
    codec_volume_t      codec_rx_line_sensivity;
    sdr_spectrum_t      spectrum;
} app_ctl_state_t;

/******************************************************************************
 * Application handler
 ******************************************************************************/
typedef struct {
    bool                system_ctive;
    uint32_t            running_tasks_cnt;
    app_settings_t *    settings;
    app_ctl_state_t *   ctl_state;
} app_handle_t;


#endif
