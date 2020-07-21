/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    circular buffer source file
    FIFO buffer for storing any type of elements.
*/

#include "circ_buffer.h"
#include <stddef.h>
#include <string.h>


/*******************************************************************************
 *   private functions declaration
 ******************************************************************************/
static bool is_empty(const circ_buffer_t * buffer);
static bool is_full(const circ_buffer_t * buffer);


/*******************************************************************************
 *   public functions implementation
 ******************************************************************************/

bool circ_buffer_make(circ_buffer_t * buffer, CIRC_BUFFER_BASE_T buffer_size, CIRC_BUFFER_BASE_T element_size, bool over_wr_en) {
    bool result = false;

    if(buffer) {
        buffer->m_element_size = element_size;
        buffer->m_buffer_size = buffer_size;
        buffer->m_over_wr_en = over_wr_en;

        buffer->mp_data = CIRC_BUFFER_MALLOC(buffer->m_buffer_size * buffer->m_element_size);
        buffer->m_head = 0;
        buffer->m_tail = 0;
        buffer->m_is_empty = true;

        result = buffer->mp_data;
    }

    return result;
}

void circ_buffer_destroy(circ_buffer_t * buffer) {
    if(buffer && buffer->mp_data) {
        CIRC_BUFFER_FREE(buffer->mp_data);
        buffer->mp_data = NULL;
    }
}

CIRC_BUFFER_BASE_T circ_buffer_size(const circ_buffer_t * buffer) {
    return buffer && buffer->mp_data ? buffer->m_buffer_size : 0;
}

CIRC_BUFFER_BASE_T circ_buffer_used(const circ_buffer_t * buffer) {
    uint32_t used = 0;

    if(buffer && buffer->mp_data) {
        if(buffer->m_head > buffer->m_tail) {
            used = buffer->m_head - buffer->m_tail;
        } else if (buffer->m_head < buffer->m_tail) {
            used = buffer->m_buffer_size - buffer->m_tail + buffer->m_head;
        } else if(!buffer->m_is_empty) {
            used = buffer->m_buffer_size;
        }
    }

    return used;
}

CIRC_BUFFER_BASE_T circ_buffer_free(const circ_buffer_t * buffer) {
    return circ_buffer_size(buffer) - circ_buffer_used(buffer);
}

void circ_buffer_clear(circ_buffer_t * buffer) {
    if(buffer && buffer->mp_data) {
        buffer->m_head = 0;
        buffer->m_tail = 0;
        buffer->m_is_empty = true;
    }
}

CIRC_BUFFER_BASE_T circ_buffer_put(circ_buffer_t * buffer, const void * data, CIRC_BUFFER_BASE_T data_size) {
    CIRC_BUFFER_BASE_T wr_size = 0;

    if(buffer && buffer->mp_data && data) {
        while(data_size && (buffer->m_over_wr_en || !is_full(buffer))) {
            CIRC_BUFFER_BASE_T wr_elements = 0;

            if(buffer->m_head >= buffer->m_tail) {
                wr_elements = buffer->m_buffer_size - buffer->m_head;
            } else {
                wr_elements = buffer->m_tail - buffer->m_head;
            }
            if(wr_elements > data_size) {
                wr_elements = data_size;
            }
            memcpy(&buffer->mp_data[buffer->m_head * buffer->m_element_size], data, wr_elements * buffer->m_element_size);
            data_size -= wr_elements;
            data = (uint8_t *)data + wr_elements * buffer->m_element_size;
            wr_size += wr_elements;
            if(buffer->m_head + wr_elements == buffer->m_buffer_size) {
                if(is_full(buffer)) {
                    buffer->m_tail = 0;
                }
                buffer->m_head = 0;
            } else {
                if(is_full(buffer)) {
                    buffer->m_tail += wr_elements;
                }
                buffer->m_head += wr_elements;
            }
            buffer->m_is_empty = false;
        }
    }

    return wr_size;
}

CIRC_BUFFER_BASE_T circ_buffer_get(circ_buffer_t * buffer, void * data, CIRC_BUFFER_BASE_T data_size) {
    CIRC_BUFFER_BASE_T rd_size = 0;

    if(buffer && buffer->mp_data && data) {
        while(data_size && !is_empty(buffer)) {
            CIRC_BUFFER_BASE_T rd_elements = 0;
            if(buffer->m_tail >= buffer->m_head) {
                rd_elements = buffer->m_buffer_size - buffer->m_tail;
            } else {
                rd_elements = buffer->m_head - buffer->m_tail;
            }
            if(rd_elements > data_size) {
                rd_elements = data_size;
            }
            memcpy(data, &buffer->mp_data[buffer->m_tail * buffer->m_element_size], rd_elements * buffer->m_element_size);
            data_size -= rd_elements;
            data = (uint8_t *)data + rd_elements * buffer->m_element_size;
            rd_size += rd_elements;
            if(buffer->m_tail + rd_elements == buffer->m_buffer_size) {
                buffer->m_tail = 0;
            } else {
                buffer->m_tail += rd_elements;
            }
            if(buffer->m_tail == buffer->m_head) {
                buffer->m_is_empty = true;
            }
        }
    }

    return rd_size;
}

bool circ_buffer_element(const circ_buffer_t * buffer, CIRC_BUFFER_BASE_T idx, void * data) {
    bool result = false;

    if(buffer && buffer->mp_data && data) {
        if(buffer->m_tail < buffer->m_head) {
            if(buffer->m_tail + idx < buffer->m_head) {
                memcpy(data, &buffer->mp_data[(buffer->m_tail + idx) * buffer->m_element_size], buffer->m_element_size);
                result = true;
            }
        } else if(!is_empty(buffer)) {
            if(buffer->m_tail + idx < buffer->m_buffer_size) {
                memcpy(data, &buffer->mp_data[(buffer->m_tail + idx) * buffer->m_element_size], buffer->m_element_size);
                result = true;
            } else if(idx + buffer->m_tail - buffer->m_buffer_size < buffer->m_head) {
                memcpy(data, &buffer->mp_data[(idx + buffer->m_tail - buffer->m_buffer_size) * buffer->m_element_size], buffer->m_element_size);
                result = true;
            }
        }
    }

    return result;
}

CIRC_BUFFER_BASE_T circ_buffer_elements(const circ_buffer_t * buffer, CIRC_BUFFER_BASE_T idx, void * data, CIRC_BUFFER_BASE_T data_size) {
    uint32_t rd_size = 0;

    if(buffer && buffer->mp_data && data) {
        if(buffer->m_tail < buffer->m_head) {
            if(buffer->m_tail + idx < buffer->m_head) {
                rd_size = buffer->m_head - buffer->m_tail - idx;
                if(rd_size > data_size) {
                    rd_size = data_size;
                }
                memcpy(data, &buffer->mp_data[(buffer->m_tail + idx) * buffer->m_element_size], rd_size * buffer->m_element_size);
            }
        } else if(!is_empty(buffer)) {
            if(buffer->m_tail + idx < buffer->m_buffer_size) {
                rd_size = buffer->m_buffer_size - buffer->m_tail - idx;
                if(rd_size > data_size) {
                    rd_size = data_size;
                }
                memcpy(data, &buffer->mp_data[(buffer->m_tail + idx) * buffer->m_element_size], rd_size * buffer->m_element_size);
                data_size -= rd_size;
                data = (uint8_t *)data + rd_size * buffer->m_element_size;
                rd_size += buffer->m_head > data_size ? data_size : buffer->m_head;
                memcpy(data, &buffer->mp_data[0], (buffer->m_head > data_size ? data_size : buffer->m_head) * buffer->m_element_size);
            } else if(idx + buffer->m_tail - buffer->m_buffer_size < buffer->m_head) {
                rd_size = buffer->m_head + buffer->m_buffer_size - idx - buffer->m_tail;
                if(rd_size > data_size) {
                    rd_size = data_size;
                }
                memcpy(data, &buffer->mp_data[(idx + buffer->m_tail - buffer->m_buffer_size) * buffer->m_element_size], rd_size * buffer->m_element_size);
            }
        }
    }

    return rd_size;
}


/*******************************************************************************
 *   private functions implementation
 ******************************************************************************/

static bool is_empty(const circ_buffer_t * buffer) {
    return (buffer->m_head == buffer->m_tail && buffer->m_is_empty);
}

static bool is_full(const circ_buffer_t * buffer) {
    return (buffer->m_head == buffer->m_tail && !buffer->m_is_empty);
}
