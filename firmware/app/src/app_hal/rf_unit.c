/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Application RF unit HAL source file
*/


#include "rf_unit.h"
#include "hwctl.h"
#include "dco.h"
#include "rf_amp.h"
#include "codec.h"
#include "trxctl.h"


static struct {
    rf_unit_state_t         state;
    uint32_t                frequency;
    uint8_t                 bias;
    bool                    transmission;
    codec_sample_rate_t     samplerate;
    codec_volume_t          spk_volume;
    codec_volume_t          hp_volume;
    codec_volume_t          tx_line_sensivity;
    codec_inp_src_t         tx_inp_src;
    codec_volume_t          codec_rx_line_sensivity;
    codec_volume_t          mic_sensivity;
    bool                    ext_mic;

} rf_unit = {
    .state = RF_UNIT_NOT_INITED
};

static bool rf_unit_filters_adjust(uint32_t frequency);


rf_unit_state_t rf_unit_start(app_handle_t * app_handle) {

    if(rf_unit.state != RF_UNIT_READY) {
        if(rf_unit.state != RF_UNIT_NOT_INITED) {
            rf_unit_stop(app_handle);
        }

        hwctl_tx_power(true);
        hwctl_rx_power(true);

        if(dco_start(app_handle->settings->dco_frequency)) {
            if(rf_unit_filters_adjust(app_handle->settings->dco_frequency)) {
                if(rf_amp_start()) {
                    (void)rf_amp_bias1(app_handle->settings->rf_amp_bias);
                    (void)rf_amp_bias2(app_handle->settings->rf_amp_bias);
                    if(codec_start(app_handle->settings->codec_samplerate, false)) {
                        (void)codec_set_inp_src(CODEC_INP_LINE);
                        (void)codec_set_out_src(CODEC_OUT_DAC);
                        (void)codec_set_speaker_volume(app_handle->settings->codec_spk_volume);
                        (void)codec_set_headphone_volume(app_handle->settings->codec_hp_volume);
                        (void)codec_set_line_sensivity(app_handle->ctl_state->codec_rx_line_sensivity);
                        (void)codec_set_mic_sensivity(app_handle->settings->codec_mic_sensivity);
                        hwctl_ext_mic(app_handle->settings->hwctl_ext_mic);

                        trxctl_receive(true);
                        trxctl_transmit(false);

                        rf_unit.state               = RF_UNIT_READY;
                        rf_unit.frequency           = app_handle->settings->dco_frequency;
                        rf_unit.bias                = app_handle->settings->rf_amp_bias;
                        rf_unit.transmission        = app_handle->ctl_state->transmission = false;
                        rf_unit.samplerate          = app_handle->settings->codec_samplerate;
                        rf_unit.spk_volume          = app_handle->settings->codec_spk_volume;
                        rf_unit.hp_volume           = app_handle->settings->codec_hp_volume;
                        rf_unit.tx_line_sensivity   = app_handle->settings->codec_tx_line_sensivity;
                        rf_unit.tx_inp_src          = app_handle->settings->codec_tx_inp_src;
                        rf_unit.codec_rx_line_sensivity   = app_handle->ctl_state->codec_rx_line_sensivity;
                        rf_unit.mic_sensivity       = app_handle->settings->codec_mic_sensivity;
                        rf_unit.ext_mic             = app_handle->settings->hwctl_ext_mic;
                    } else {
                        rf_unit.state = RF_UNIT_CODEC_ERROR;
                    }
                } else {
                    rf_unit.state = RF_UNIT_RF_AMP_ERROR;
                }
            } else {
                rf_unit.state = RF_UNIT_FILTER_ERROR;
            }
        } else {
            rf_unit.state = RF_UNIT_DCO_ERROR;
        }
    }
    return rf_unit.state;
}

void rf_unit_stop(app_handle_t * app_handle) {

    (void)app_handle;
    rf_unit.state = RF_UNIT_NOT_INITED;

    hwctl_set_band(0);
    trxctl_receive(false);
    trxctl_transmit(false);

    codec_stop();
    rf_amp_stop();
    dco_stop();
    hwctl_tx_power(false);
    hwctl_rx_power(false);
}

rf_unit_state_t rf_unit_update(app_handle_t * app_handle) {

    if(rf_unit.state == RF_UNIT_READY) {
        if(rf_unit.frequency != app_handle->settings->dco_frequency) {
            if(dco_set_frequency(app_handle->settings->dco_frequency)) {
                if(rf_unit_filters_adjust(app_handle->settings->dco_frequency)) {
                    rf_unit.frequency = app_handle->settings->dco_frequency;
                } else {
                    rf_unit.state = RF_UNIT_FILTER_ERROR;
                }
            } else {
                rf_unit.state = RF_UNIT_DCO_ERROR;
            }
        }
        if(rf_unit.bias != app_handle->settings->rf_amp_bias) {
            if(rf_amp_bias1(app_handle->settings->rf_amp_bias) && rf_amp_bias2(app_handle->settings->rf_amp_bias)) {
                rf_unit.bias = app_handle->settings->rf_amp_bias;
            } else {
                rf_unit.state = RF_UNIT_RF_AMP_ERROR;
            }
        }
        if(rf_unit.transmission != app_handle->ctl_state->transmission) {
            trxctl_transmit(app_handle->ctl_state->transmission);
            if(codec_set_inp_src(app_handle->ctl_state->transmission ? rf_unit.tx_inp_src : CODEC_INP_LINE)) {
                (void)codec_set_line_sensivity(app_handle->ctl_state->transmission ? rf_unit.tx_line_sensivity : rf_unit.codec_rx_line_sensivity);
                rf_unit.transmission = app_handle->ctl_state->transmission;
            } else {
                rf_unit.state = RF_UNIT_CODEC_ERROR;
            }
        }
        if(rf_unit.samplerate != app_handle->settings->codec_samplerate) {
            codec_stop();
            if(codec_start(app_handle->settings->codec_samplerate, false)) {
                (void)codec_set_inp_src(rf_unit.transmission ? rf_unit.tx_inp_src : CODEC_INP_LINE);
                (void)codec_set_out_src(CODEC_OUT_DAC);
                (void)codec_set_speaker_volume(rf_unit.spk_volume);
                (void)codec_set_headphone_volume(rf_unit.hp_volume);
                (void)codec_set_line_sensivity(rf_unit.transmission? rf_unit.tx_line_sensivity : rf_unit.codec_rx_line_sensivity);
                (void)codec_set_mic_sensivity(rf_unit.mic_sensivity);
                rf_unit.samplerate = app_handle->settings->codec_samplerate;
            } else {
                rf_unit.state = RF_UNIT_CODEC_ERROR;
            }
        }
        if(rf_unit.spk_volume.mute != app_handle->settings->codec_spk_volume.mute ||
                rf_unit.spk_volume.volume != app_handle->settings->codec_spk_volume.volume) {
            if(codec_set_speaker_volume(app_handle->settings->codec_spk_volume)) {
                rf_unit.spk_volume = app_handle->settings->codec_spk_volume;
            } else {
                rf_unit.state = RF_UNIT_CODEC_ERROR;
            }
        }
        if(rf_unit.hp_volume.mute != app_handle->settings->codec_hp_volume.mute ||
                rf_unit.hp_volume.volume != app_handle->settings->codec_hp_volume.volume) {
            if(codec_set_headphone_volume(app_handle->settings->codec_hp_volume)) {
                rf_unit.hp_volume = app_handle->settings->codec_hp_volume;
            } else {
                rf_unit.state = RF_UNIT_CODEC_ERROR;
            }
        }
        if(rf_unit.tx_line_sensivity.mute != app_handle->settings->codec_tx_line_sensivity.mute ||
                rf_unit.tx_line_sensivity.volume != app_handle->settings->codec_tx_line_sensivity.volume) {
            if(rf_unit.transmission) {
                if(codec_set_line_sensivity(app_handle->settings->codec_tx_line_sensivity)) {
                    rf_unit.tx_line_sensivity = app_handle->settings->codec_tx_line_sensivity;
                } else {
                    rf_unit.state = RF_UNIT_CODEC_ERROR;
                }
            } else {
                rf_unit.tx_line_sensivity = app_handle->settings->codec_tx_line_sensivity;
            }
        }
        if(rf_unit.tx_inp_src != app_handle->settings->codec_tx_inp_src) {
            if(rf_unit.transmission) {
                if(codec_set_inp_src(app_handle->settings->codec_tx_inp_src)) {
                    rf_unit.tx_inp_src = app_handle->settings->codec_tx_inp_src;
                } else {
                    rf_unit.state = RF_UNIT_CODEC_ERROR;
                }
            } else {
                rf_unit.tx_inp_src = app_handle->settings->codec_tx_inp_src;
            }
        }
        if(rf_unit.codec_rx_line_sensivity.mute != app_handle->ctl_state->codec_rx_line_sensivity.mute ||
                rf_unit.codec_rx_line_sensivity.volume != app_handle->ctl_state->codec_rx_line_sensivity.volume) {
            if(!rf_unit.transmission) {
                if(codec_set_line_sensivity(app_handle->ctl_state->codec_rx_line_sensivity)) {
                    rf_unit.codec_rx_line_sensivity = app_handle->ctl_state->codec_rx_line_sensivity;
                } else {
                    rf_unit.state = RF_UNIT_CODEC_ERROR;
                }
            } else {
                rf_unit.codec_rx_line_sensivity = app_handle->ctl_state->codec_rx_line_sensivity;
            }
        }
        if(rf_unit.mic_sensivity.mute != app_handle->settings->codec_mic_sensivity.mute ||
                rf_unit.mic_sensivity.volume != app_handle->settings->codec_mic_sensivity.volume) {
            if(codec_set_mic_sensivity(app_handle->settings->codec_mic_sensivity)) {
                rf_unit.mic_sensivity = app_handle->settings->codec_mic_sensivity;
            } else {
                rf_unit.state = RF_UNIT_CODEC_ERROR;
            }
        }
        if(rf_unit.ext_mic != app_handle->settings->hwctl_ext_mic) {
            hwctl_ext_mic(app_handle->settings->hwctl_ext_mic);
            rf_unit.ext_mic = app_handle->settings->hwctl_ext_mic;
        }
    }
    return rf_unit.state;
}


static bool rf_unit_filters_adjust(uint32_t frequency) {

    bool result = true;
    if(frequency < 1800000UL) {
        result = false;
    } else if(frequency <= 3160000UL) {
        hwctl_set_band(0);
    } else if(frequency <= 5546000UL) {
        hwctl_set_band(1);
    } else if(frequency <= 9736000UL) {
        hwctl_set_band(2);
    } else if(frequency <= 17090000UL) {
        hwctl_set_band(3);
    } else if(frequency <= 30000000UL) {
        hwctl_set_band(4);
    } else {
        result = false;
    }
    return result;
}
