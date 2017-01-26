#ifndef STD_ARRAY_L_H
#define STD_ARRAY_L_H

#include <lib/panic.h>
#include <lib/common.h>
#include <lib/kheap.h>
#include <stdint.h>


typedef void* type_t;

typedef struct array_l_item {
	type_t item;
	struct array_l_item* next;
} array_l_item;

typedef struct {
	array_l_item* head;
	int32_t size;
} array_l;

//create array list
array_l* array_l_create();

//destroy array list
void array_l_destroy(array_l* array);

//add item to array list
void array_l_insert(array_l* array, type_t item);

//lookup item at index idx
__attribute__((always_inline))
inline type_t array_l_lookup(array_l* array, int32_t idx) {
	ASSERT(idx < array->size && idx >= 0, "index (%d) was out of bounds (%d)", idx, array->size - 1);

	//walk list
	array_l_item* tmp = array->head;
	for (int i = 0; i < idx; i++) {
		tmp = tmp->next;
	}
	if (tmp) {
		return tmp->item;
	}
	return NULL;
}

//find index of item
int32_t array_l_index(array_l* array, type_t item);

//deletes item at location i from the array
void array_l_remove(array_l* array, int32_t i);


#endif
