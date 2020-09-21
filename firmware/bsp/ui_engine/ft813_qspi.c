/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    FT813 QSPI display driver source file
    https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT81x.pdf
*/


#include "ft813_qspi.h"
#include "ui_engine_conf.h"
#include "ui_engine_os_dep.h"
#include "stm32f4xx_conf.h"


/******************************************************************************
 * F813 QSPI interface connection
 ******************************************************************************/
#define UI_CLK_PORT     GPIOB
#define UI_CLK_PIN      GPIO_Pin_1
#define UI_CLK_PIN_SRC  GPIO_PinSource1
#define UI_CLK_AF       GPIO_AF9_QUADSPI

#define UI_IO0_PORT     GPIOA
#define UI_IO0_PIN      GPIO_Pin_6
#define UI_IO0_PIN_SRC  GPIO_PinSource6
#define UI_IO0_AF       GPIO_AF10_QUADSPI

#define UI_IO1_PORT     GPIOA
#define UI_IO1_PIN      GPIO_Pin_7
#define UI_IO1_PIN_SRC  GPIO_PinSource7
#define UI_IO1_AF       GPIO_AF10_QUADSPI

#define UI_IO2_PORT     GPIOC
#define UI_IO2_PIN      GPIO_Pin_4
#define UI_IO2_PIN_SRC  GPIO_PinSource4
#define UI_IO2_AF       GPIO_AF10_QUADSPI

#define UI_IO3_PORT     GPIOC
#define UI_IO3_PIN      GPIO_Pin_5
#define UI_IO3_PIN_SRC  GPIO_PinSource5
#define UI_IO3_AF       GPIO_AF10_QUADSPI

#define UI_NCS_PORT     GPIOC
#define UI_NCS_PIN      GPIO_Pin_11
#define UI_NCS_PIN_SRC  GPIO_PinSource11
#define UI_NCS_AF       GPIO_AF9_QUADSPI

#define UI_NCS_BANK     QSPI_FSelect_2

/******************************************************************************
 * F813 QSPI defines
 ******************************************************************************/
#define FT813_QSPI_CLK      16000000
#define FT813_ADDRESS_MASK  0x3FFFFF
#define FT813_OPERATION_WR  0x800000
#define FT813_OPERATION_RD  0x000000


void ft813_qspi_start(void) {

    RCC_AHB3PeriphClockCmd(RCC_AHB3Periph_QSPI, ENABLE);
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2, ENABLE);

    GPIO_WriteBit(UI_CLK_PORT, UI_CLK_PIN, Bit_RESET);
    GPIO_WriteBit(UI_IO0_PORT, UI_IO0_PIN, Bit_RESET);
    GPIO_WriteBit(UI_IO1_PORT, UI_IO1_PIN, Bit_RESET);
    GPIO_WriteBit(UI_IO2_PORT, UI_IO2_PIN, Bit_RESET);
    GPIO_WriteBit(UI_IO3_PORT, UI_IO3_PIN, Bit_RESET);
    GPIO_WriteBit(UI_NCS_PORT, UI_NCS_PIN, Bit_RESET);

    GPIO_PinAFConfig(UI_CLK_PORT, UI_CLK_PIN_SRC, UI_CLK_AF);
    GPIO_PinAFConfig(UI_IO0_PORT, UI_IO0_PIN_SRC, UI_IO0_AF);
    GPIO_PinAFConfig(UI_IO1_PORT, UI_IO1_PIN_SRC, UI_IO1_AF);
    GPIO_PinAFConfig(UI_IO2_PORT, UI_IO2_PIN_SRC, UI_IO2_AF);
    GPIO_PinAFConfig(UI_IO3_PORT, UI_IO3_PIN_SRC, UI_IO3_AF);
    GPIO_PinAFConfig(UI_NCS_PORT, UI_NCS_PIN_SRC, UI_NCS_AF);

    GPIO_InitTypeDef  gpio = {
        .GPIO_Mode = GPIO_Mode_AF,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_High_Speed
    };

    gpio.GPIO_Pin = UI_CLK_PIN;
    GPIO_Init(UI_CLK_PORT, &gpio);
    gpio.GPIO_Pin = UI_IO0_PIN;
    GPIO_Init(UI_IO0_PORT, &gpio);
    gpio.GPIO_Pin = UI_IO1_PIN;
    GPIO_Init(UI_IO1_PORT, &gpio);
    gpio.GPIO_Pin = UI_IO2_PIN;
    GPIO_Init(UI_IO2_PORT, &gpio);
    gpio.GPIO_Pin = UI_IO3_PIN;
    GPIO_Init(UI_IO3_PORT, &gpio);
    gpio.GPIO_Pin = UI_NCS_PIN;
    GPIO_Init(UI_NCS_PORT, &gpio);

    RCC_ClocksTypeDef clk;
    RCC_GetClocksFreq(&clk);

    QSPI_InitTypeDef qspi = {
        .QSPI_SShift = QSPI_SShift_NoShift,
        .QSPI_Prescaler = ((clk.HCLK_Frequency / FT813_QSPI_CLK) ? (clk.HCLK_Frequency / FT813_QSPI_CLK - 1) : 0),
        .QSPI_CKMode = QSPI_CKMode_Mode0,
        .QSPI_CSHTime = QSPI_CSHTime_1Cycle,
        .QSPI_FSize = 23,
        .QSPI_FSelect = UI_NCS_BANK,
        .QSPI_DFlash = QSPI_DFlash_Disable
    };
    QSPI_Init(&qspi);

    QSPI_Cmd(ENABLE);
    QSPI_DMACmd(ENABLE);

    QSPI_ITConfig(QSPI_IT_TC | QSPI_IT_TE, ENABLE);
    NVIC_SetPriority(QUADSPI_IRQn, UI_FT813_QSPI_IRQ_PRIO);
    NVIC_EnableIRQ(QUADSPI_IRQn);

    ft813_qspi_set_sync_obj();
}

void ft813_qspi_stop(void) {

    DMA_Cmd(DMA2_Stream7, DISABLE);
    DMA_ClearFlag(DMA2_Stream7, DMA_FLAG_TCIF7 | DMA_FLAG_HTIF7 | DMA_FLAG_TEIF7 | DMA_FLAG_DMEIF7 | DMA_FLAG_FEIF7);

    NVIC_DisableIRQ(QUADSPI_IRQn);
    QSPI_ITConfig(QSPI_IT_TC | QSPI_IT_TE, DISABLE);

    QSPI_DMACmd(DISABLE);
    QSPI_Cmd(DISABLE);

    QSPI_DeInit();

    GPIO_InitTypeDef  gpio = {
        .GPIO_Mode = GPIO_Mode_IN,
        .GPIO_OType = GPIO_OType_PP,
        .GPIO_PuPd = GPIO_PuPd_NOPULL,
        .GPIO_Speed = GPIO_Low_Speed
    };

    gpio.GPIO_Pin = UI_CLK_PIN;
    GPIO_Init(UI_CLK_PORT, &gpio);
    gpio.GPIO_Pin = UI_IO0_PIN;
    GPIO_Init(UI_IO0_PORT, &gpio);
    gpio.GPIO_Pin = UI_IO1_PIN;
    GPIO_Init(UI_IO1_PORT, &gpio);
    gpio.GPIO_Pin = UI_IO2_PIN;
    GPIO_Init(UI_IO2_PORT, &gpio);
    gpio.GPIO_Pin = UI_IO3_PIN;
    GPIO_Init(UI_IO3_PORT, &gpio);
    gpio.GPIO_Pin = UI_NCS_PIN;
    GPIO_Init(UI_NCS_PORT, &gpio);

    GPIO_WriteBit(UI_CLK_PORT, UI_CLK_PIN, Bit_RESET);
    GPIO_WriteBit(UI_IO0_PORT, UI_IO0_PIN, Bit_RESET);
    GPIO_WriteBit(UI_IO1_PORT, UI_IO1_PIN, Bit_RESET);
    GPIO_WriteBit(UI_IO2_PORT, UI_IO2_PIN, Bit_RESET);
    GPIO_WriteBit(UI_IO3_PORT, UI_IO3_PIN, Bit_RESET);
    GPIO_WriteBit(UI_NCS_PORT, UI_NCS_PIN, Bit_RESET);

    RCC_AHB3PeriphClockCmd(RCC_AHB3Periph_QSPI, DISABLE);
}

void ft813_qspi_cmd(uint8_t cmd, uint8_t arg, bool mode_4x) {

    ft813_qspi_wait_sync_obj();
    ft813_qspi_clr_sync_obj();

    DMA_ClearFlag(DMA2_Stream7, DMA_FLAG_TCIF7 | DMA_FLAG_HTIF7 | DMA_FLAG_TEIF7 | DMA_FLAG_DMEIF7 | DMA_FLAG_FEIF7);
    while(QSPI_GetFlagStatus(QSPI_FLAG_BUSY) != RESET) {
        (void)QSPI_ReceiveData8();
    }

    QSPI_ComConfig_InitTypeDef com;
    QSPI_ComConfig_StructInit(&com);
    com.QSPI_ComConfig_FMode = QSPI_ComConfig_FMode_Indirect_Write;
    com.QSPI_ComConfig_IMode = mode_4x ? QSPI_ComConfig_IMode_4Line : QSPI_ComConfig_IMode_1Line;
    com.QSPI_ComConfig_Ins = cmd;
    com.QSPI_ComConfig_ABMode = mode_4x ? QSPI_ComConfig_ABMode_4Line : QSPI_ComConfig_ABMode_1Line;
    com.QSPI_ComConfig_ABSize = QSPI_ComConfig_ABSize_16bit;
    QSPI_SetAlternateByte((uint16_t)arg << 8);
    QSPI_ComConfig_Init(&com);
}

void ft813_qspi_wr(uint32_t addr, const void * data, uint32_t size, bool mode_4x) {

    if(!data || !size) {
        return;
    }
    addr &= FT813_ADDRESS_MASK;
    addr |= FT813_OPERATION_WR;

    ft813_qspi_wait_sync_obj();
    ft813_qspi_clr_sync_obj();

    DMA_ClearFlag(DMA2_Stream7, DMA_FLAG_TCIF7 | DMA_FLAG_HTIF7 | DMA_FLAG_TEIF7 | DMA_FLAG_DMEIF7 | DMA_FLAG_FEIF7);
    while(QSPI_GetFlagStatus(QSPI_FLAG_BUSY) != RESET) {
        (void)QSPI_ReceiveData8();
    }

    QSPI_ComConfig_InitTypeDef com;
    QSPI_ComConfig_StructInit(&com);
    com.QSPI_ComConfig_FMode = QSPI_ComConfig_FMode_Indirect_Write;
    com.QSPI_ComConfig_ADMode = mode_4x ? QSPI_ComConfig_ADMode_4Line : QSPI_ComConfig_ADMode_1Line;
    com.QSPI_ComConfig_ADSize = QSPI_ComConfig_ADSize_24bit;
    com.QSPI_ComConfig_DMode = mode_4x ? QSPI_ComConfig_DMode_4Line : QSPI_ComConfig_DMode_1Line;
    QSPI_ComConfig_Init(&com);

    QSPI_SetDataLength(size - 1);
    QSPI_SetAddress(addr);

    DMA_InitTypeDef dma;
    DMA_StructInit(&dma);
    dma.DMA_Channel = DMA_Channel_3;
    dma.DMA_Priority = UI_FT813_QSPI_DMA_PRIO;
    dma.DMA_DIR = DMA_DIR_MemoryToPeripheral;
    dma.DMA_PeripheralBaseAddr = (uint32_t)&(QUADSPI->DR);
    dma.DMA_Memory0BaseAddr = (uint32_t)data;
    dma.DMA_BufferSize = size;
    dma.DMA_MemoryInc = DMA_MemoryInc_Enable;
    DMA_Init(DMA2_Stream7, &dma);
    DMA_Cmd(DMA2_Stream7, ENABLE);
}

void ft813_qspi_rd(uint32_t addr, void * data, uint32_t size, bool mode_4x) {

    if(!data || !size) {
        return;
    }
    addr &= FT813_ADDRESS_MASK;
    addr |= FT813_OPERATION_RD;

    ft813_qspi_wait_sync_obj();
    ft813_qspi_clr_sync_obj();

    DMA_ClearFlag(DMA2_Stream7, DMA_FLAG_TCIF7 | DMA_FLAG_HTIF7 | DMA_FLAG_TEIF7 | DMA_FLAG_DMEIF7 | DMA_FLAG_FEIF7);
    while(QSPI_GetFlagStatus(QSPI_FLAG_BUSY) != RESET) {
        (void)QSPI_ReceiveData8();
    }

    QSPI_ComConfig_InitTypeDef com;
    QSPI_ComConfig_StructInit(&com);
    com.QSPI_ComConfig_FMode = QSPI_ComConfig_FMode_Indirect_Read;
    com.QSPI_ComConfig_ADMode = mode_4x ? QSPI_ComConfig_ADMode_4Line : QSPI_ComConfig_ADMode_1Line;
    com.QSPI_ComConfig_ADSize = QSPI_ComConfig_ADSize_24bit;
    com.QSPI_ComConfig_DummyCycles = mode_4x ? 2 : 8;
    com.QSPI_ComConfig_DMode = mode_4x ? QSPI_ComConfig_DMode_4Line : QSPI_ComConfig_DMode_1Line;
    QSPI_ComConfig_Init(&com);

    QSPI_SetDataLength(size - 1);
    QSPI_SetAddress(addr);

    DMA_InitTypeDef dma;
    DMA_StructInit(&dma);
    dma.DMA_Channel = DMA_Channel_3;
    dma.DMA_Priority = UI_FT813_QSPI_DMA_PRIO;
    dma.DMA_DIR = DMA_DIR_PeripheralToMemory;
    dma.DMA_PeripheralBaseAddr = (uint32_t)&(QUADSPI->DR);
    dma.DMA_Memory0BaseAddr = (uint32_t)data;
    dma.DMA_BufferSize = size;
    dma.DMA_MemoryInc = DMA_MemoryInc_Enable;
    DMA_Init(DMA2_Stream7, &dma);
    DMA_Cmd(DMA2_Stream7, ENABLE);

    ft813_qspi_wait_sync_obj();

    return;
}

void QUADSPI_IRQHandler(void) {
    if(QSPI_GetFlagStatus(QSPI_FLAG_TC) == SET) {
        QSPI_ClearITPendingBit(QSPI_IT_TC);

        ft813_qspi_set_sync_obj();
    }
    if(QSPI_GetFlagStatus(QSPI_FLAG_TE) == SET) {
        QSPI_ClearITPendingBit(QSPI_IT_TE);
        /* we're in indirect mode, so error is caused by outta address space condition */
        /* the QSPI transfer function are unblocked. but check code. which addresses are accessed */
        ft813_qspi_set_sync_obj();
        DMA_Cmd(DMA2_Stream7, DISABLE);
        QSPI_ClearFlag(QSPI_FLAG_TE);
        QSPI_AbortRequest();
    }
}
