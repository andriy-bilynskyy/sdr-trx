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
#include "codec.h"


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
    codec_volume_t      codec_spk_volume;
    codec_volume_t      codec_hp_volume;
    codec_volume_t      codec_line_sensivity;
    codec_volume_t      codec_mic_sensivity;
    bool                hwctl_ext_mic;
    uint32_t            dco_frequency;
    uint8_t             rf_amp_bias;
} app_settings_t;

/******************************************************************************
 * Application handler
 ******************************************************************************/
typedef struct {
    bool                system_ctive;
    uint32_t            running_tasks_cnt;
    app_settings_t *    settings;
} app_handle_t;


#endif
