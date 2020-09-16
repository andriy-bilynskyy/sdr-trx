/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    FT813 definitions header file
    https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT81x.pdf
*/

#ifndef __FT813_DEF_H
#define __FT818_DEF_H

/* Common variables */
#define REG_CHIP_ID_VALUE           0x7C     /* data read from REG_ID RO */
#define REG_SPI_WIDTH_VALUE_1X      0UL
#define REG_SPI_WIDTH_VALUE_2X      1UL
#define REG_SPI_WIDTH_VALUE_4X      2UL


/* Host commands */
#define CMD_ACTIVE                  0x00U    /* place FT8xx in active state */
#define CMD_STANDBY                 0x41U    /* place FT8xx in Standby (clk running) */
#define CMD_SLEEP                   0x42U    /* place FT8xx in Sleep (clk off) */
#define CMD_PWRDOWN                 0x43U    /* place FT8xx in Power Down (core off) */
#define CMD_PD_ROMS                 0x49U    /* select power down individual ROMs */
#define CMD_CLKEXT                  0x44U    /* select external clock source */
#define CMD_CLKINT                  0x48U    /* select internal clock source */
#define CMD_CLKSEL                  0x61U    /* setup PLL. This command will only be effective when the PLL is stopped (SLEEP mode).*/
#define CMD_RST_PULSE               0x68U    /* reset core - all registers default and processors reset */
#define CMD_PINDRIVE                0x70U    /* set the drive strength for various pins */
#define CMD_PIN_PD_STATE            0x71U    /* during power down, all output and in/out pins will not be driven */


/* Memory Map */
#define RAM_G                       0x000000UL
#define ROM_CHIPID                  0x0C0000UL
#define ROM_FONT                    0x1E0000UL
#define ROM_FONT_ADDR               0x2FFFFCUL
#define RAM_DL                      0x300000UL
#define RAM_REG                     0x302000UL
#define RAM_CMD                     0x308000UL

#define RAM_G_SIZE                  (1024*1024UL)
#define ROM_CHIPID_SIZE             4UL
#define ROM_FONT_SIZE               (1152*1024UL)
#define ROM_FONT_ADDR_SIZE          4UL
#define RAM_DL_SIZE                 (8*1024UL)
#define RAM_REG_SIZE                (4*1024UL)
#define RAM_CMD_SIZE                (4*1024UL)


/* Register definitions */
#define REG_ID                      0x302000UL  /* 8 r/o 7Ch Identification register, always reads as 7Ch */
#define REG_FRAMES                  0x302004UL  /* 32 r/o 0 Frame counter, since reset */
#define REG_CLOCK                   0x302008UL  /* 32 r/o 0 Clock cycles, since reset */
#define REG_FREQUENCY               0x30200CUL  /* 28 r/w 60000000 Main clock frequency (Hz) */
#define REG_RENDERMODE              0x302010UL  /* 1 r/w 0 Rendering mode: 0 = normal, 1 = single-line */
#define REG_SNAPY                   0x302014UL  /* 11 r/w 0 Scanline select for RENDERMODE 1 */
#define REG_SNAPSHOT                0x302018UL  /* 1 r/w - Trigger for RENDERMODE 1 */
#define REG_SNAPFORMAT              0x30201CUL  /* 6 r/w 20h Pixel format for scanline readout */
#define REG_CPURESET                0x302020UL  /* 3 r/w 2 Graphics, audio and touch engines reset control. Bit2: audio, bit1: touch, bit0: graphics */
#define REG_TAP_CRC                 0x302024UL  /* 32 r/o - Live video tap crc. Frame CRC is computed every DL SWAP. */
#define REG_TAP_MASK                0x302028UL  /* 32 r/w FFFFFFFFh Live video tap mask */
#define REG_HCYCLE                  0x30202CUL  /* 12 r/w 224h Horizontal total cycle count */
#define REG_HOFFSET                 0x302030UL  /* 12 r/w 02Bh Horizontal display start offset */
#define REG_HSIZE                   0x302034UL  /* 12 r/w 1E0h Horizontal display pixel count */
#define REG_HSYNC0                  0x302038UL  /* 12 r/w 000h Horizontal sync fall offset */
#define REG_HSYNC1                  0x30203CUL  /* 12 r/w 029h Horizontal sync rise offset */
#define REG_VCYCLE                  0x302040UL  /* 12 r/w 124h Vertical total cycle count */
#define REG_VOFFSET                 0x302044UL  /* 12 r/w 00Ch Vertical display start offset */
#define REG_VSIZE                   0x302048UL  /* 12 r/w 110h Vertical display line count */
#define REG_VSYNC0                  0x30204CUL  /* 10 r/w 000h Vertical sync fall offset */
#define REG_VSYNC1                  0x302050UL  /* 10 r/w 00Ah Vertical sync rise offset */
#define REG_DLSWAP                  0x302054UL  /* 2 r/w 0 Display list swap control */
#define REG_ROTATE                  0x302058UL  /* 3 r/w 0 Screen rotation control. Allow normal/mirrored/inverted for landscape or portrait orientation. */
#define REG_OUTBITS                 0x30205CUL  /* 9 r/w 1B6h/000h Output bit resolution, 3 bits each for R/G/B. Default is 6/6/6 bits (0b’000 means 8 bits) */
#define REG_DITHER                  0x302060UL  /* 1 r/w 1 Output dither enable */
#define REG_SWIZZLE                 0x302064UL  /* 4 r/w 0 Output RGB signal swizzle */
#define REG_CSPREAD                 0x302068UL  /* 1 r/w 1 Output clock spreading enable */
#define REG_PCLK_POL                0x30206CUL  /* 1 r/w 0 PCLK polarity: 0 = output on PCLK rising edge, 1 = output on PCLK falling edge */
#define REG_PCLK                    0x302070UL  /* 8 r/w 0 PCLK frequency divider, 0 = disable */
#define REG_TAG_X                   0x302074UL  /* 11 r/w 0 Tag query X coordinate */
#define REG_TAG_Y                   0x302078UL  /* 11 r/w 0 Tag query Y coordinate */
#define REG_TAG                     0x30207CUL  /* 8 r/o 0 Tag query result */
#define REG_VOL_PB                  0x302080UL  /* 8 r/w FFh Volume for playback */
#define REG_VOL_SOUND               0x302084UL  /* 8 r/w FFh Volume for synthesizer sound */
#define REG_SOUND                   0x302088UL  /* 16 r/w 0 Sound effect select */
#define REG_PLAY                    0x30208CUL  /* 1 r/w 0h Start effect playback */
#define REG_GPIO_DIR                0x302090UL  /* 8 r/w 80h Legacy GPIO pin direction, 0 = input, 1 = output */
#define REG_GPIO                    0x302094UL  /* 8 r/w 00h Legacy GPIO read/write */
#define REG_GPIOX_DIR               0x302098UL  /* 16 r/w 8000h Extended GPIO pin direction, 0 = input, 1 = output */
#define REG_GPIOX                   0x30209CUL  /* 16 r/w 0080h Extended GPIO read/write */
#define REG_INT_FLAGS               0x3020A8UL  /* 8 r/o 00h Interrupt flags, clear by read */
#define REG_INT_EN                  0x3020ACUL  /* 1 r/w 0 Global interrupt enable, 1=enable */
#define REG_INT_MASK                0x3020B0UL  /* 8 r/w FFh Individual interrupt enable, 1=enable */
#define REG_PLAYBACK_START          0x3020B4UL  /* 20 r/w 0 Audio playback RAM start address */
#define REG_PLAYBACK_LENGTH         0x3020B8UL  /* 20 r/w 0 Audio playback sample length (bytes) */
#define REG_PLAYBACK_READPTR        0x3020BCUL  /* 20 r/o - Audio playback current read pointer */
#define REG_PLAYBACK_FREQ           0x3020C0UL  /* 16 r/w 8000 Audio playback sampling frequency (Hz) */
#define REG_PLAYBACK_FORMAT         0x3020C4UL  /* 2 r/w 0 Audio playback format */
#define REG_PLAYBACK_LOOP           0x3020C8UL  /* 1 r/w 0 Audio playback loop enable */
#define REG_PLAYBACK_PLAY           0x3020CCUL  /* 1 r/w 0 Start audio playback */
#define REG_PWM_HZ                  0x3020D0UL  /* 14 r/w 250 BACKLIGHT PWM output frequency (Hz) */
#define REG_PWM_DUTY                0x3020D4UL  /* 8 r/w 128 BACKLIGHT PWM output duty cycle 0=0%, 128=100% */
#define REG_MACRO_0                 0x3020D8UL  /* 32 r/w 0 Display list macro command 0 */
#define REG_MACRO_1                 0x3020DCUL  /* 32 r/w 0 Display list macro command 1 */
#define REG_CMD_READ                0x3020F8UL  /* 12 r/w 0 Command buffer read pointer */
#define REG_CMD_WRITE               0x3020FCUL  /* 12 r/o 0 Command buffer write pointer */
#define REG_CMD_DL                  0x302100UL  /* 13 r/w 0 Command display list offset */
#define REG_TOUCH_MODE              0x302104UL  /* 2 r/w 3 Touch-screen sampling mode */
#define REG_TOUCH_ADC_MODE          0x302108UL  /* 1 r/w 1 Set Touch ADC mode Set capacitive touch operation mode: 0: extended mode (multi-touch), 1: FT800 compatibility mode (single touch). */
#define REG_CTOUCH_EXTENDED         0x302108UL  /* 1 r/w 1 Set Touch ADC mode Set capacitive touch operation mode: 0: extended mode (multi-touch), 1: FT800 compatibility mode (single touch). */
#define REG_TOUCH_CHARGE            0x30210CUL  /* 16 r/w 9000 Touch charge time, units of 6 clocks */
#define REG_TOUCH_SETTLE            0x302110UL  /* 4 r/w 3 Touch settle time, units of 6 clocks */
#define REG_TOUCH_OVERSAMPLE        0x302114UL  /* 4 r/w 7 Touch oversample factor */
#define REG_TOUCH_RZTHRESH          0x302118UL  /* 16 r/w FFFFh Touch resistance threshold */
#define REG_TOUCH_RAW_XY            0x30211CUL  /* 32 r/o - Compatibility mode: touch-screen raw (x-MSB16; y-LSB16) Extended mode: touch-screen screen data for touch 1 (x-MSB16; y-LSB16) */
#define REG_CTOUCH_TOUCH1_XY        0x30211CUL  /* 32 r/o - Compatibility mode: touch-screen raw (x-MSB16; y-LSB16) Extended mode: touch-screen screen data for touch 1 (x-MSB16; y-LSB16) */
#define REG_TOUCH_RZ                0x302120UL  /* 16 r/o - Compatibility mode: touch-screen resistance Extended mode: touch-screen screen Y data for touch 4 */
#define REG_CTOUCH_TOUCH4_Y         0x302120UL  /* 16 r/o - Compatibility mode: touch-screen resistance Extended mode: touch-screen screen Y data for touch 4 */
#define REG_TOUCH_SCREEN_XY         0x302124UL  /* 32 r/o - Compatibility mode: touch-screen screen (x-MSB16; y-LSB16) Extended mode: touch-screen screen data for touch 0 (x-MSB16; y-LSB16) */
#define REG_CTOUCH_TOUCH0_XY        0x302124UL  /* 32 r/o - Compatibility mode: touch-screen screen (x-MSB16; y-LSB16) Extended mode: touch-screen screen data for touch 0 (x-MSB16; y-LSB16) */
#define REG_TOUCH_TAG_XY            0x302128UL  /* 32 r/o - Touch-screen screen (x-MSB16; yLSB16) used for tag 0 lookup */
#define REG_TOUCH_TAG               0x30212CUL  /* 8 r/o - Touch-screen tag result 0 */
#define REG_TOUCH_TAG1_XY           0x302130UL  /* 32 r/o - Touch-screen screen (x-MSB16; yLSB16) used for tag 1 lookup */
#define REG_TOUCH_TAG1              0x302134UL  /* 8 r/o - Touch-screen tag result 1 */
#define REG_TOUCH_TAG2_XY           0x302138UL  /* 32 r/o - Touch-screen screen (x-MSB16; yLSB16) used for tag 2 lookup */
#define REG_TOUCH_TAG2              0x30213CUL  /* 8 r/o - Touch-screen tag result 2 */
#define REG_TOUCH_TAG3_XY           0x302140UL  /* 32 r/o - Touch-screen screen (x-MSB16; yLSB16) used for tag 3 lookup */
#define REG_TOUCH_TAG3              0x302144UL  /* 8 r/o - Touch-screen tag result 3 */
#define REG_TOUCH_TAG4_XY           0x302148UL  /* 32 r/o - Touch-screen screen (x-MSB16; yLSB16) used for tag 4 lookup */
#define REG_TOUCH_TAG4              0x30214CUL  /* 8 r/o - Touch-screen tag result 4 */
#define REG_TOUCH_TRANSFORM_A       0x302150UL  /* 32 r/w 00010000h Touch-screen transform coefficient (s15.16) */
#define REG_TOUCH_TRANSFORM_B       0x302154UL  /* 32 r/w 00000000h Touch-screen transform coefficient (s15.16) */
#define REG_TOUCH_TRANSFORM_C       0x302158UL  /* 32 r/w 00000000h Touch-screen transform coefficient (s15.16) */
#define REG_TOUCH_TRANSFORM_D       0x30215CUL  /* 32 r/w 00000000h Touch-screen transform coefficient (s15.16) */
#define REG_TOUCH_TRANSFORM_E       0x302160UL  /* 32 r/w 00010000h Touch-screen transform coefficient (s15.16) */
#define REG_TOUCH_TRANSFORM_F       0x302164UL  /* 32 r/w 00000000h Touch-screen transform coefficient (s15.16) */
#define REG_TOUCH_CONFIG            0x302168UL  /* 16 r/w 0381h Touch configuration. RTP/CTP select, RTP: short-circuit, sample clocks CTP: I2C address, CTPM type, lowpower mode */
#define REG_CTOUCH_TOUCH4_X         0x30216CUL  /* 16 r/o - Extended mode: touch-screen screen X data for touch 4 */
#define REG_BIST_EN                 0x302174UL  /* 1 r/w 0 BIST memory mapping enable */
#define REG_TRIM                    0x302180UL  /* 8 r/w 0 Internal relaxation clock trimming */
#define REG_ANA_COMP                0x302184UL  /* 8 r/w 0 Analogue control register */
#define REG_SPI_WIDTH               0x302188UL  /* 3 r/w 0 QSPI bus width setting Bit [2]: extra dummy cycle on read Bit [1:0]: bus width (0=1-bit, 1=2-bit, 2=4-bit) */
#define REG_TOUCH_DIRECT_XY         0x30218CUL  /* 32 r/o - Compatibility mode: Touch screen direct (x-MSB16; y-LSB16) conversions Extended mode: touch-screen screen data for touch 2 (x-MSB16; y-LSB16) */
#define REG_CTOUCH_TOUCH2_XY        0x30218CUL  /* 32 r/o - Compatibility mode: Touch screen direct (x-MSB16; y-LSB16) conversions Extended mode: touch-screen screen data for touch 2 (x-MSB16; y-LSB16) */
#define REG_TOUCH_DIRECT_Z1Z2       0x302190UL  /* 32 r/o - Compatibility mode: Touch screen direct (z1-MSB16; z2-LSB16) conversions Extended mode: touch-screen screen data for touch 3 (x-MSB16; y-LSB16) */
#define REG_CTOUCH_TOUCH3_XY        0x302190UL  /* 32 r/o - Compatibility mode: Touch screen direct (z1-MSB16; z2-LSB16) conversions Extended mode: touch-screen screen data for touch 3 (x-MSB16; y-LSB16) */
#define REG_DATESTAMP               0x302564UL  /* 128 r/o - Stamp date code */
#define REG_CMDB_SPACE              0x302574UL  /* 12 r/w FFCh Command DL (bulk) space available */
#define REG_CMDB_WRITE              0x302578UL  /* 32 w/o 0 Command DL (bulk) write */
#define REG_TRACKER                 0x309000UL  /* 32 r/0 - Touch track object */
#define REG_TRACKER_1               0x309004UL  /* 32 r/0 - Touch track object */
#define REG_TRACKER_2               0x309008UL  /* 32 r/0 - Touch track object */
#define REG_TRACKER_3               0x30900cUL  /* 32 r/0 - Touch track object */
#define REG_TRACKER_4               0x309010UL  /* 32 r/0 - Touch track object */


/* Interrupt flags definitions */
#define INT_CONVCOMPLETE            0x80U       /* Touch-screen conversions completed */
#define INT_CMDFLAG                 0x40U       /* Command FIFO flag */
#define INT_CMDEMPTY                0x20U       /* Command FIFO empty */
#define INT_PLAYBACK                0x10U       /* Audio playback ended */
#define INT_SOUND                   0x08U       /* Sound effect ended */
#define INT_TAG                     0x04U       /* Touch-screen tag value change */
#define INT_TOUCH                   0x02U       /* Touch detected */
#define INT_SWAP                    0x01U       /* Display list swap occurred */


#endif
