/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Critical errors source file
*/


#include "critical_err.h"
#include "stm32f4xx_conf.h"
#include "hwctl.h"
#include "ui_engine.h"
#include "debug.h"
#include "misc_func.h"


/*******************************************************************************
** Variables from linker script
*******************************************************************************/
extern uint32_t _stack_end_marker_start, _stack_end_marker_end;


#define CRITICAL_ERR_STACK_END_MARKER   0xA5A5A5A5UL


typedef enum {
    CRITICAL_ERR_NONE = 0,
    CRITICAL_ERR_HARD_FAULT,
    CRITICAL_ERR_UNHANDLED_INT,
    CRITICAL_ERR_CLOCK,
    CRITICAL_ERR_ASSERT,
    CRITICAL_ERR_STACK_OVERFLOWED
} critical_err_t;


static volatile struct {

    critical_err_t type;

    uint32_t       r0;
    uint32_t       r1;
    uint32_t       r2;
    uint32_t       r3;
    uint32_t       r12;
    uint32_t       lr;
    uint32_t       pc;
    uint32_t       psr;

    uint32_t       ipsr;
    const char *   file;
    uint32_t       line;

} critical_err_data                         __attribute__(( section(".crash_data") ));

static volatile uint32_t critical_err_crc   __attribute__(( section(".crash_data") ));


static void critical_err_widget_default(void);
static void critical_err_widget_hardfault(void);
static void critical_err_widget_unhandledint(void);
static void critical_err_widget_hsefail(void);
#ifdef USE_FULL_ASSERT
static void critical_err_widget_assert(void);
#endif
static void critical_err_widget_stackoverflowed(void);


/* Early boot check if fault happened */
void critical_err_mode(void) {

    DBG_INIT();
    DBG_OUT("start");

    if(FLASH_OB_GetBOR() != OB_BOR_LEVEL3) {
        DBG_OUT("wrong BOR level. updating...");
        FLASH_OB_Unlock();
        FLASH_OB_BORConfig(OB_BOR_LEVEL3);
        if(FLASH_OB_Launch() == FLASH_COMPLETE) {
            DBG_OUT("done");
        } else {
            DBG_OUT("error");
        }
        FLASH_OB_Lock();
    }

    for(uint32_t *p = &_stack_end_marker_start; p < &_stack_end_marker_end; p++) {
        *p = CRITICAL_ERR_STACK_END_MARKER;
    }

    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC, ENABLE);
    CRC_ResetDR();
    uint32_t crc = CRC_CalcBlockCRC((uint32_t *)&critical_err_data, sizeof(critical_err_data) / sizeof(uint32_t));

    if(critical_err_data.type == CRITICAL_ERR_NONE || crc != critical_err_crc) {
        RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC, DISABLE);
        return;
    }

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1 | RCC_AHB1Periph_DMA2, ENABLE);
    RCC_AHB1PeriphClockCmd( RCC_AHB1Periph_GPIOA |
                            RCC_AHB1Periph_GPIOB |
                            RCC_AHB1Periph_GPIOC |
                            RCC_AHB1Periph_GPIOD, ENABLE);

    hwctl_start();
    hwctl_bkl_power(true);
    if(ui_engine_start()) {

        switch(critical_err_data.type) {
        case CRITICAL_ERR_HARD_FAULT:
            critical_err_widget_hardfault();
            break;
        case CRITICAL_ERR_UNHANDLED_INT:
            critical_err_widget_unhandledint();
            break;
        case CRITICAL_ERR_CLOCK:
            critical_err_widget_hsefail();
            break;
#ifdef USE_FULL_ASSERT
        case CRITICAL_ERR_ASSERT:
            critical_err_widget_assert();
            break;
#endif
        case CRITICAL_ERR_STACK_OVERFLOWED:
            critical_err_widget_stackoverflowed();
            break;
        default:
            critical_err_widget_default();
            break;
        }
    }
    ui_engine_stop();
    hwctl_bkl_power(false);
    hwctl_stop();
    hwctl_stop();
    RCC_AHB1PeriphClockCmd( RCC_AHB1Periph_GPIOA |
                            RCC_AHB1Periph_GPIOB |
                            RCC_AHB1Periph_GPIOC |
                            RCC_AHB1Periph_GPIOD, DISABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1 | RCC_AHB1Periph_DMA2, DISABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, DISABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC, DISABLE);

    critical_err_data.type = CRITICAL_ERR_NONE;
    NVIC_SystemReset();
}

#ifdef USE_FULL_ASSERT
void assert_failed(const char * file, uint32_t line) {

    critical_err_data.type = CRITICAL_ERR_ASSERT;
    critical_err_data.line = line;
    critical_err_data.file = file;

    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC, ENABLE);
    CRC_ResetDR();
    critical_err_crc = CRC_CalcBlockCRC((uint32_t *)&critical_err_data, sizeof(critical_err_data) / sizeof(uint32_t));

#ifdef DEBUG
    DBG_OUT("assertion in %s:%04u", critical_err_data.file, (unsigned int)critical_err_data.line);
    for(;;);
#else
    NVIC_SystemReset();
#endif
}
#endif

void hard_fault_c(uint32_t stack[]) {
    critical_err_data.r0  = stack[0];
    critical_err_data.r1  = stack[1];
    critical_err_data.r2  = stack[2];
    critical_err_data.r3  = stack[3];
    critical_err_data.r12 = stack[4];
    critical_err_data.lr  = stack[5];
    critical_err_data.pc  = stack[6];
    critical_err_data.psr = stack[7];

    critical_err_data.type = CRITICAL_ERR_HARD_FAULT;

    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC, ENABLE);
    CRC_ResetDR();
    critical_err_crc = CRC_CalcBlockCRC((uint32_t *)&critical_err_data, sizeof(critical_err_data) / sizeof(uint32_t));

#ifdef DEBUG
    DBG_OUT("hard fault\n"
            "R0  = %08X\n"
            "R1  = %08X\n"
            "R2  = %08X\n"
            "R3  = %08X\n"
            "R12 = %08X\n"
            "LR  = %08X\n"
            "PC  = %08X\n"
            "PSR = %08X\n",
            (unsigned int)critical_err_data.r0, (unsigned int)critical_err_data.r1,
            (unsigned int)critical_err_data.r2, (unsigned int)critical_err_data.r3,
            (unsigned int)critical_err_data.r12, (unsigned int)critical_err_data.lr,
            (unsigned int)critical_err_data.pc, (unsigned int)critical_err_data.psr);
    for(;;);
#else
    NVIC_SystemReset();
#endif
}

__attribute__((naked))
void HardFault_Handler(void) {

    __asm volatile
    (
        " tst lr, #4        \n"
        " ite eq            \n"
        " mrseq r0, msp     \n"
        " mrsne r0, psp     \n"
        " bl hard_fault_c   \n"
    );
}

void unhandled_interrupt(void) {

    critical_err_data.ipsr = __get_IPSR();
    critical_err_data.type = CRITICAL_ERR_UNHANDLED_INT;

    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC, ENABLE);
    CRC_ResetDR();
    critical_err_crc = CRC_CalcBlockCRC((uint32_t *)&critical_err_data, sizeof(critical_err_data) / sizeof(uint32_t));

#ifdef DEBUG
    DBG_OUT("unhandled interrupt %d", (int)(critical_err_data.ipsr & 0x1FF) - 16);
    for(;;);
#else
    NVIC_SystemReset();
#endif
}

void system_hse_failed(void) {

    critical_err_data.type = CRITICAL_ERR_CLOCK;

    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC, ENABLE);
    CRC_ResetDR();
    critical_err_crc = CRC_CalcBlockCRC((uint32_t *)&critical_err_data, sizeof(critical_err_data) / sizeof(uint32_t));

#ifdef DEBUG
    DBG_OUT("HSE failed");
    for(;;);
#else
    NVIC_SystemReset();
#endif
}

void NMI_Handler(void) {

    if(RCC_GetITStatus(RCC_IT_CSS) == SET) {
        RCC_ClearITPendingBit(RCC_IT_CSS);

        critical_err_data.type = CRITICAL_ERR_CLOCK;

        RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC, ENABLE);
        CRC_ResetDR();
        critical_err_crc = CRC_CalcBlockCRC((uint32_t *)&critical_err_data, sizeof(critical_err_data) / sizeof(uint32_t));

#ifdef DEBUG
        DBG_OUT("HSE failed");
        for(;;);
#else
        NVIC_SystemReset();
#endif
    } else {
        unhandled_interrupt();
    }
}

void critical_err_stack_check(void) {

    bool stack_overflowed = false;

    for(uint32_t *p = &_stack_end_marker_start; p < &_stack_end_marker_end && !stack_overflowed; p++) {
        if(*p != CRITICAL_ERR_STACK_END_MARKER) {
            stack_overflowed = true;
        }
    }

    if(stack_overflowed) {

        critical_err_data.type = CRITICAL_ERR_STACK_OVERFLOWED;

        RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_CRC, ENABLE);
        CRC_ResetDR();
        critical_err_crc = CRC_CalcBlockCRC((uint32_t *)&critical_err_data, sizeof(critical_err_data) / sizeof(uint32_t));

#ifdef DEBUG
        DBG_OUT("Stack overflowed");
        for(;;);
#else
        NVIC_SystemReset();
#endif
    }
}


static void critical_err_widget_default(void) {

    for(;;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_text(0, ui_engine_get_xsize() / 2, 20, UI_ENGINE_FONT29, "Unknown critical error", true);

        char buf[21] = "Error ID: ";
        utoa(critical_err_data.type, &buf[10], 10);
        ui_engine_text(0, 50, 80, UI_ENGINE_FONT18, buf, false);

        ui_engine_button(1, (ui_engine_get_xsize() - 120) / 2, ui_engine_get_ysize() - 50, 120, 40, UI_ENGINE_FONT28, "Reboot");
        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(touch.tag == 1) {
            break;
        }
    }
}

static void critical_err_widget_hardfault(void) {

    for(;;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_text(0, ui_engine_get_xsize() / 2, 20, UI_ENGINE_FONT29, "Hard Fault", true);

        char regs_str[8][15] = {"R0  0x        ", "R1  0x        ", "R2  0x        ", "R3  0x        ",
                                "R12 0x        ", "LR  0x        ", "PC  0x        ", "PSR 0x        "
                               };

        uint32_t regs_val[8] = {critical_err_data.r0,  critical_err_data.r1, critical_err_data.r2, critical_err_data.r3,
                                critical_err_data.r12, critical_err_data.lr, critical_err_data.pc, critical_err_data.psr
                               };

        for(uint8_t i = 0; i < 8; i++) {
            for(uint8_t j = 13; j > 5; j--) {
                regs_str[i][j] = "0123456789ABCDEF"[regs_val[i] & 0xF];
                regs_val[i] >>= 4;
            }
            ui_engine_text(0, 50, 50 + i * 20, UI_ENGINE_FONT18, regs_str[i], false);
        }

        ui_engine_button(1, (ui_engine_get_xsize() - 120) / 2, ui_engine_get_ysize() - 50, 120, 40, UI_ENGINE_FONT28, "Reboot");
        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(touch.tag == 1) {
            break;
        }
    }
}

static void critical_err_widget_unhandledint(void) {
    for(;;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_text(0, ui_engine_get_xsize() / 2, 20, UI_ENGINE_FONT29, "Unhandled interrupt", true);

        char buf[18] = "interrupt ID: ";
        itoa((int)(critical_err_data.ipsr & 0x1FF) - 16, &buf[14], 10);
        ui_engine_text(0, 50, 80, UI_ENGINE_FONT18, buf, false);

        ui_engine_button(1, (ui_engine_get_xsize() - 120) / 2, ui_engine_get_ysize() - 50, 120, 40, UI_ENGINE_FONT28, "Reboot");
        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(touch.tag == 1) {
            break;
        }
    }
}

static void critical_err_widget_hsefail(void) {

    for(;;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_text(0, ui_engine_get_xsize() / 2, 20, UI_ENGINE_FONT29, "HSE Failed", true);
        ui_engine_button(1, (ui_engine_get_xsize() - 120) / 2, ui_engine_get_ysize() - 50, 120, 40, UI_ENGINE_FONT28, "Reboot");
        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(touch.tag == 1) {
            break;
        }
    }
}

#ifdef USE_FULL_ASSERT
static void critical_err_widget_assert(void) {

    for(;;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_text(0, ui_engine_get_xsize() / 2, 20, UI_ENGINE_FONT29, "Assert Failed", true);

        ui_engine_text(0, 50, 100, UI_ENGINE_FONT18, critical_err_data.file, false);

        char buf[12] = "L";
        utoa(critical_err_data.line, &buf[1], 10);
        ui_engine_text(0, 50, 120, UI_ENGINE_FONT18, buf, false);

        ui_engine_button(1, (ui_engine_get_xsize() - 120) / 2, ui_engine_get_ysize() - 50, 120, 40, UI_ENGINE_FONT28, "Reboot");
        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(touch.tag == 1) {
            break;
        }
    }
}
#endif

static void critical_err_widget_stackoverflowed(void) {

    for(;;) {
        ui_engine_draw_start(0, 0, 0);
        ui_engine_set_gradient(0, 0, 0xFF, 0xFF, 0, 0);
        ui_engine_text(0, ui_engine_get_xsize() / 2, 20, UI_ENGINE_FONT29, "Stack overflowed", true);

        ui_engine_button(1, (ui_engine_get_xsize() - 120) / 2, ui_engine_get_ysize() - 50, 120, 40, UI_ENGINE_FONT28, "Reboot");
        ui_engine_draw_end();

        ui_engine_touch_t touch = ui_engine_get_touch(true);

        if(touch.tag == 1) {
            break;
        }
    }
}
