/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Digital controlled oscillator driver source file
    SI5351 CMOS clock generator
    https://www.silabs.com/documents/public/data-sheets/Si5351-B.pdf
    https://www.silabs.com/documents/public/application-notes/AN619.pdf
*/


#include "dco.h"
#include "dco_conf.h"
#include "si5351_def.h"
#include "hwctl.h"
#include "i2c_master.h"
#include "misc_hal.h"


static volatile bool dco_started  = false;


static inline bool dco_setup_frequency(uint32_t frequency)          __attribute__((always_inline));
static inline bool dco_setup_pll(uint8_t a, uint32_t b, uint32_t c) __attribute__((always_inline));
static inline bool dco_setup_ms(uint8_t i_div, uint8_t r_div)       __attribute__((always_inline));


bool dco_start(uint32_t frequency) {

    if(!dco_started) {
        hwctl_start();
        i2c_master_start();

        hwctl_rx_power(true);
        misc_hal_sleep_ms(20);      /* power stabilization */

        uint8_t xtal_load[] = {SI5351_CRYSTAL_LOAD, SI5351_CRYSTAL_LOAD_0PF};
        uint8_t outs_dis[] = {SI5351_OUTPUT_ENABLE_CTRL, SI5351_OUTPUT_ENABLE_CTRL_CLK7 | SI5351_OUTPUT_ENABLE_CTRL_CLK6 |
                              SI5351_OUTPUT_ENABLE_CTRL_CLK5 | SI5351_OUTPUT_ENABLE_CTRL_CLK4 | SI5351_OUTPUT_ENABLE_CTRL_CLK3 |
                              SI5351_OUTPUT_ENABLE_CTRL_CLK2 |SI5351_OUTPUT_ENABLE_CTRL_CLK1 | SI5351_OUTPUT_ENABLE_CTRL_CLK0
                             };
        uint8_t out_off[] = {SI5351_CLK0_CTRL, [1 ... 8] = SI5351_CLK_CTRL_PDN};
        uint8_t pll_src[] = {SI5351_PLL_INPUT_SRC, SI5351_PLL_INPUT_SRC_PLLB_SRC_XTAL | SI5351_PLL_INPUT_SRC_PLLA_SRC_XTAL};
        uint8_t out_ctl[] = {SI5351_CLK0_CTRL, SI5351_CLK_CTRL_MS0_INT | SI5351_CLK_CTRL_MS0_SRC_PLLA | SI5351_CLK_CTRL_CLK_SRC_MS | SI5351_CLK_CTRL_CLK_IDRV_8MA};
        uint8_t pll_rst[] = {SI5351_PLL_RESET, SI5351_PLL_RESET_B | SI5351_PLL_RESET_A};
        uint8_t out_en[] = {SI5351_OUTPUT_ENABLE_CTRL, ~SI5351_OUTPUT_ENABLE_CTRL_CLK0};

        dco_started = (i2c_master_write(SI5351_I2C_ADDR, xtal_load, sizeof(xtal_load)) == sizeof(xtal_load)) &&
                      (i2c_master_write(SI5351_I2C_ADDR, outs_dis, sizeof(outs_dis)) == sizeof(outs_dis))    &&
                      (i2c_master_write(SI5351_I2C_ADDR, out_off, sizeof(out_off)) == sizeof(out_off))       &&
                      (i2c_master_write(SI5351_I2C_ADDR, pll_src, sizeof(pll_src)) == sizeof(pll_src))       &&
                      (i2c_master_write(SI5351_I2C_ADDR, out_ctl, sizeof(out_ctl)) == sizeof(out_ctl))       &&
                      dco_setup_frequency(frequency)                                                         &&
                      (i2c_master_write(SI5351_I2C_ADDR, pll_rst, sizeof(pll_rst)) == sizeof(pll_rst))       &&
                      (i2c_master_write(SI5351_I2C_ADDR, out_en, sizeof(out_en)) == sizeof(out_en));
    }
    return dco_started;
}

void dco_stop(void) {

    if(dco_started) {
        dco_started = false;
        uint8_t outs_dis[] = {SI5351_OUTPUT_ENABLE_CTRL, SI5351_OUTPUT_ENABLE_CTRL_CLK7 | SI5351_OUTPUT_ENABLE_CTRL_CLK6 |
                              SI5351_OUTPUT_ENABLE_CTRL_CLK5 | SI5351_OUTPUT_ENABLE_CTRL_CLK4 | SI5351_OUTPUT_ENABLE_CTRL_CLK3 |
                              SI5351_OUTPUT_ENABLE_CTRL_CLK2 |SI5351_OUTPUT_ENABLE_CTRL_CLK1 | SI5351_OUTPUT_ENABLE_CTRL_CLK0
                             };
        (void)i2c_master_write(SI5351_I2C_ADDR, outs_dis, sizeof(outs_dis));
    }
}

bool dco_set_frequency(uint32_t frequency) {

    bool result = false;
    if(dco_started) {
        result = dco_setup_frequency(frequency);
    }
    return result;
}

dco_status_t dco_status(void) {

    dco_status_t result = {.system_initing = false,
                           .lost_pllb = false,
                           .lost_plla = false,
                           .lost_clkin = true,
                           .lost_xtal = true,
                           .revision = 0
                          };
    if(dco_started) {
        uint8_t data = SI5351_DEVICE_STATUS;
        if(i2c_master_write(SI5351_I2C_ADDR, &data, sizeof(data)) == sizeof(data)) {
            if(i2c_master_read(SI5351_I2C_ADDR, &data, sizeof(data)) == sizeof(data)) {
                result.system_initing   = ((data & SI5351_DEVICE_STATUS_SYS_INIT) == SI5351_DEVICE_STATUS_SYS_INIT);
                result.lost_pllb        = ((data & SI5351_DEVICE_STATUS_LOL_B) == SI5351_DEVICE_STATUS_LOL_B);
                result.lost_plla        = ((data & SI5351_DEVICE_STATUS_LOL_A) == SI5351_DEVICE_STATUS_LOL_A);
                result.lost_clkin       = ((data & SI5351_DEVICE_STATUS_LOS_CLKIN) == SI5351_DEVICE_STATUS_LOS_CLKIN);
                result.lost_xtal        = ((data & SI5351_DEVICE_STATUS_LOS_XTAL) == SI5351_DEVICE_STATUS_LOS_XTAL);
                result.revision         = data & SI5351_DEVICE_STATUS_REVID;
            }
        }
    }
    return result;
}


/******************************************************************************
 * Private unit functions
 ******************************************************************************/

static inline bool dco_setup_frequency(uint32_t frequency) {

    bool result = false;
    if(frequency >= DCO_MIN_FREQUENCY && frequency <= DCO_MAX_FREQUENCY) {
        frequency *= 4;   /* SSB modulator divider at the output */
        uint8_t div = (SI5351_PLL_FREQUENCY / frequency) & 0xFE;
        uint32_t pll_f = frequency * div;
        result =  dco_setup_pll(pll_f / DCO_REF_FREQUENCY, ((uint64_t)(pll_f % DCO_REF_FREQUENCY) * SI5351_FLOAT_MAX) / DCO_REF_FREQUENCY, SI5351_FLOAT_MAX) && dco_setup_ms(div, 0);
    }
    return result;
}

static inline bool dco_setup_pll(uint8_t a, uint32_t b, uint32_t c) {

    bool result = false;
    if(a >= SI5351_PLL_MIN && a < SI5351_PLL_MAX && b <= SI5351_FLOAT_MAX && c <= SI5351_FLOAT_MAX) {
        uint32_t d = (b * 128) / c;
        uint32_t msn_p1 = a * 128 + d - 512;
        uint32_t msn_p2 = b * 128 - c * d;
        uint32_t msn_p3 = c;

        uint8_t msn[] = {
            SI5351_PLLA_PARAMETERS,
            (msn_p3 >> 8),
            msn_p3,
            (msn_p1 >> 16) & 3,
            (msn_p1 >> 8),
            msn_p1,
            ((msn_p3 >> 12) & 0xF0) | ((msn_p2 >> 16) & 0x0F),
            (msn_p2 >> 8),
            msn_p2
        };
        result = (i2c_master_write(SI5351_I2C_ADDR, msn, sizeof(msn)) == sizeof(msn));
    }
    return result;
}
/* use integer divider. See AN619 p 6. https://www.silabs.com/documents/public/application-notes/AN619.pdf
 * Multisynth integer mode may be enabled by setting MSx_INT=1 (see registers 16-21, bit 6).
 * In most cases setting this bit will improve jitter when using even integer divide values. */
static inline bool dco_setup_ms(uint8_t i_div, uint8_t r_div) {

    bool result = false;
    if(     i_div >= SI5351_MULTISYNTH_INT_MIN && i_div <= SI5351_MULTISYNTH_INT_MAX && (i_div & 1) == 0 &&
            r_div <= SI5351_MULTISYNTH_RDIV_MAX && (r_div & (r_div - 1)) == 0) {
        uint32_t ms_p1 = (uint32_t)i_div * 128 - 512;
        uint32_t ms_p2 = 0;
        uint32_t ms_p3 = 1;

        uint8_t ms[] = {
            SI5351_MS0_PARAMETERS,
            (ms_p3 >> 8),
            ms_p3,
            ((ms_p1 >> 16) & 3) | (r_div << 4),
            (ms_p1 >> 8),
            ms_p1,
            ((ms_p3 >> 12) & 0xF0) | ((ms_p2 >> 16) & 0x0F),
            (ms_p2 >> 8),
            ms_p2
        };
        result = (i2c_master_write(SI5351_I2C_ADDR, ms, sizeof(ms)) == sizeof(ms));
    }
    return result;
}
