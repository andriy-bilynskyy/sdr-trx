/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    FT813 graphical engine definitions header file
    https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT81x.pdf
*/

#ifndef __FT813_GRAPH_H
#define __FT813_GRAPH_H


/* FT8xx graphics engine specific macros useful for static display list generation */
#define ALPHA_FUNC(func,ref)                            ((9UL<<24)|(((func)&7UL)<<8)|(((ref)&255UL)<<0))
#define BEGIN(prim)                                     ((31UL<<24)|(((prim)&15UL)<<0))
#define BITMAP_HANDLE(handle)                           ((5UL<<24)|(((handle)&31UL)<<0))
#define BITMAP_SOURCE(addr)                             ((1UL<<24)|(((addr)&1048575UL)<<0))
#define BITMAP_LAYOUT(format,linestride,height)         ((7UL<<24)|(((format)&31UL)<<19)|(((linestride)&1023UL)<<9)|(((height)&511UL)<<0))
#define BITMAP_SIZE(filter,wrapx,wrapy,width,height)    ((8UL<<24)|(((filter)&1UL)<<20)|(((wrapx)&1UL)<<19)|(((wrapy)&1UL)<<18)|(((width)&511UL)<<9)|(((height)&511UL)<<0))
#define BITMAP_TRANSFORM_A(a)                           ((21UL<<24)|(((a)&131071UL)<<0))
#define BITMAP_TRANSFORM_B(b)                           ((22UL<<24)|(((b)&131071UL)<<0))
#define BITMAP_TRANSFORM_C(c)                           ((23UL<<24)|(((c)&16777215UL)<<0))
#define BITMAP_TRANSFORM_D(d)                           ((24UL<<24)|(((d)&131071UL)<<0))
#define BITMAP_TRANSFORM_E(e)                           ((25UL<<24)|(((e)&131071UL)<<0))
#define BITMAP_TRANSFORM_F(f)                           ((26UL<<24)|(((f)&16777215UL)<<0))
#define BLEND_FUNC(src,dst)                             ((11UL<<24)|(((src)&7UL)<<3)|(((dst)&7UL)<<0))
#define CALL(dest)                                      ((29UL<<24)|(((dest)&65535UL)<<0))
#define CELL(cell)                                      ((6UL<<24)|(((cell)&127UL)<<0))
#define CLEAR(c,s,t)                                    ((38UL<<24)|(((c)&1UL)<<2)|(((s)&1UL)<<1)|(((t)&1UL)<<0))
#define CLEAR_COLOR_A(alpha)                            ((15UL<<24)|(((alpha)&255UL)<<0))
#define CLEAR_COLOR_RGB(red,green,blue)                 ((2UL<<24)|(((red)&255UL)<<16)|(((green)&255UL)<<8)|(((blue)&255UL)<<0))
#define CLEAR_STENCIL(s)                                ((17UL<<24)|(((s)&255UL)<<0))
#define CLEAR_TAG(s)                                    ((18UL<<24)|(((s)&255UL)<<0))
#define COLOR_A(alpha)                                  ((16UL<<24)|(((alpha)&255UL)<<0))
#define COLOR_MASK(r,g,b,a)                             ((32UL<<24)|(((r)&1UL)<<3)|(((g)&1UL)<<2)|(((b)&1UL)<<1)|(((a)&1UL)<<0))
#define COLOR_RGB(red,green,blue)                       ((4UL<<24)|(((red)&255UL)<<16)|(((green)&255UL)<<8)|(((blue)&255UL)<<0))
#define DISPLAY()                                       ((0UL<<24))
#define END()                                           ((33UL<<24))
#define JUMP(dest)                                      ((30UL<<24)|(((dest)&65535UL)<<0))
#define LINE_WIDTH(width)                               ((14UL<<24)|(((width)&4095UL)<<0))
#define MACRO(m)                                        ((37UL<<24)|(((m)&1UL)<<0))
#define POINT_SIZE(size)                                ((13UL<<24)|(((size)&8191UL)<<0))
#define RESTORE_CONTEXT()                               ((35UL<<24))
#define RETURN()                                        ((36UL<<24))
#define SAVE_CONTEXT()                                  ((34UL<<24))
#define STENCIL_FUNC(func,ref,mask)                     ((10UL<<24)|(((func)&7UL)<<16)|(((ref)&255UL)<<8)|(((mask)&255UL)<<0))
#define STENCIL_MASK(mask)                              ((19UL<<24)|(((mask)&255UL)<<0))
#define STENCIL_OP(sfail,spass)                         ((12UL<<24)|(((sfail)&7UL)<<3)|(((spass)&7UL)<<0))
#define TAG(s)                                          ((3UL<<24)|(((s)&255UL)<<0))
#define TAG_MASK(mask)                                  ((20UL<<24)|(((mask)&1UL)<<0))
#define VERTEX2F(x,y)                                   ((1UL<<30)|(((x)&32767UL)<<15)|(((y)&32767UL)<<0))
#define VERTEX2II(x,y,handle,cell)                      ((2UL<<30)|(((x)&511UL)<<21)|(((y)&511UL)<<12)|(((handle)&31UL)<<7)|(((cell)&127UL)<<0))

/* Graphics display list swap defines */
#define DLSWAP_DONE             0UL
#define DLSWAP_LINE             1UL
#define DLSWAP_FRAME            2UL

/* Graphics primitives */
#define BITMAPS                 1UL
#define POINTS                  2UL
#define LINES                   3UL
#define LINE_STRIP              4UL
#define EDGE_STRIP_R            5UL
#define EDGE_STRIP_L            6UL
#define EDGE_STRIP_A            7UL
#define EDGE_STRIP_B            8UL
#define RECTS                   9UL

/* commands common */
#define CMD_APPEND              0xFFFFFF1EUL
#define CMD_SETBASE             0xffffff38UL
#define CMD_BGCOLOR             0xFFFFFF09UL
#define CMD_BUTTON              0xFFFFFF0DUL
#define CMD_CALIBRATE           0xFFFFFF15UL
#define CMD_CLOCK               0xFFFFFF14UL
#define CMD_COLDSTART           0xFFFFFF32UL
#define CMD_DIAL                0xFFFFFF2DUL
#define CMD_DLSTART             0xFFFFFF00UL
#define CMD_FGCOLOR             0xFFFFFF0AUL
#define CMD_GAUGE               0xFFFFFF13UL
#define CMD_GETMATRIX           0xFFFFFF33UL
#define CMD_GETPROPS            0xFFFFFF25UL
#define CMD_GETPTR              0xFFFFFF23UL
#define CMD_GRADCOLOR           0xFFFFFF34UL
#define CMD_GRADIENT            0xFFFFFF0BUL
#define CMD_INFLATE             0xFFFFFF22UL
#define CMD_INTERRUPT           0xFFFFFF02UL
#define CMD_KEYS                0xFFFFFF0EUL
#define CMD_LOADIDENTITY        0xFFFFFF26UL
#define CMD_LOADIMAGE           0xFFFFFF24UL
#define CMD_LOGO                0xFFFFFF31UL
#define CMD_MEMCPY              0xFFFFFF1DUL
#define CMD_MEMCRC              0xFFFFFF18UL
#define CMD_MEMSET              0xFFFFFF1BUL
#define CMD_MEMWRITE            0xFFFFFF1AUL
#define CMD_MEMZERO             0xFFFFFF1CUL
#define CMD_NUMBER              0xFFFFFF2EUL
#define CMD_PROGRESS            0xFFFFFF0FUL
#define CMD_REGREAD             0xFFFFFF19UL
#define CMD_ROTATE              0xFFFFFF29UL
#define CMD_SCALE               0xFFFFFF28UL
#define CMD_SCREENSAVER         0xFFFFFF2FUL
#define CMD_SCROLLBAR           0xFFFFFF11UL
#define CMD_SETFONT             0xFFFFFF2BUL
#define CMD_SETMATRIX           0xFFFFFF2AUL
#define CMD_SKETCH              0xFFFFFF30UL
#define CMD_SLIDER              0xFFFFFF10UL
#define CMD_SNAPSHOT            0xFFFFFF1FUL
#define CMD_SPINNER             0xFFFFFF16UL
#define CMD_STOP                0xFFFFFF17UL
#define CMD_SWAP                0xFFFFFF01UL
#define CMD_TEXT                0xFFFFFF0CUL
#define CMD_TOGGLE              0xFFFFFF12UL
#define CMD_TRACK               0xFFFFFF2CUL
#define CMD_TRANSLATE           0xFFFFFF27UL

/* Widget options */
#define OPT_MONO                1UL
#define OPT_NODL                2UL
#define OPT_FLAT                256UL
#define OPT_CENTERX             512UL
#define OPT_CENTERY             1024UL
#define OPT_CENTER              (OPT_CENTERX | OPT_CENTERY)
#define OPT_NOBACK              4096UL
#define OPT_NOTICKS             8192UL
#define OPT_NOHM                16384UL
#define OPT_NOPOINTER           16384UL
#define OPT_NOSECS              32768UL
#define OPT_NOHANDS             49152UL
#define OPT_RIGHTX              2048UL
#define OPT_SIGNED              256UL

/* Bitmap formats */
#define BFMT_ARGB1555           0UL
#define BFMT_L1                 1UL
#define BFMT_L4                 2UL
#define BFMT_L8                 3UL
#define BFMT_RGB332             4UL
#define BFMT_ARGB2              5UL
#define BFMT_ARGB4              6UL
#define BFMT_RGB565             7UL
#define BFMT_TEXT8X8            9UL
#define BFMT_TEXTVGA            10UL
#define BFMT_BARGRAPH           11UL
#define BFMT_PALETTED565        14UL
#define BFMT_PALETTED444        15UL
#define BFMT_PALETTED8          16UL
#define BFMT_L2                 17UL


#endif
