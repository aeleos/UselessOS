#ifndef STD_KHEAP_H
#define STD_KHEAP_H

#include <lib/array_o.h>
#include <lib/stdbool.h>
#include <stdint.h>



//page aligned
void* kmalloc_a(uint32_t sz);

//returns physical address
void* kmalloc_p(uint32_t sz, uint32_t* phys);

//page aligned and returns physical address
void* kmalloc_ap(uint32_t sz, uint32_t* phys);

//private functions/macros required for kmalloc macro
//TODO figure out how to hide these while keeping kmalloc public
void* kmalloc_real(uint32_t sz);
void kmalloc_track_int(char* file, int line, uint32_t size);
#define kmalloc_track(bytes) ({ kmalloc_track_int(__FILE__, __LINE__, bytes); kmalloc_real(bytes); })
#define kmalloc(bytes) kmalloc_track(bytes)

#define KHEAP_START			0xC0000000
#define KHEAP_INITIAL_SIZE	0x6000000
#define KHEAP_MAX_ADDRESS 	0xCFFFF000

#define HEAP_MAGIC			0xCAFEBABE
#define HEAP_MIN_SIZE		0x70000
#define MIN_BLOCK_SIZE		0x10

//size information for hole/block
typedef struct alloc_block_t {
	uint32_t magic; //magic number
	struct alloc_block_t* next;
	struct alloc_block_t* prev;
	bool free; //is this block in use?
	uint32_t size; //usable size
} alloc_block_t;

typedef struct {
	uint32_t start_address; //start of allocated space
	uint32_t end_address; //end of allocated space (can be expanded up to max_address)
	uint32_t max_address; //maximum address heap can be expanded to
	uint8_t supervisor; //should new pages mapped be marked as kernel mode?
	uint8_t readonly; //should new pages mapped be marked as read-only?
} heap_t;

//create new heap
heap_t* create_heap(uint32_t start, uint32_t end, uint32_t max, uint8_t supervisor, uint8_t readonly);

//allocates contiguous region of memory of size 'size'. If aligned, creates block starting on page boundary
void* alloc(uint32_t size, uint8_t page_align, heap_t* heap);

//releases block allocated with alloc
void free(void* p, heap_t* heap);

//releases block allocated with alloc using current heap
void kfree(void* p);

//enlarges heap to new_size
void expand(uint32_t new_size, heap_t* heap);

//returns number of bytes currently in use by heap
uint32_t used_mem();

//debug function to dump last 'count' kernel heap allocs
//if 'count' is larger than total heap allocations, or
//count is -1, prints all heap allocations
//outputs to syslog
void heap_print(int count);

//debug function to dump amounts of memory in use by axle source files
//outputs to syslog
void memdebug();

//internal function to traverse heap and verify that
//no heap data has been corrupted
//on failure, kills current process
void heap_verify_integrity();


#endif // STD_KHEAP_H
