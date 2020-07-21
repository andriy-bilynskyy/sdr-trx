/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    circular buffer header file
    FIFO buffer for storing any type of elements.
*/

#ifndef __CIRC_BUFFER_H
#define __CIRC_BUFFER_H


#include "circ_buffer_conf.h"
#include <stdint.h>
#include <stdbool.h>


/*******************************************************************************
 *    buffer handler type declaration
 ******************************************************************************/
typedef struct {
    uint8_t               * mp_data;            /* data pointer */
    CIRC_BUFFER_BASE_T      m_element_size;     /* size in bytes of buffer element */
    CIRC_BUFFER_BASE_T      m_buffer_size;      /* size in elements of buffer */
    CIRC_BUFFER_BASE_T      m_head;             /* offset of write position in elements */
    CIRC_BUFFER_BASE_T      m_tail;             /* offset of read position in elements */
    bool                    m_is_empty;         /* is buffer empty? */
    bool                    m_over_wr_en;       /* overwrite old elements flag */
} circ_buffer_t;


/*******************************************************************************
 *   definition to create buffer, see circ_buffer_make for details
 ******************************************************************************/
#define circ_buffer_create(buffer, buffer_size, element, over_wr_en)  circ_buffer_make(buffer, buffer_size, sizeof(element), over_wr_en)

/*******************************************************************************
 * create buffer (allocate its memory)
 * buffer       - buffer handler
 * buffer_size  - elements count to store
 * element_size - size of each element in bytes
 * over_wr_en   - overwrite old data with new when buffer overflows
 * return: true if buffer created otherwise false
 ******************************************************************************/
bool circ_buffer_make(circ_buffer_t * buffer, CIRC_BUFFER_BASE_T buffer_size, CIRC_BUFFER_BASE_T element_size, bool over_wr_en);
/*******************************************************************************
 * destroy buffer (free its memory)
 * buffer       - buffer handler
 ******************************************************************************/
void circ_buffer_destroy(circ_buffer_t * buffer);
/*******************************************************************************
 * get buffer size in elements
 * buffer       - buffer handler
 ******************************************************************************/
CIRC_BUFFER_BASE_T circ_buffer_size(const circ_buffer_t * buffer);
/*******************************************************************************
 * get saved elements inside the buffer.
 * buffer       - buffer handler
 * return: count of saved elements
 ******************************************************************************/
CIRC_BUFFER_BASE_T circ_buffer_used(const circ_buffer_t * buffer);
/*******************************************************************************
 * get free buffer size in elements
 * buffer       - buffer handler
 * return: count of free elements (not occupied by saved data)
 ******************************************************************************/
CIRC_BUFFER_BASE_T circ_buffer_free(const circ_buffer_t * buffer);
/*******************************************************************************
 * clear (flush) buffer
 * buffer       - buffer handler
 ******************************************************************************/
void circ_buffer_clear(circ_buffer_t * buffer);
/*******************************************************************************
 * put data into buffer
 * buffer       - buffer handler
 * data         - data to put
 * data_size    - number of data elements to put into buffer
 * return: count of written elements
 * !!! data - should be the same type as it was during buffer creation
 ******************************************************************************/
CIRC_BUFFER_BASE_T circ_buffer_put(circ_buffer_t * buffer, const void * data, CIRC_BUFFER_BASE_T data_size);
/*******************************************************************************
 * get data from buffer
 * buffer       - buffer handler
 * data         - data buffer to retrieve from FIFO buffer
 * data_size    - number of data elements in retrieve data buffer
 * return: count of retrieved elements
 * !!! data - should be the same type as it was during buffer creation
 ******************************************************************************/
CIRC_BUFFER_BASE_T circ_buffer_get(circ_buffer_t * buffer, void * data, CIRC_BUFFER_BASE_T data_size);
/*******************************************************************************
 * check buffer element at index position, no getting data from buffer just check
 * buffer       - buffer handler
 * idx          - index of element in FIFO buffer to retrieve
 * return: pointer to buffer element at specified index, NULL if element not exist
 * !!! pointer has type void* so in any check operation it should be converted to buffer data type
 ******************************************************************************/
const void * circ_buffer_element(const circ_buffer_t * buffer, CIRC_BUFFER_BASE_T idx);
/*******************************************************************************
 * check buffer elements at index position, no getting data from buffer just check
 * buffer       - buffer handler
 * idx          - index of element in FIFO buffer to start retrieve
 * data         - data buffer to retrieve from FIFO buffer
 * data_size    - number of data elements in retrieve data buffer
 * return: count of retrieved elements
 * !!! data - should be the same type as it was during buffer creation
 ******************************************************************************/
CIRC_BUFFER_BASE_T circ_buffer_elements(const circ_buffer_t * buffer, CIRC_BUFFER_BASE_T idx, void * data, CIRC_BUFFER_BASE_T data_size);

#endif
