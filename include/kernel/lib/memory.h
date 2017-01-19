#ifndef MEMORY_H
#define MEMORY_H

#include <stddef.h>


int memcmp(const void*, const void*, size_t);
void* memcpy(void* __restrict, const void* __restrict, size_t);
void* memmove(void*, const void*, size_t);
void* memset(void*, int, size_t);
void memadd(void*, void*, size_t);
void* calloc(size_t num, size_t size);
void* realloc(void* ptr, size_t size);


#endif // STD_MEMORY_H
