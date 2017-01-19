#ifndef STD_ARRAY_M_H
#define STD_ARRAY_M_H

#include <stdint.h>

typedef void* type_t;

typedef struct {
	type_t* array;
	int32_t size;
	int32_t max_size;
} array_m;

//create mutable array
array_m* array_m_create(int32_t max_size);
array_m* array_m_place(void* addr, int32_t max_size);

//destroy mutable array
void array_m_destroy(array_m* array);

//add item to array
void array_m_insert(array_m* array, type_t item);

//lookup item at index i
type_t array_m_lookup(array_m* array, int32_t i);

//find index of item
int32_t array_m_index(array_m* array, type_t item);

//deletes item at location i from the array
void array_m_remove(array_m* array, int32_t i);


#endif
