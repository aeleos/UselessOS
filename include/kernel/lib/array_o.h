#ifndef STD_ARRAY_O_H
#define STD_ARRAY_O_H

#include <lib/array_m.h>


//this array is insertion sorted
//it always remains in a sorted state between calls

//predicate should return non-zero if first argument is less than the second
//else return zero
typedef int8_t (*lessthan_predicate_t)(type_t, type_t);
typedef struct {
	uint32_t magic;
	lessthan_predicate_t less_than;
	uint16_t size;
	array_m* array;
} array_o;

//standard less than predicate
int8_t standard_lessthan_predicate(type_t a, type_t b);

//create ordered array
array_o* array_o_create(uint32_t max_size, lessthan_predicate_t less_than);
array_o* array_o_place(void* addr, uint32_t max_size, lessthan_predicate_t less_than);

//destroy ordered array
void array_o_destroy(array_o* array);

//add item to array
void array_o_insert(array_o* array, type_t item);

//lookup item at index i
type_t array_o_lookup(array_o* array, uint32_t i);

//return index of item
uint16_t array_o_index(array_o* array, type_t item);

//deletes item at location i from the array
void array_o_remove(array_o* array, uint32_t i);


#endif // STD_ARRAY_O_H
