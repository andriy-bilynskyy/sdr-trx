/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    UI engine source file
    https://brtchip.com/wp-content/uploads/Support/Documentation/Programming_Guides/ICs/EVE/FT81X_Series_Programmer_Guide.pdf
*/


#include "ui_engine.h"
#include "ui_engine_conf.h"
#include "ft813_qspi.h"
#include "ft813_interrupt.h"
#include "ft813_def.h"
#include "ft813_graph.h"
#include "nhd_43_480272ft_ctxl_ctp.h"
#include "hwctl.h"
#include "misc_hal.h"
#include <string.h>


/******************************************************************************
 * TFT initialize timings
 ******************************************************************************/
#define UI_ENGINE_INIT_PULL_COUNT           4
#define UI_ENGINE_INIT_PULL_PERIOD_MS       50

/******************************************************************************
 * FT813 send command timeout
 ******************************************************************************/
#define UI_ENGINE_CMD_WAIT_PERIOD_MS        2

/******************************************************************************
 * TFT initialize timings
 ******************************************************************************/
#define UI_ENGINE_FT813_DISPLAY_EN_PIN      7


const uint16_t ui_engine_xsize = REG_HSIZE_VALUE;
const uint16_t ui_engine_ysize = REG_VSIZE_VALUE;


static bool ui_engine_qspi_4x = false;


static inline void     ui_engine_set_bus(bool qspi_4x)                                __attribute__((always_inline));
static inline void     ui_engine_host_command(uint8_t cmd, uint8_t arg)               __attribute__((always_inline));
static inline void     ui_engine_wr8(uint32_t addr, uint8_t data)                     __attribute__((always_inline));
static inline void     ui_engine_wr16(uint32_t addr, uint16_t data)                   __attribute__((always_inline));
static inline void     ui_engine_wr32(uint32_t addr, uint32_t data)                   __attribute__((always_inline));
static inline uint8_t  ui_engine_rd8(uint32_t addr)                                   __attribute__((always_inline));
//static inline uint16_t ui_engine_rd16(uint32_t addr)                                  __attribute__((always_inline));
static inline uint32_t ui_engine_rd32(uint32_t addr)                                  __attribute__((always_inline));
static inline uint32_t ui_engine_dl(uint32_t offset, void * dl_cmd, uint32_t dl_size) __attribute__((always_inline));
static inline uint32_t ui_engine_cmd(void * cp_cmd, uint32_t cp_size)                 __attribute__((always_inline));
static inline void     ui_engine_cmd_all(void * cp_cmd, uint32_t cp_size)             __attribute__((always_inline));


bool ui_engine_start(void) {

    bool engine_ok = false;

    ft813_qspi_start();
    ft813_interrupt_start();

    ft813_qspi_cmd(CMD_RST_PULSE, 0, false);
    ft813_qspi_cmd(CMD_RST_PULSE, 0, true);

    ui_engine_qspi_4x = false;

    ui_engine_host_command(CMD_CLKEXT, 0);
    ui_engine_host_command(CMD_ACTIVE, 0);

    for (uint8_t i = 0; i < UI_ENGINE_INIT_PULL_COUNT && !engine_ok; i++) {
        misc_hal_sleep_ms(UI_ENGINE_INIT_PULL_PERIOD_MS);
        if (ui_engine_rd8(REG_ID) == REG_CHIP_ID_VALUE) {
            engine_ok = true;
        }
    }

    if(engine_ok) {

        hwctl_start();
        hwctl_bkl_power(true);

        ui_engine_wr16(REG_HSIZE, REG_HSIZE_VALUE);
        ui_engine_wr16(REG_HCYCLE, REG_HCYCLE_VALUE);
        ui_engine_wr16(REG_HOFFSET, REG_HOFFSET_VALUE);
        ui_engine_wr16(REG_HSYNC0, REG_HSYNC0_VALUE);
        ui_engine_wr16(REG_HSYNC1, REG_HSYNC1_VALUE);
        ui_engine_wr16(REG_VSIZE, REG_VSIZE_VALUE);
        ui_engine_wr16(REG_VCYCLE, REG_VCYCLE_VALUE);
        ui_engine_wr16(REG_VOFFSET, REG_VOFFSET_VALUE);
        ui_engine_wr16(REG_VSYNC0, REG_VSYNC0_VALUE);
        ui_engine_wr16(REG_VSYNC1, REG_VSYNC1_VALUE);
        ui_engine_wr8(REG_PCLK, 0);
        ui_engine_wr8(REG_SWIZZLE, REG_SWIZZLE_VALUE);
        ui_engine_wr8(REG_PCLK_POL, REG_PCLK_POL_VALUE);
        ui_engine_wr8(REG_CSPREAD, REG_CSPREAD_VALUE);
        ui_engine_wr8(REG_DITHER, REG_DITHER_VALUE);

        uint32_t init_dl[] = {CLEAR_COLOR_RGB(0, 0, 0), CLEAR(1, 1, 1), DISPLAY()};
        ui_engine_dl(0, init_dl, sizeof(init_dl));
        ui_engine_wr8(REG_DLSWAP, DLSWAP_FRAME);

        ui_engine_wr8(REG_GPIO_DIR, ui_engine_rd8(REG_GPIO_DIR) | (1 << UI_ENGINE_FT813_DISPLAY_EN_PIN));
        ui_engine_wr8(REG_GPIO, ui_engine_rd8(REG_GPIO) | (1 << UI_ENGINE_FT813_DISPLAY_EN_PIN));

        ui_engine_wr8(REG_PCLK, REG_PCLK_VALUE);

        ui_engine_set_bus(true);

        ui_engine_wr8(REG_INT_MASK, INT_TAG);
        (void)ui_engine_rd8(REG_INT_FLAGS);
        ui_engine_wr8(REG_INT_EN, 1);
    }

    return engine_ok;
}

void ui_engine_stop(void) {

    hwctl_bkl_power(false);

    ui_engine_host_command(CMD_RST_PULSE, 0);
    ui_engine_host_command(CMD_SLEEP, 0);

    ft813_interrupt_stop();
    ft813_qspi_stop();
}

void ui_engine_set_brightness(uint8_t brightness) {

    if(brightness > 128) {
        brightness = 128;
    }
    ui_engine_wr8(REG_PWM_DUTY, brightness);
}

ui_engine_touch_t ui_engine_get_touch(bool block) {

    if(block) {
        ft813_interrupt_wait();
        (void)ui_engine_rd8(REG_INT_FLAGS);
    }
    ui_engine_touch_t touch = {
        .tag = ui_engine_rd8(REG_TOUCH_TAG),
        .value = ui_engine_rd32(REG_TRACKER) >> 16
    };
    return touch;
}

void ui_engine_draw_start(uint8_t r, uint8_t g, uint8_t b) {

    uint32_t data[] = {
        CMD_DLSTART,
        CLEAR_COLOR_RGB(r, g, b),
        CLEAR(1, 1, 1)
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_draw_end(void) {

    uint32_t data[] = {
        DISPLAY(),
        CMD_SWAP
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_set_color(uint8_t r, uint8_t g, uint8_t b) {

    uint32_t data[] = {
        COLOR_RGB(r, g, b)
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_set_fgcolor(uint8_t r, uint8_t g, uint8_t b) {

    uint32_t data[] = {
        CMD_FGCOLOR,
        (uint32_t)r << 16 | (uint32_t)g << 8 | b
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_set_bgcolor(uint8_t r, uint8_t g, uint8_t b) {

    uint32_t data[] = {
        CMD_BGCOLOR,
        (uint32_t)r << 16 | (uint32_t)g << 8 | b
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_set_gradient(uint8_t r0, uint8_t g0, uint8_t b0, uint8_t r1, uint8_t g1, uint8_t b1) {

    uint32_t data[] = {
        CMD_GRADIENT,
        0,
        (uint32_t)r0 << 16 | (uint32_t)g0 << 8 | b0,
                     ((uint32_t)REG_VSIZE_VALUE << 16) | REG_HSIZE_VALUE,
                     (uint32_t)r1 << 16 | (uint32_t)g1 << 8 | b1
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_line(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint8_t width) {

    uint32_t data[] = {
        BEGIN(LINES),
        LINE_WIDTH((uint16_t)width << 4),
        VERTEX2II(x1, y1, 0, 0),
        VERTEX2II(x2, y2, 0, 0),
        END()
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_rectangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint8_t coner) {

    uint32_t data[] = {
        BEGIN(RECTS),
        LINE_WIDTH((uint16_t)coner << 4),
        VERTEX2II(x1, y1, 0, 0),
        VERTEX2II(x2, y2, 0, 0),
        END()
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_circle(int16_t x, int16_t y, uint16_t radius) {

    uint32_t data[] = {
        BEGIN(POINTS),
        POINT_SIZE((uint32_t)radius << 4),
        VERTEX2II(x, y, 0, 0),
        END()
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_button(uint8_t tag, int16_t x, int16_t y, uint16_t width, uint16_t height, ui_engine_font_t font, const char * text) {

    uint32_t size = ((strlen(text) + 1) >> 2) + (((strlen(text) + 1) & 3) ? 7 : 6);
    uint32_t data[size];
    data[0] = TAG(tag);
    data[1] = CMD_BUTTON;
    data[2] = ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF);
    data[3] = ((uint32_t)height << 16) | width;
    data[4] = (uint32_t)font & 0xFFFF;
    strcpy((char *)&data[5], text);
    data[size - 1] = TAG(0);
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_text(uint8_t tag, int16_t x, int16_t y, ui_engine_font_t font, const char * text, bool center_align) {

    uint32_t size = ((strlen(text) + 1) >> 2) + (((strlen(text) + 1) & 3) ? 6 : 5);
    uint32_t data[size];
    data[0] = TAG(tag);
    data[1] = CMD_TEXT;
    data[2] = ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF);
    data[3] = (uint32_t)font & 0xFFFF;
    if(center_align) {
        data[3] |= OPT_CENTER << 16;
    }
    strcpy((char *)&data[4], text);
    data[size - 1] = TAG(0);
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_slider(uint8_t tag, int16_t x, int16_t y, uint16_t width, uint16_t height, uint16_t value) {

    uint32_t data[] = {
        CMD_TRACK,
        ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF),
        ((uint32_t)height << 16) | width,
        tag,
        TAG(tag),
        CMD_SLIDER,
        ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF),
        ((uint32_t)height << 16) | width,
        ((uint32_t)value << 16),
        0xFFFF,
        TAG(0)
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_dial(uint8_t tag, int16_t x, int16_t y, uint16_t radius, uint16_t value) {

    uint32_t data[] = {
        CMD_TRACK,
        ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF),
        (1 << 16) | 1,
        tag,
        TAG(tag),
        CMD_DIAL,
        ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF),
        (uint32_t)radius & 0xFFFF,
        value,
        TAG(0)
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_number(uint8_t tag, int16_t x, int16_t y, ui_engine_font_t font, uint32_t value, uint8_t base, bool is_signed, bool center_align) {

    if(base < 2 || base > 36) {
        base = 10;
    }
    uint32_t data[] = {
        CMD_SETBASE,
        base,
        TAG(tag),
        CMD_NUMBER,
        ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF),
        (uint32_t)font & 0xFFFF,
        value,
        TAG(0)
    };
    if(center_align) {
        data[5] |= OPT_CENTER << 16;
    }
    if(is_signed) {
        data[5] |= OPT_SIGNED << 16;
    }
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_progress(int16_t x, int16_t y, uint16_t width, uint16_t height, uint16_t value, uint16_t range) {

    uint32_t data[] = {
        CMD_PROGRESS,
        ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF),
        ((uint32_t)height << 16) | width,
        ((uint32_t)value << 16),
        range
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_scrollbar(uint8_t tag, int16_t x, int16_t y, uint16_t width, uint16_t height, uint16_t value) {

    uint32_t data[] = {
        CMD_TRACK,
        ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF),
        ((uint32_t)height << 16) | width,
        tag,
        TAG(tag),
        CMD_SCROLLBAR,
        ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF),
        ((uint32_t)height << 16) | width,
        ((uint32_t)value << 16),
        ((uint32_t)0xFFFF << 16),
        TAG(0)
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_clock(uint8_t tag, int16_t x, int16_t y, uint16_t radius, time_t time) {

    struct tm *ti;
    ti = localtime(&time);
    uint32_t data[] = {
        TAG(tag),
        CMD_CLOCK,
        ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF),
        radius,
        ((uint32_t)ti->tm_min << 16) | ((uint32_t)ti->tm_hour & 0xFFFF),
        (uint32_t)ti->tm_sec & 0xFFFF,
        TAG(0)
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_gauge(uint8_t tag, int16_t x, int16_t y, uint16_t radius, uint16_t value, uint16_t range) {
    uint32_t data[] = {
        TAG(tag),
        CMD_GAUGE,
        ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF),
        radius,
        ((uint32_t)5 << 16) | 10,
        ((uint32_t)range << 16) | value,
        TAG(0)
    };
    ui_engine_cmd_all(data, sizeof(data));
}

void ui_engine_toggle(uint8_t tag, int16_t x, int16_t y, uint16_t width, ui_engine_font_t font, bool state, const char * l_off, const char * l_on) {

    uint32_t len[] = {
        strlen(l_off),
        strlen(l_on)
    };
    uint32_t size = ((len[0] + len[1] + 2) >> 2) + (((len[0] + len[1] + 2) & 3) ? 7 : 6);
    uint32_t data[size];
    data[0] = TAG(tag);
    data[1] = CMD_TOGGLE;
    data[2] = ((uint32_t)y << 16) | ((uint32_t)x & 0xFFFF);
    data[3] = ((uint32_t)font << 16) | width;
    data[4] = (state ? 0xFFFFUL : 0UL) << 16;
    strcpy((char *)&data[5], l_off);
    *(((char *)&data[5]) + len[0]) = 0xFF;
    strcpy(((char *)&data[5]) + len[0] + 1, l_on);
    data[size - 1] = TAG(0);
    ui_engine_cmd_all(data, sizeof(data));
}


/******************************************************************************
 * Private unit functions
 ******************************************************************************/

static inline void ui_engine_set_bus(bool qspi_4x) {

    if(ui_engine_qspi_4x != qspi_4x) {
        ui_engine_qspi_4x = qspi_4x;
        if(ui_engine_qspi_4x) {
            uint8_t data = REG_SPI_WIDTH_VALUE_4X;
            ft813_qspi_wr(REG_SPI_WIDTH, &data, sizeof(data), false);
        } else {
            uint8_t data = REG_SPI_WIDTH_VALUE_1X;
            ft813_qspi_wr(REG_SPI_WIDTH, &data, sizeof(data), true);
        }
    }
}

static inline void ui_engine_host_command(uint8_t cmd, uint8_t arg) {

    if(ui_engine_qspi_4x) {
        uint8_t data = REG_SPI_WIDTH_VALUE_1X;
        ft813_qspi_wr(REG_SPI_WIDTH, &data, sizeof(data), true);
    }
    ft813_qspi_cmd(cmd, arg, false);
    if(ui_engine_qspi_4x) {
        uint8_t data = REG_SPI_WIDTH_VALUE_4X;
        ft813_qspi_wr(REG_SPI_WIDTH, &data, sizeof(data), false);
    }
}

static inline void ui_engine_wr8(uint32_t addr, uint8_t data) {

    ft813_qspi_wr(addr, &data, sizeof(data), ui_engine_qspi_4x);
}

static inline void ui_engine_wr16(uint32_t addr, uint16_t data) {

    ft813_qspi_wr(addr, &data, sizeof(data), ui_engine_qspi_4x);
}

static inline void ui_engine_wr32(uint32_t addr, uint32_t data) {

    ft813_qspi_wr(addr, &data, sizeof(data), ui_engine_qspi_4x);
}

static inline uint8_t ui_engine_rd8(uint32_t addr) {

    uint8_t data = 0;
    ft813_qspi_rd(addr, &data, sizeof(data), ui_engine_qspi_4x);
    return data;
}

//static inline uint16_t ui_engine_rd16(uint32_t addr) {
//
//    uint16_t data = 0;
//    ft813_qspi_rd(addr, &data, sizeof(data), ui_engine_qspi_4x);
//    return data;
//}

static inline uint32_t ui_engine_rd32(uint32_t addr) {

    uint32_t data = 0;
    ft813_qspi_rd(addr, &data, sizeof(data), ui_engine_qspi_4x);
    return data;
}

static inline uint32_t ui_engine_dl(uint32_t offset, void * dl_cmd, uint32_t dl_size) {

    uint32_t wr_byres = dl_size < RAM_DL_SIZE - offset ? dl_size : RAM_DL_SIZE - offset;
    ft813_qspi_wr(RAM_DL + offset, dl_cmd, wr_byres, ui_engine_qspi_4x);
    return wr_byres;
}

static inline uint32_t ui_engine_cmd(void * cp_cmd, uint32_t cp_size) {

    uint32_t buf_free = ui_engine_rd32(REG_CMDB_SPACE);
    uint32_t wr_byres = cp_size < buf_free ? cp_size : buf_free;
    uint32_t wr = ui_engine_rd32(REG_CMD_WRITE);
    ft813_qspi_wr(RAM_CMD + wr, cp_cmd, wr_byres, ui_engine_qspi_4x);
    ui_engine_wr32(REG_CMD_WRITE, (wr + wr_byres) % RAM_CMD_SIZE);
    return wr_byres;
}

static inline void ui_engine_cmd_all(void * cp_cmd, uint32_t cp_size) {

    while(cp_size) {
        uint32_t sent = ui_engine_cmd(cp_cmd, cp_size);
        cp_cmd = (uint8_t *)cp_cmd + sent;
        cp_size -= sent;
        misc_hal_sleep_ms(UI_ENGINE_CMD_WAIT_PERIOD_MS);
    }
}
