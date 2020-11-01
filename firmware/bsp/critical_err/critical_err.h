/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
    Critical errors header file
*/

#ifndef __CRITICAL_ERR_H
#define __CRITICAL_ERR_H


void critical_err_stack_check(void);
void critical_err_task_stack_overflowed(char * task_name);
void critical_err_malloc_failed(void);

#endif
