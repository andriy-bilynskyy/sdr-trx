/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    WM8731 control interface driver source file
    https://statics.cirrus.com/pubs/proDatasheet/WM8731_v4.9.pdf
*/


#include "wm8731_ctl.h"
#include "wm8731_def.h"
#include "i2c_master.h"


typedef struct {
    codec_volume_t out_r;
    codec_volume_t out_l;
    codec_volume_t inp;
    codec_volume_t mic;
    out_src_t      out_src;
    inp_src_t      inp_src;
} wm8731_ctl_data_t;


static wm8731_ctl_data_t       wm8731_ctl_data;

static const wm8731_ctl_data_t wm8731_ctl_data_def = {
    .out_r   = {.mute = false, .volume = 0x49},
    .out_l   = {.mute = false, .volume = 0x49},
    .inp     = {.mute = false, .volume = 0x17},
    .mic     = {.mute = false, .volume = 0x01},
    .out_src = OUT_DAC,
    .inp_src = INP_LINE
};


bool wm8731_ctl_start(void) {

    i2c_master_start();

    wm8731_ctl_data = wm8731_ctl_data_def;

    uint16_t rst = WM8731_RESET;
    bool result = (i2c_master_write(WM8731_I2C_ADDR, &rst, sizeof(rst)) == sizeof(rst));
    if(result) {
        uint16_t pd = WM8731_PD_CTL | WM8731_PD_CTL_CLKOUTPD | WM8731_PD_CTL_OSCPD |
                      (wm8731_ctl_data.mic.mute ? WM8731_PD_CTL_MICPD : 0) |
                      (wm8731_ctl_data.inp.mute ? WM8731_PD_CTL_LINEINPD : 0);
        result = (i2c_master_write(WM8731_I2C_ADDR, &pd, sizeof(pd)) == sizeof(pd));
    }
    if(result) {
        uint16_t out_r = WM8731_RIGHT_HPOUT | (wm8731_ctl_data.out_r.mute ? 0 : WM8731_HPOUT_VOLUME(wm8731_ctl_data.out_r.volume));
        result = (i2c_master_write(WM8731_I2C_ADDR, &out_r, sizeof(out_r)) == sizeof(out_r));
    }
    if(result) {
        uint16_t out_l = WM8731_LEFT_HPOUT | (wm8731_ctl_data.out_l.mute ? 0 : WM8731_HPOUT_VOLUME(wm8731_ctl_data.out_l.volume));
        result = (i2c_master_write(WM8731_I2C_ADDR, &out_l, sizeof(out_l)) == sizeof(out_l));
    }
    if(result) {
        uint16_t inp_r = WM8731_RIGHT_LINEIN | WM8731_LINEIN_VOLUME(wm8731_ctl_data.inp.volume) | (wm8731_ctl_data.inp.mute ? WM8731_LINEIN_INMUTE : 0);
        uint16_t inp_l = WM8731_LEFT_LINEIN | WM8731_LINEIN_VOLUME(wm8731_ctl_data.inp.volume) | (wm8731_ctl_data.inp.mute ? WM8731_LINEIN_INMUTE : 0);
        result = (i2c_master_write(WM8731_I2C_ADDR, &inp_r, sizeof(inp_r)) == sizeof(inp_r) &&
                  i2c_master_write(WM8731_I2C_ADDR, &inp_l, sizeof(inp_l)) == sizeof(inp_l));
    }
    if(result) {
        uint16_t src = WM8731_ANALOG_AUDIO_PATH |
                       (wm8731_ctl_data.mic.volume ? WM8731_ANALOG_AUDIO_PATH_MICBOOST : 0) |
                       (wm8731_ctl_data.mic.mute ? WM8731_ANALOG_AUDIO_PATH_MUTEMIC : 0) |
                       (wm8731_ctl_data.inp_src == INP_MIC ? WM8731_ANALOG_AUDIO_PATH_INSEL_MIC : WM8731_ANALOG_AUDIO_PATH_INSEL_LINE);
        switch(wm8731_ctl_data.out_src) {
        case OUT_MIC:
            src |= WM8731_ANALOG_AUDIO_PATH_SIDETONE;
            break;
        case OUT_LINE:
            src |= WM8731_ANALOG_AUDIO_PATH_BYPASS;
            break;
        case OUT_DAC:
            src |= WM8731_ANALOG_AUDIO_PATH_DACSEL;
            break;
        case OUT_MUTE:
        default:
            break;
        }
        result = (i2c_master_write(WM8731_I2C_ADDR, &src, sizeof(src)) == sizeof(src));
    }
    if(result) {
        uint16_t dig = WM8731_DIGITAL_AUDIO_PATH;
        result = (i2c_master_write(WM8731_I2C_ADDR, &dig, sizeof(dig)) == sizeof(dig));
    }
    if(result) {
        uint16_t fmt = WM8731_DIGITAL_AUDIO_FMT | WM8731_DIGITAL_AUDIO_FMT_FORMAT_2 | WM8731_DIGITAL_AUDIO_FMT_IWL_16B;
        result = (i2c_master_write(WM8731_I2C_ADDR, &fmt, sizeof(fmt)) == sizeof(fmt));
    }
    if(result) {
        uint16_t sampl = WM8731_SAMPLING_CTL;
        result = (i2c_master_write(WM8731_I2C_ADDR, &sampl, sizeof(sampl)) == sizeof(sampl));
    }
    if(result) {
        uint16_t act = WM8731_ACTIVE_CTL | WM8731_ACTIVE_CTL_ACTIVE;
        result = (i2c_master_write(WM8731_I2C_ADDR, &act, sizeof(act)) == sizeof(act));
    }

    return result;
}

void wm8731_ctl_stop(void) {

    uint16_t rst = WM8731_RESET;
    (void)i2c_master_write(WM8731_I2C_ADDR, &rst, sizeof(rst));
    wm8731_ctl_data = wm8731_ctl_data_def;
}

codec_volume_t wm8731_ctl_get_output_volume_r(void) {

    return wm8731_ctl_data.out_r;
}

codec_volume_t wm8731_ctl_get_output_volume_l(void) {

    return wm8731_ctl_data.out_l;
}

bool wm8731_ctl_set_output_volume_r(codec_volume_t volume) {

    if(volume.volume > CODEC_OUTPUT_MAX_VOLUME) {
        volume.volume = CODEC_OUTPUT_MAX_VOLUME;
    }
    uint16_t out = WM8731_RIGHT_HPOUT | (volume.mute ? 0 : (WM8731_HPOUT_VOLUME(volume.volume)));

    bool result = (i2c_master_write(WM8731_I2C_ADDR, &out, sizeof(out)) == sizeof(out));

    if(result) {
        wm8731_ctl_data.out_r = volume;
    }
    return result;
}

bool wm8731_ctl_set_output_volume_l(codec_volume_t volume) {

    if(volume.volume > CODEC_OUTPUT_MAX_VOLUME) {
        volume.volume = CODEC_OUTPUT_MAX_VOLUME;
    }
    uint16_t out = WM8731_LEFT_HPOUT | (volume.mute ? 0 : WM8731_HPOUT_VOLUME(volume.volume));

    bool result = (i2c_master_write(WM8731_I2C_ADDR, &out, sizeof(out)) == sizeof(out));

    if(result) {
        wm8731_ctl_data.out_l = volume;
    }
    return result;
}

codec_volume_t wm8731_ctl_get_input_volume(void) {

    return wm8731_ctl_data.inp;
}

bool wm8731_ctl_set_input_volume(codec_volume_t volume) {

    if(volume.volume > CODEC_INPUT_MAX_VOLUME) {
        volume.volume = CODEC_INPUT_MAX_VOLUME;
    }
    uint16_t pd = WM8731_PD_CTL | WM8731_PD_CTL_CLKOUTPD | WM8731_PD_CTL_OSCPD |
                  (wm8731_ctl_data.mic.mute ? WM8731_PD_CTL_MICPD : 0) |
                  (volume.mute ? WM8731_PD_CTL_LINEINPD : 0);
    uint16_t inp_l = WM8731_RIGHT_LINEIN | WM8731_LINEIN_VOLUME(volume.volume) | (volume.mute ? WM8731_LINEIN_INMUTE : 0);
    uint16_t inp_r = WM8731_LEFT_LINEIN | WM8731_LINEIN_VOLUME(volume.volume) | (volume.mute ? WM8731_LINEIN_INMUTE : 0);

    bool result = (i2c_master_write(WM8731_I2C_ADDR, &inp_l, sizeof(inp_l)) == sizeof(inp_l) &&
                   i2c_master_write(WM8731_I2C_ADDR, &inp_r, sizeof(inp_r)) == sizeof(inp_r) &&
                   i2c_master_write(WM8731_I2C_ADDR, &pd, sizeof(pd)) == sizeof(pd));

    if(result) {
        wm8731_ctl_data.inp = volume;
    }
    return result;
}

codec_volume_t wm8731_ctl_get_mic_volume(void) {

    return wm8731_ctl_data.mic;
}

bool wm8731_ctl_set_mic_volume(codec_volume_t volume) {

    if(volume.volume > CODEC_MIC_MAX_VOLUME) {
        volume.volume = CODEC_MIC_MAX_VOLUME;
    }
    uint16_t pd = WM8731_PD_CTL | WM8731_PD_CTL_CLKOUTPD | WM8731_PD_CTL_OSCPD |
                  (volume.mute ? WM8731_PD_CTL_MICPD : 0) |
                  (wm8731_ctl_data.inp.mute ? WM8731_PD_CTL_LINEINPD : 0);
    uint16_t src = WM8731_ANALOG_AUDIO_PATH |
                   (volume.volume ? WM8731_ANALOG_AUDIO_PATH_MICBOOST : 0) |
                   (volume.mute ? WM8731_ANALOG_AUDIO_PATH_MUTEMIC : 0) |
                   (wm8731_ctl_data.inp_src == INP_MIC ? WM8731_ANALOG_AUDIO_PATH_INSEL_MIC : WM8731_ANALOG_AUDIO_PATH_INSEL_LINE);
    switch(wm8731_ctl_data.out_src) {
    case OUT_MIC:
        src |= WM8731_ANALOG_AUDIO_PATH_SIDETONE;
        break;
    case OUT_LINE:
        src |= WM8731_ANALOG_AUDIO_PATH_BYPASS;
        break;
    case OUT_DAC:
        src |= WM8731_ANALOG_AUDIO_PATH_DACSEL;
        break;
    case OUT_MUTE:
    default:
        break;
    }
    bool result = (i2c_master_write(WM8731_I2C_ADDR, &src, sizeof(src)) == sizeof(src) &&
                   i2c_master_write(WM8731_I2C_ADDR, &pd, sizeof(pd)) == sizeof(pd));

    if(result) {
        wm8731_ctl_data.mic = volume;
    }
    return result;
}

out_src_t wm8731_ctl_get_out_src() {
    return wm8731_ctl_data.out_src;
}

bool wm8731_ctl_set_out_src(out_src_t out_src) {

    bool result = true;

    uint16_t src = WM8731_ANALOG_AUDIO_PATH |
                   (wm8731_ctl_data.mic.volume ? WM8731_ANALOG_AUDIO_PATH_MICBOOST : 0) |
                   (wm8731_ctl_data.mic.mute ? WM8731_ANALOG_AUDIO_PATH_MUTEMIC : 0) |
                   (wm8731_ctl_data.inp_src == INP_MIC ? WM8731_ANALOG_AUDIO_PATH_INSEL_MIC : WM8731_ANALOG_AUDIO_PATH_INSEL_LINE);

    switch(out_src) {
    case OUT_MIC:
        src |= WM8731_ANALOG_AUDIO_PATH_SIDETONE;
        break;
    case OUT_LINE:
        src |= WM8731_ANALOG_AUDIO_PATH_BYPASS;
        break;
    case OUT_DAC:
        src |= WM8731_ANALOG_AUDIO_PATH_DACSEL;
        break;
    case OUT_MUTE:
        break;
    default:
        result = false;
        break;
    }

    if(result) {
        result = (i2c_master_write(WM8731_I2C_ADDR, &src, sizeof(src)) == sizeof(src));
    }
    if(result) {
        wm8731_ctl_data.out_src = out_src;
    }

    return result;
}

inp_src_t wm8731_ctl_get_inp_src() {
    return wm8731_ctl_data.inp_src;
}

bool wm8731_ctl_set_inp_src(inp_src_t inp_src) {

    bool result = false;
    if(inp_src == INP_MIC || inp_src == INP_LINE) {
        uint16_t src = WM8731_ANALOG_AUDIO_PATH |
                       (wm8731_ctl_data.mic.volume ? WM8731_ANALOG_AUDIO_PATH_MICBOOST : 0) |
                       (wm8731_ctl_data.mic.mute ? WM8731_ANALOG_AUDIO_PATH_MUTEMIC : 0) |
                       (inp_src == INP_MIC ? WM8731_ANALOG_AUDIO_PATH_INSEL_MIC : WM8731_ANALOG_AUDIO_PATH_INSEL_LINE);
        switch(wm8731_ctl_data.out_src) {
        case OUT_MIC:
            src |= WM8731_ANALOG_AUDIO_PATH_SIDETONE;
            break;
        case OUT_LINE:
            src |= WM8731_ANALOG_AUDIO_PATH_BYPASS;
            break;
        case OUT_DAC:
            src |= WM8731_ANALOG_AUDIO_PATH_DACSEL;
            break;
        case OUT_MUTE:
        default:
            break;
        }
        result = (i2c_master_write(WM8731_I2C_ADDR, &src, sizeof(src)) == sizeof(src));

        if(result) {
            wm8731_ctl_data.inp_src = inp_src;
        }
    }
    return result;
}
