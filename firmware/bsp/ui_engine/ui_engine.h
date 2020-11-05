/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    UI engine header file
    https://brtchip.com/wp-content/uploads/Support/Documentation/Programming_Guides/ICs/EVE/FT81X_Series_Programmer_Guide.pdf
*/

#ifndef __UI_ENGINE_H
#define __UI_ENGINE_H


#include <stdint.h>
#include <stdbool.h>
#include <time.h>


typedef struct {
    uint8_t     tag;
    uint16_t    value;
} ui_engine_touch_t;

typedef enum {
    UI_ENGINE_FONT16    = 16,   /* 8 x 8 */
    UI_ENGINE_FONT17U   = 17,   /* 8 x 8 */
    UI_ENGINE_FONT18    = 18,   /* 8 x 16 */
    UI_ENGINE_FONT19U   = 19,   /* 8 x 16 */
    UI_ENGINE_FONT20    = 20,   /* 11 x 13 */
    UI_ENGINE_FONT21    = 21,   /* 13 x 17 */
    UI_ENGINE_FONT22    = 22,   /* 17 x 20 */
    UI_ENGINE_FONT23    = 23,   /* 18 x 22 */
    UI_ENGINE_FONT24    = 24,   /* 25 x 29 */
    UI_ENGINE_FONT25    = 25,   /* 34 x 38 */
    UI_ENGINE_FONT26    = 26,   /* 13 x 16 */
    UI_ENGINE_FONT27    = 27,   /* 15 x 20 */
    UI_ENGINE_FONT28    = 28,   /* 19 x 25 */
    UI_ENGINE_FONT29    = 29,   /* 21 x 28 */
    UI_ENGINE_FONT30    = 30,   /* 28 x 36 */
    UI_ENGINE_FONT31    = 31,   /* 37 x 49 */
    UI_ENGINE_FONT32    = 32,   /* 49 x 63 */
    UI_ENGINE_FONT33    = 33,   /* 63 x 83 */
    UI_ENGINE_FONT34    = 34    /* 82 x 108 */
} ui_engine_font_t;


extern const uint16_t ui_engine_xsize;
extern const uint16_t ui_engine_ysize;


bool                ui_engine_start(void);
void                ui_engine_stop(void);
void                ui_engine_set_brightness(uint8_t brightness);
void                ui_engine_event_set(uint32_t event_flags);
uint32_t            ui_engine_event_wait(uint32_t flags);
ui_engine_touch_t   ui_engine_get_touch(void);
void                ui_engine_draw_start(uint8_t r, uint8_t g, uint8_t b);
void                ui_engine_draw_end(void);
void                ui_engine_set_color(uint8_t r, uint8_t g, uint8_t b);
void                ui_engine_set_fgcolor(uint8_t r, uint8_t g, uint8_t b);
void                ui_engine_set_bgcolor(uint8_t r, uint8_t g, uint8_t b);
void                ui_engine_set_gradient(uint8_t r0, uint8_t g0, uint8_t b0, uint8_t r1, uint8_t g1, uint8_t b1);
void                ui_engine_line(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint8_t width);
void                ui_engine_rectangle(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint8_t coner);
void                ui_engine_circle(int16_t x, int16_t y, uint16_t radius);
void                ui_engine_button(uint8_t tag, int16_t x, int16_t y, uint16_t width, uint16_t height, ui_engine_font_t font, const char * text);
void                ui_engine_text(uint8_t tag, int16_t x, int16_t y, ui_engine_font_t font, const char * text, bool center_align);
void                ui_engine_slider(uint8_t tag, int16_t x, int16_t y, uint16_t width, uint16_t height, uint16_t value);
void                ui_engine_dial(uint8_t tag, int16_t x, int16_t y, uint16_t radius, uint16_t value);
void                ui_engine_number(uint8_t tag, int16_t x, int16_t y, ui_engine_font_t font, uint32_t value, uint8_t base, bool is_signed, bool center_align);
void                ui_engine_progress(int16_t x, int16_t y, uint16_t width, uint16_t height, uint16_t value, uint16_t range);
void                ui_engine_scrollbar(uint8_t tag, int16_t x, int16_t y, uint16_t width, uint16_t height, uint16_t value);
void                ui_engine_clock(uint8_t tag, int16_t x, int16_t y, uint16_t radius, time_t time);
void                ui_engine_gauge(uint8_t tag, int16_t x, int16_t y, uint16_t radius, uint16_t value, uint16_t range);
void                ui_engine_toggle(uint8_t tag, int16_t x, int16_t y, uint16_t width, ui_engine_font_t font, bool state, const char * l_off, const char * l_on);


#endif
