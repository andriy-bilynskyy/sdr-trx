/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    SI5351 CMOS clock generator definitions header file
    https://www.silabs.com/documents/public/data-sheets/Si5351-B.pdf
    https://www.silabs.com/documents/public/application-notes/AN619.pdf
*/


#ifndef __SI5351_DEF_H
#define __SI5351_DEF_H

/* I2C address */
#define SI5351_I2C_ADDR                     0x60
/* Desired PLL frequency */
#define SI5351_PLL_FREQUENCY                800000000UL
/* SI5351 values ranges */
#define SI5351_PLL_MIN                      15UL
#define SI5351_PLL_MAX                      90UL
#define SI5351_MULTISYNTH_MIN               8UL
#define SI5351_MULTISYNTH_MAX               2048UL
#define SI5351_MULTISYNTH_INT_MIN           6UL
#define SI5351_MULTISYNTH_INT_MAX           254UL
#define SI5351_MULTISYNTH_RDIV_MAX          128UL
#define SI5351_FLOAT_MAX                    1048575UL

/*******************************************************************************
 * SI5351 registers
 ******************************************************************************/

#define SI5351_DEVICE_STATUS                0
#define SI5351_DEVICE_STATUS_SYS_INIT       (1<<7)
#define SI5351_DEVICE_STATUS_LOL_B          (1<<6)
#define SI5351_DEVICE_STATUS_LOL_A          (1<<5)
#define SI5351_DEVICE_STATUS_LOS_CLKIN      (1<<4)
#define SI5351_DEVICE_STATUS_LOS_XTAL       (1<<3)
#define SI5351_DEVICE_STATUS_REVID          0x03

#define SI5351_INTERRUPT_STATUS             1
#define SI5351_INTERRUPT_STATUS_SYS_INIT    (1<<7)
#define SI5351_INTERRUPT_STATUS_LOL_B       (1<<6)
#define SI5351_INTERRUPT_STATUS_LOL_A       (1<<5)
#define SI5351_INTERRUPT_STATUS_LOS_CLKIN   (1<<4)
#define SI5351_INTERRUPT_STATUS_LOS_XTAL    (1<<3)

#define SI5351_INTERRUPT_MASK               2
#define SI5351_INTERRUPT_MASK_SYS_INIT      (1<<7)
#define SI5351_INTERRUPT_MASK_LOL_B         (1<<6)
#define SI5351_INTERRUPT_MASK_LOL_A         (1<<5)
#define SI5351_INTERRUPT_MASK_LOS_CLKIN     (1<<4)
#define SI5351_INTERRUPT_MASK_LOS_XTAL      (1<<3)

#define SI5351_OUTPUT_ENABLE_CTRL           3
#define SI5351_OUTPUT_ENABLE_CTRL_CLK7      (1<<7)
#define SI5351_OUTPUT_ENABLE_CTRL_CLK6      (1<<6)
#define SI5351_OUTPUT_ENABLE_CTRL_CLK5      (1<<5)
#define SI5351_OUTPUT_ENABLE_CTRL_CLK4      (1<<4)
#define SI5351_OUTPUT_ENABLE_CTRL_CLK3      (1<<3)
#define SI5351_OUTPUT_ENABLE_CTRL_CLK2      (1<<2)
#define SI5351_OUTPUT_ENABLE_CTRL_CLK1      (1<<1)
#define SI5351_OUTPUT_ENABLE_CTRL_CLK0      (1<<0)


#define SI5351_PLL_INPUT_SOURCE             15
#define SI5351_PLL_INPUT_SOURCE_INDIV_MASK  (3<<6)
#define SI5351_PLL_INPUT_SOURCE_INDIV_1     (0<<6)
#define SI5351_PLL_INPUT_SOURCE_INDIV_2     (1<<6)
#define SI5351_PLL_INPUT_SOURCE_INDIV_4     (2<<6)
#define SI5351_PLL_INPUT_SOURCE_INDIV_8     (3<<6)
#define SI5351_PLL_INPUT_SOURCE_PLLB_MASK   (1<<3)
#define SI5351_PLL_INPUT_SOURCE_PLLB_XTAL   (0<<3)
#define SI5351_PLL_INPUT_SOURCE_PLLB_CLKIN  (1<<3)
#define SI5351_PLL_INPUT_SOURCE_PLLA_MASK   (1<<2)
#define SI5351_PLL_INPUT_SOURCE_PLLA_XTAL   (0<<2)
#define SI5351_PLL_INPUT_SOURCE_PLLA_CLKIN  (1<<2)

#define SI5351_PLL_INPUT_SRC                15
#define SI5351_PLL_INPUT_SRC_CLKIN_DIV      (3<<6)
#define SI5351_PLL_INPUT_SRC_CLKIN_DIV1     (0<<6)
#define SI5351_PLL_INPUT_SRC_CLKIN_DIV2     (1<<6)
#define SI5351_PLL_INPUT_SRC_CLKIN_DIV4     (2<<6)
#define SI5351_PLL_INPUT_SRC_CLKIN_DIV8     (3<<6)
#define SI5351_PLL_INPUT_SRC_PLLB_SRC       (1<<3)
#define SI5351_PLL_INPUT_SRC_PLLB_SRC_XTAL  (0<<3)
#define SI5351_PLL_INPUT_SRC_PLLB_SRC_CLKIN (1<<3)
#define SI5351_PLL_INPUT_SRC_PLLA_SRC       (1<<2)
#define SI5351_PLL_INPUT_SRC_PLLA_SRC_XTAL  (0<<2)
#define SI5351_PLL_INPUT_SRC_PLLA_SRC_CLKIN (1<<2)

#define SI5351_CLK0_CTRL                    16
#define SI5351_CLK1_CTRL                    17
#define SI5351_CLK2_CTRL                    18
#define SI5351_CLK3_CTRL                    19
#define SI5351_CLK4_CTRL                    20
#define SI5351_CLK5_CTRL                    21
#define SI5351_CLK6_CTRL                    22
#define SI5351_CLK7_CTRL                    23
#define SI5351_CLK_CTRL_PDN                 (1<<7)
#define SI5351_CLK_CTRL_MS0_INT             (1<<6)
#define SI5351_CLK_CTRL_MS0_SRC             (1<<5)
#define SI5351_CLK_CTRL_MS0_SRC_PLLA        (0<<5)
#define SI5351_CLK_CTRL_MS0_SRC_PLLB        (1<<5)
#define SI5351_CLK_CTRL_CLK_INV             (1<<4)
#define SI5351_CLK_CTRL_CLK_SRC             (3<<2)
#define SI5351_CLK_CTRL_CLK_SRC_XTAL        (0<<2)
#define SI5351_CLK_CTRL_CLK_SRC_CLKIN       (1<<2)
#define SI5351_CLK_CTRL_CLK_SRC_MS          (3<<2)
#define SI5351_CLK_CTRL_CLK_IDRV            (3<<0)
#define SI5351_CLK_CTRL_CLK_IDRV_2MA        (0<<0)
#define SI5351_CLK_CTRL_CLK_IDRV_4MA        (1<<0)
#define SI5351_CLK_CTRL_CLK_IDRV_6MA        (2<<0)
#define SI5351_CLK_CTRL_CLK_IDRV_8MA        (3<<0)

#define SI5351_PLLA_PARAMETERS              26
#define SI5351_PLLB_PARAMETERS              34

#define SI5351_MS0_PARAMETERS               42
#define SI5351_MS1_PARAMETERS               50
#define SI5351_MS2_PARAMETERS               58
#define SI5351_MS3_PARAMETERS               66
#define SI5351_MS4_PARAMETERS               74
#define SI5351_MS5_PARAMETERS               82
#define SI5351_MS6_PARAMETERS               90
#define SI5351_MS7_PARAMETERS               91

#define SI5351_CLK6_7_OUTPUT_DIV            92
#define SI5351_CLK6_7_OUTPUT_DIV7          (7<<4)
#define SI5351_CLK6_7_OUTPUT_DIV7_1        (0<<4)
#define SI5351_CLK6_7_OUTPUT_DIV7_2        (1<<4)
#define SI5351_CLK6_7_OUTPUT_DIV7_4        (2<<4)
#define SI5351_CLK6_7_OUTPUT_DIV7_8        (3<<4)
#define SI5351_CLK6_7_OUTPUT_DIV7_16       (4<<4)
#define SI5351_CLK6_7_OUTPUT_DIV7_32       (5<<4)
#define SI5351_CLK6_7_OUTPUT_DIV7_64       (6<<4)
#define SI5351_CLK6_7_OUTPUT_DIV7_128      (7<<4)
#define SI5351_CLK6_7_OUTPUT_DIV6          (7<<0)
#define SI5351_CLK6_7_OUTPUT_DIV6_1        (0<<0)
#define SI5351_CLK6_7_OUTPUT_DIV6_2        (1<<0)
#define SI5351_CLK6_7_OUTPUT_DIV6_4        (2<<0)
#define SI5351_CLK6_7_OUTPUT_DIV6_8        (3<<0)
#define SI5351_CLK6_7_OUTPUT_DIV6_16       (4<<0)
#define SI5351_CLK6_7_OUTPUT_DIV6_32       (5<<0)
#define SI5351_CLK6_7_OUTPUT_DIV6_64       (6<<0)
#define SI5351_CLK6_7_OUTPUT_DIV6_128      (7<<0)

#define SI5351_PLL_RESET                   177
#define SI5351_PLL_RESET_B                 (1<<7)
#define SI5351_PLL_RESET_A                 (1<<5)

#define SI5351_CRYSTAL_LOAD                183
#define SI5351_CRYSTAL_LOAD_MASK           (3<<6)
#define SI5351_CRYSTAL_LOAD_0PF            (0<<6)
#define SI5351_CRYSTAL_LOAD_6PF            (1<<6)
#define SI5351_CRYSTAL_LOAD_8PF            (2<<6)
#define SI5351_CRYSTAL_LOAD_10PF           (3<<6)

#define SI5351_FANOUT_ENABLE               187
#define SI5351_FANOUT_ENABLE_CLKIN         (1<<7)
#define SI5351_FANOUT_ENABLE_XO            (1<<6)
#define SI5351_FANOUT_ENABLE_MS            (1<<4)


#endif
