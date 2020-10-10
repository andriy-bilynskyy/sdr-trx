/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    i2c master driver source file
*/


#include "i2c_master.h"
#include "i2c_master_conf.h"
#include "i2c_master_os_dep.h"
#include "stm32f4xx_conf.h"


static uint8_t  i2c_master_started = 0;
static uint8_t  i2c_master_address = 0;


void i2c_master_start(void) {

    i2c_lock_sync_obj();
    if(!i2c_master_started) {
        I2C_APB_CMD(I2C_PERIPH, ENABLE);
        I2C_APB_DMA_CMD(I2C_DMA_PERIPH, ENABLE);

        GPIO_WriteBit(I2C_PORT, I2C_SCL_PIN, Bit_RESET);
        GPIO_WriteBit(I2C_PORT, I2C_SDA_PIN, Bit_RESET);

        GPIO_PinAFConfig(I2C_PORT, I2C_SCL_PIN_SRC, I2C_SCL_AF);
        GPIO_PinAFConfig(I2C_PORT, I2C_SDA_PIN_SRC, I2C_SDA_AF);

        GPIO_InitTypeDef  gpio = {
            .GPIO_Pin = I2C_SCL_PIN | I2C_SDA_PIN,
            .GPIO_Mode = GPIO_Mode_AF,
            .GPIO_OType = GPIO_OType_OD,
            .GPIO_PuPd = GPIO_PuPd_NOPULL,
            .GPIO_Speed = GPIO_High_Speed
        };
        GPIO_Init(I2C_PORT, &gpio);

        I2C_InitTypeDef i2c;
        I2C_StructInit(&i2c);
        i2c.I2C_ClockSpeed = I2C_SPEED;
        I2C_Init(I2C_I2C, &i2c);

        I2C_Cmd(I2C_I2C, ENABLE);
        I2C_DMACmd(I2C_I2C, ENABLE);
        I2C_DMALastTransferCmd(I2C_I2C, ENABLE);

        I2C_ITConfig(I2C_I2C, I2C_IT_ERR, ENABLE);
        DMA_ITConfig(I2C_DMA_RX_STREAM, DMA_IT_TC, ENABLE);

        NVIC_SetPriority(I2C_EV_IRQn, I2C_IRQS_PRIO);
        NVIC_SetPriority(I2C_ER_IRQn, I2C_IRQS_PRIO);
        NVIC_SetPriority(I2C_RC_IRQn, I2C_IRQS_PRIO);
        NVIC_EnableIRQ(I2C_EV_IRQn);
        NVIC_EnableIRQ(I2C_ER_IRQn);
        NVIC_EnableIRQ(I2C_RC_IRQn);

        i2c_master_started = 1;
    }
    i2c_unlock_sync_obj();
}

void i2c_master_stop(void) {

    i2c_lock_sync_obj();
    if(i2c_master_started) {
        DMA_Cmd(I2C_DMA_RX_STREAM, DISABLE);
        DMA_Cmd(I2C_DMA_TX_STREAM, DISABLE);
        DMA_DeInit(I2C_DMA_RX_STREAM);
        DMA_DeInit(I2C_DMA_TX_STREAM);

        NVIC_DisableIRQ(I2C_RC_IRQn);
        NVIC_DisableIRQ(I2C_ER_IRQn);
        NVIC_DisableIRQ(I2C_EV_IRQn);

        DMA_ITConfig(I2C_DMA_RX_STREAM, DMA_IT_TC, DISABLE);
        I2C_ITConfig(I2C_I2C, I2C_IT_EVT | I2C_IT_ERR, DISABLE);

        I2C_DMACmd(I2C_I2C, DISABLE);
        I2C_Cmd(I2C_I2C, DISABLE);

        I2C_DeInit(I2C_I2C);

        GPIO_InitTypeDef  gpio = {
            .GPIO_Pin = I2C_SCL_PIN | I2C_SDA_PIN,
            .GPIO_Mode = GPIO_Mode_IN,
            .GPIO_OType = GPIO_OType_PP,
            .GPIO_PuPd  = GPIO_PuPd_NOPULL,
            .GPIO_Speed = GPIO_Low_Speed
        };
        GPIO_Init(I2C_PORT, &gpio);

        GPIO_WriteBit(I2C_PORT, I2C_SCL_PIN, Bit_RESET);
        GPIO_WriteBit(I2C_PORT, I2C_SDA_PIN, Bit_RESET);

        I2C_APB_CMD(I2C_PERIPH, DISABLE);

        i2c_master_started = 0;
    }
    i2c_unlock_sync_obj();
}

uint32_t i2c_master_write(uint8_t dev_addr, const void * data, uint32_t size) {

    uint32_t result = 0;

    i2c_lock_sync_obj();
    if(data && size && i2c_master_started) {
        DMA_ClearFlag(I2C_DMA_TX_STREAM, I2C_DMA_TX_FLAGS);
        DMA_InitTypeDef dma;
        DMA_StructInit(&dma);
        dma.DMA_Channel = I2C_DMA_TX_CHANNEL;
        dma.DMA_Priority = I2C_DMA_PRIO;
        dma.DMA_DIR = DMA_DIR_MemoryToPeripheral;
        dma.DMA_PeripheralBaseAddr = (uint32_t)&(I2C_I2C->DR);
        dma.DMA_Memory0BaseAddr = (uint32_t)data;
        dma.DMA_BufferSize = size;
        dma.DMA_MemoryInc = DMA_MemoryInc_Enable;
        DMA_Init(I2C_DMA_TX_STREAM, &dma);

        i2c_master_address = (dev_addr << 1);

        I2C_ITConfig(I2C_I2C, I2C_IT_EVT, ENABLE);
        I2C_GenerateSTART(I2C_I2C, ENABLE);
        i2c_pend_sync_obj();
        result = size - DMA_GetCurrDataCounter(I2C_DMA_TX_STREAM);
    }
    i2c_unlock_sync_obj();

    return result;
}

uint32_t i2c_master_read(uint8_t dev_addr, void * data, uint32_t size) {

    uint32_t result = 0;

    i2c_lock_sync_obj();
    if(data && size && i2c_master_started) {
        DMA_ClearFlag(I2C_DMA_RX_STREAM, I2C_DMA_RX_FLAGS);
        DMA_InitTypeDef dma;
        DMA_StructInit(&dma);
        dma.DMA_Channel = I2C_DMA_RX_CHANNEL;
        dma.DMA_Priority = I2C_DMA_PRIO;
        dma.DMA_DIR = DMA_DIR_PeripheralToMemory;
        dma.DMA_PeripheralBaseAddr = (uint32_t)&(I2C_I2C->DR);
        dma.DMA_Memory0BaseAddr = (uint32_t)data;
        dma.DMA_BufferSize = size;
        dma.DMA_MemoryInc = DMA_MemoryInc_Enable;
        DMA_Init(I2C_DMA_RX_STREAM, &dma);

        i2c_master_address = (dev_addr << 1) | (uint8_t)I2C_OAR1_ADD0;

        I2C_AcknowledgeConfig(I2C_I2C, size > 1 ? ENABLE : DISABLE);
        I2C_ITConfig(I2C_I2C, I2C_IT_EVT, ENABLE);
        I2C_GenerateSTART(I2C_I2C, ENABLE);
        i2c_pend_sync_obj();
        result = size - DMA_GetCurrDataCounter(I2C_DMA_RX_STREAM);
    }
    i2c_unlock_sync_obj();

    return result;
}
/* Handle communication procedure. STOP for TX */
void I2C_EV_IRQ_HANDLER(void) {

    switch(I2C_GetLastEvent(I2C_I2C)) {
    case I2C_EVENT_MASTER_MODE_SELECT:
        I2C_I2C->DR = i2c_master_address;
        break;
    case I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED:
        DMA_Cmd(I2C_DMA_TX_STREAM, ENABLE);
        break;
    case I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED:
        DMA_Cmd(I2C_DMA_RX_STREAM, ENABLE);
        break;
    case I2C_EVENT_MASTER_BYTE_TRANSMITTED:
        I2C_ITConfig(I2C_I2C, I2C_IT_EVT, DISABLE);
        I2C_GenerateSTOP(I2C_I2C, ENABLE);
        i2c_post_sync_obj();
        break;
    default:
        break;
    }
}
/* Error happens (usually NACK) */
void I2C_ER_IRQ_HANDLER(void) {

    if(I2C_GetITStatus(I2C_I2C, I2C_IT_AF) == SET) {
        I2C_ClearITPendingBit(I2C_I2C, I2C_IT_AF);
        I2C_GenerateSTOP(I2C_I2C, ENABLE);
    }
    I2C_ClearITPendingBit(I2C_I2C, I2C_IT_ARLO | I2C_IT_BERR);
    i2c_post_sync_obj();
}
/* RX complete */
void I2C_RC_IRQ_HANDLER(void) {

    DMA_ClearITPendingBit(I2C_DMA_RX_STREAM, I2C_DMA_RX_TCIF);
    I2C_GenerateSTOP(I2C_I2C, ENABLE);
    i2c_post_sync_obj();
}
