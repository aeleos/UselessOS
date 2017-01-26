#include <sys/stack.h>
#include <lib/common.h>
#include <lib/memory.h>
#include <sys/paging.h>

extern page_directory_t* current_directory;
extern uint32_t initial_esp;

void move_stack(void* new_stack_start, uint32_t size) {
	//allocate space for new stack
	for (uint32_t i = (uint32_t)new_stack_start; i >= ((uint32_t)new_stack_start - size); i -= 0x1000) {
		//general purpose stack is user mode
		alloc_frame(get_page(i, 1, current_directory), 0, 1);
	}

  printf("here1");
	//flush TLB by reading and writing page directory address again
	uint32_t pd_addr;
	__asm__ volatile("mov %%cr3, %0" : "=r" (pd_addr));
	__asm__ volatile("mov %0, %%cr3" : : "r" (pd_addr));
  printf("here2");

	//old ESP and EBP
	uint32_t old_sp;
	__asm__ volatile("mov %%esp, %0" : "=r" (old_sp));
	uint32_t old_bp;
	__asm__ volatile("mov %%ebp, %0" : "=r" (old_bp));
  printf("here3");

	//offset to add to old stack addresses to get new stack address
	uint32_t offset = (uint32_t)new_stack_start - initial_esp;

	//new esp and ebp
	uint32_t new_sp = old_sp + offset;
	uint32_t new_bp = old_bp + offset;

	//copy stack!
	memcpy((void*)new_sp, (void*)old_sp, initial_esp - old_sp);
  printf("here");

	//backtrace through original stack, copying new values into new stack
	for (uint32_t i = (uint32_t)new_stack_start; i > (uint32_t)new_stack_start - size; i -= 4) {
		uint32_t tmp = *(uint32_t*)i;
		//if value of tmp is inside range of old stack,
		//assume it's a base pointer and remap it
		//TODO keep in mind this will remap ANY value in this range,
		//whether it's a base pointer or not
		if ((old_sp < tmp) && (tmp < initial_esp)) {
			tmp = tmp + offset;
			uint32_t* tmp2 = (uint32_t*)i;
			*tmp2 = tmp;
		}
	}
  printf("here");

	//change stacks
	__asm__ volatile("mov %0, %%esp" : : "r" (new_sp));
	__asm__ volatile("mov %0, %%ebp" : : "r" (new_bp));
  printf("here");

}
