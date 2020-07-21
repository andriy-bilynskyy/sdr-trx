/*
********************************************************************************
**
**  (C) 2020 Andrii Bilynskyi <andriy.bilynskyy@gmail.com>
**
**  This code is licensed under the GPLv3.
**
********************************************************************************
*/

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "circ_buffer.h"


#define assert(e) ((void) ((e) ? 0 : __assert (#e, __FILE__, __LINE__)))
#define __assert(e, file, line) ((void)printf ("%s:%i: failed assertion `%s'\n", file, line, e), (void)printf ("tests failed\n"), exit(1), 0)


int main() {
    circ_buffer_t buf;

    printf("test 1: RW elementary type without overwrite\n");
    if(circ_buffer_create(&buf, 10, uint8_t, false)) {

        uint8_t wr_data[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        uint8_t rd_data[20];

        assert(circ_buffer_size(&buf) == 10);
        assert(circ_buffer_free(&buf) == 10);
        assert(circ_buffer_used(&buf) == 0);
        assert(circ_buffer_put(&buf, wr_data, 3) == 3);
        assert(circ_buffer_free(&buf) == 7);
        assert(circ_buffer_used(&buf) == 3);
        assert(circ_buffer_get(&buf, rd_data, sizeof(rd_data)) == 3);
        assert(memcmp(rd_data, wr_data, 3) == 0);
        assert(circ_buffer_free(&buf) == 10);
        assert(circ_buffer_used(&buf) == 0);
        assert(circ_buffer_put(&buf, wr_data, sizeof(wr_data)) == 10);
        assert(circ_buffer_free(&buf) == 0);
        assert(circ_buffer_used(&buf) == 10);
        assert(circ_buffer_get(&buf, rd_data, 5) == 5);
        assert(memcmp(rd_data, wr_data, 5) == 0);
        assert(circ_buffer_free(&buf) == 5);
        assert(circ_buffer_used(&buf) == 5);
        assert(circ_buffer_put(&buf, wr_data, 3) == 3);
        assert(circ_buffer_get(&buf, rd_data, 7) == 7);
        uint8_t pattern1[] = {6,7,8,9,10,1,2};
        assert(memcmp(rd_data, pattern1, 7) == 0);
        assert(circ_buffer_used(&buf) == 1);
        assert(circ_buffer_put(&buf, wr_data, 9) == 9);
        assert(circ_buffer_used(&buf) == 10);
        assert(circ_buffer_get(&buf, rd_data, sizeof(rd_data)) == 10);
        uint8_t pattern2[] = {3,1,2,3,4,5,6,7,8,9};
        assert(memcmp(rd_data, pattern2, 10) == 0);
        assert(circ_buffer_used(&buf) == 0);

        circ_buffer_destroy(&buf);
    } else {
        printf("can't create buffer of 10 elements uint8_t\n");
        return 1;
    }

    printf("test 2: RW multi-byte type without overwrite\n");
    if(circ_buffer_create(&buf, 10, int, false)) {

        int wr_data[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        int rd_data[20];

        assert(circ_buffer_size(&buf) == 10);
        assert(circ_buffer_free(&buf) == 10);
        assert(circ_buffer_used(&buf) == 0);
        assert(circ_buffer_put(&buf, wr_data, 3) == 3);
        assert(circ_buffer_free(&buf) == 7);
        assert(circ_buffer_used(&buf) == 3);
        assert(circ_buffer_get(&buf, rd_data, sizeof(rd_data)/sizeof(int)) == 3);
        assert(memcmp(rd_data, wr_data, 3*sizeof(int)) == 0);
        assert(circ_buffer_free(&buf) == 10);
        assert(circ_buffer_used(&buf) == 0);
        assert(circ_buffer_put(&buf, wr_data, sizeof(wr_data)/sizeof(int)) == 10);
        assert(circ_buffer_free(&buf) == 0);
        assert(circ_buffer_used(&buf) == 10);
        assert(circ_buffer_get(&buf, rd_data, 5) == 5);
        assert(memcmp(rd_data, wr_data, 5*sizeof(int)) == 0);
        assert(circ_buffer_free(&buf) == 5);
        assert(circ_buffer_used(&buf) == 5);
        assert(circ_buffer_put(&buf, wr_data, 3) == 3);
        assert(circ_buffer_get(&buf, rd_data, 7) == 7);
        int pattern1[] = {6,7,8,9,10,1,2};
        assert(memcmp(rd_data, pattern1, 7*sizeof(int)) == 0);
        assert(circ_buffer_used(&buf) == 1);
        assert(circ_buffer_put(&buf, wr_data, 9) == 9);
        assert(circ_buffer_used(&buf) == 10);
        assert(circ_buffer_get(&buf, rd_data, sizeof(rd_data)/sizeof(int)) == 10);
        int pattern2[] = {3,1,2,3,4,5,6,7,8,9};
        assert(memcmp(rd_data, pattern2, 10*sizeof(int)) == 0);
        assert(circ_buffer_used(&buf) == 0);

        circ_buffer_destroy(&buf);
    } else {
        printf("can't create buffer of 10 elements int\n");
        return 1;
    }

    printf("test 3: check retrieved data without overwrite\n");
    if(circ_buffer_create(&buf, 10, int, false)) {

        int wr_data[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        int rd_data[20];
        int bt = 0;

        assert(circ_buffer_put(&buf, wr_data, 3) == 3);
        assert(circ_buffer_element(&buf, 5, &bt) == false);
        assert(circ_buffer_element(&buf, 1, &bt) == true);
        assert(bt == 2);
        assert(circ_buffer_used(&buf) == 3);
        assert(circ_buffer_get(&buf, rd_data, 2) == 2);
        assert(circ_buffer_used(&buf) == 1);
        assert(circ_buffer_element(&buf, 0, &bt) == true);
        assert(bt == 3);
        assert(circ_buffer_put(&buf, wr_data, sizeof(wr_data)/sizeof(int)) == 9);
        assert(circ_buffer_element(&buf, 9, &bt) == true);
        assert(bt == 9);
        assert(circ_buffer_element(&buf, 6, &bt) == true);
        assert(bt == 6);
        assert(circ_buffer_elements(&buf, 6, rd_data, sizeof(rd_data)/sizeof(int)) == 4);
        int pattern1[] = {6,7,8,9};
        assert(memcmp(rd_data, pattern1, 4*sizeof(int)) == 0);
        assert(circ_buffer_get(&buf, rd_data, 4) == 4);
        assert(circ_buffer_elements(&buf, 6, rd_data, sizeof(rd_data)/sizeof(int)) == 0);
        circ_buffer_clear(&buf);
        assert(circ_buffer_used(&buf) == 0);
        assert(circ_buffer_elements(&buf, 0, rd_data, sizeof(rd_data)/sizeof(int)) == 0);

        circ_buffer_destroy(&buf);
    } else {
        printf("can't create buffer of 10 elements int\n");
        return 1;
    }

    printf("test 4: RW elementary type with overwrite\n");
    if(circ_buffer_create(&buf, 10, uint8_t, true)) {

        uint8_t wr_data[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        uint8_t rd_data[20];

        assert(circ_buffer_size(&buf) == 10);
        assert(circ_buffer_free(&buf) == 10);
        assert(circ_buffer_used(&buf) == 0);
        assert(circ_buffer_put(&buf, wr_data, 3) == 3);
        assert(circ_buffer_free(&buf) == 7);
        assert(circ_buffer_used(&buf) == 3);
        assert(circ_buffer_get(&buf, rd_data, sizeof(rd_data)) == 3);
        assert(memcmp(rd_data, wr_data, 3) == 0);
        assert(circ_buffer_free(&buf) == 10);
        assert(circ_buffer_used(&buf) == 0);
        assert(circ_buffer_put(&buf, wr_data, sizeof(wr_data)) == 15);
        assert(circ_buffer_free(&buf) == 0);
        assert(circ_buffer_used(&buf) == 10);
        assert(circ_buffer_get(&buf, rd_data, 5) == 5);
        uint8_t pattern1[] = {6,7,8,9,10};
        assert(memcmp(rd_data, pattern1, 5) == 0);
        assert(circ_buffer_free(&buf) == 5);
        assert(circ_buffer_used(&buf) == 5);
        assert(circ_buffer_put(&buf, wr_data, 3) == 3);
        assert(circ_buffer_get(&buf, rd_data, 7) == 7);
        uint8_t pattern2[] = {11,12,13,14,15,1,2};
        assert(memcmp(rd_data, pattern2, 7) == 0);
        assert(circ_buffer_used(&buf) == 1);
        assert(circ_buffer_put(&buf, wr_data, 9) == 9);
        assert(circ_buffer_used(&buf) == 10);
        assert(circ_buffer_get(&buf, rd_data, sizeof(rd_data)) == 10);
        uint8_t pattern3[] = {3,1,2,3,4,5,6,7,8,9};
        assert(memcmp(rd_data, pattern3, 10) == 0);
        assert(circ_buffer_used(&buf) == 0);

        circ_buffer_destroy(&buf);
    } else {
        printf("can't create buffer of 10 elements uint8_t\n");
        return 1;
    }

    printf("test 5: RW multi-byte type with overwrite\n");
    if(circ_buffer_create(&buf, 10, int, true)) {

        int wr_data[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        int rd_data[20];

        assert(circ_buffer_size(&buf) == 10);
        assert(circ_buffer_free(&buf) == 10);
        assert(circ_buffer_used(&buf) == 0);
        assert(circ_buffer_put(&buf, wr_data, 3) == 3);
        assert(circ_buffer_free(&buf) == 7);
        assert(circ_buffer_used(&buf) == 3);
        assert(circ_buffer_get(&buf, rd_data, sizeof(rd_data)/sizeof(int)) == 3);
        assert(memcmp(rd_data, wr_data, 3*sizeof(int)) == 0);
        assert(circ_buffer_free(&buf) == 10);
        assert(circ_buffer_used(&buf) == 0);
        assert(circ_buffer_put(&buf, wr_data, sizeof(wr_data)/sizeof(int)) == 15);
        assert(circ_buffer_free(&buf) == 0);
        assert(circ_buffer_used(&buf) == 10);
        assert(circ_buffer_get(&buf, rd_data, 5) == 5);
        int pattern1[] = {6,7,8,9,10};
        assert(memcmp(rd_data, pattern1, 5*sizeof(int)) == 0);
        assert(circ_buffer_free(&buf) == 5);
        assert(circ_buffer_used(&buf) == 5);
        assert(circ_buffer_put(&buf, wr_data, 3) == 3);
        assert(circ_buffer_get(&buf, rd_data, 7) == 7);
        int pattern2[] = {11,12,13,14,15,1,2};
        assert(memcmp(rd_data, pattern2, 7*sizeof(int)) == 0);
        assert(circ_buffer_used(&buf) == 1);
        assert(circ_buffer_put(&buf, wr_data, 9) == 9);
        assert(circ_buffer_used(&buf) == 10);
        assert(circ_buffer_get(&buf, rd_data, sizeof(rd_data)/sizeof(int)) == 10);
        int pattern3[] = {3,1,2,3,4,5,6,7,8,9};
        assert(memcmp(rd_data, pattern3, 10*sizeof(int)) == 0);
        assert(circ_buffer_used(&buf) == 0);

        circ_buffer_destroy(&buf);
    } else {
        printf("can't create buffer of 10 elements int\n");
        return 1;
    }

    printf("test 6: check retrieved data with overwrite\n");
    if(circ_buffer_create(&buf, 10, int, true)) {

        int wr_data[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
        int rd_data[20];
        int bt = 0;

        assert(circ_buffer_put(&buf, wr_data, 3) == 3);
        assert(circ_buffer_element(&buf, 5, &bt) == false);
        assert(circ_buffer_element(&buf, 1, &bt) == true);
        assert(bt == 2);
        assert(circ_buffer_used(&buf) == 3);
        assert(circ_buffer_get(&buf, rd_data, 2) == 2);
        assert(circ_buffer_used(&buf) == 1);
        assert(circ_buffer_element(&buf, 0, &bt) == true);
        assert(bt == 3);
        assert(circ_buffer_put(&buf, wr_data, sizeof(wr_data)/sizeof(int)) == 15);
        assert(circ_buffer_element(&buf, 9, &bt) == true);
        assert(bt == 15);
        assert(circ_buffer_element(&buf, 6, &bt) == true);
        assert(bt == 12);
        assert(circ_buffer_elements(&buf, 6, rd_data, sizeof(rd_data)/sizeof(int)) == 4);
        int pattern1[] = {12,13,14,15};
        assert(memcmp(rd_data, pattern1, 4*sizeof(int)) == 0);
        assert(circ_buffer_get(&buf, rd_data, 4) == 4);
        assert(circ_buffer_elements(&buf, 6, rd_data, sizeof(rd_data)/sizeof(int)) == 0);
        circ_buffer_clear(&buf);
        assert(circ_buffer_used(&buf) == 0);
        assert(circ_buffer_elements(&buf, 0, rd_data, sizeof(rd_data)/sizeof(int)) == 0);

        circ_buffer_destroy(&buf);
    } else {
        printf("can't create buffer of 10 elements int\n");
        return 1;
    }

    printf("all tests passed\n");

    return 0;
}
