#include <sys/mutex.h>
#include <lib/kheap.h>

//atomically test if *ptr == expected
//if so, set *ptr to new
//else, do nothing
static char cmp_swap(int *ptr, int expected, int new_val) {
	unsigned char ret;

	//note: sete sets a byte, not the word
	__asm__ volatile("		\
		lock;		\
		cmpxchgl %2, %1;\
		sete %0;	\
	" : "=q" (ret), "=m" (*ptr)
	: "r" (new_val), "m" (*ptr), "a" (expected)
	: "memory");
	return ret;
}

lock_t* lock_create() {
	lock_t* ret = (lock_t*)kmalloc(sizeof(lock_t));
	ret->flag = 0;
	return ret;
}

void lock(lock_t* lock) {
	while (cmp_swap(&lock->flag, 0, 1) == 1) {
		//spin
		;
	}
}

void unlock(lock_t* lock) {
	lock->flag = 0;
}
