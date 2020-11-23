/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Application RF unit HAL header file
*/


#ifndef __RF_UNIT_H
#define __RF_UNIT_H


#include <stdbool.h>
#include "app_data_types.h"
#include "dco.h"
#include "rf_amp.h"


typedef enum {
    RF_UNIT_NOT_INITED,
    RF_UNIT_READY,
    RF_UNIT_DCO_ERROR,
    RF_UNIT_FILTER_ERROR,
    RF_UNIT_RF_AMP_ERROR,
    RF_UNIT_CODEC_ERROR
} rf_unit_state_t;


rf_unit_state_t rf_unit_start(volatile app_handle_t * app_handle);
void            rf_unit_stop(volatile app_handle_t * app_handle);
rf_unit_state_t rf_unit_update(volatile app_handle_t * app_handle);
rf_unit_state_t rf_unit_update_rx_sensitivity(volatile app_handle_t * app_handle);


#endif
