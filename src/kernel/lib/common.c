#include <lib/common.h>


//returns if interrupts are on
char interrupts_enabled(void) {
	unsigned long flags;
	__asm__ volatile("	\
		pushf;	\
		pop %0;	\
		" : "=g"(flags));
	return flags & (1 << 9);
}

//requests CPUID
void cpuid(int code, uint32_t* a, uint32_t* d) {
	__asm__ volatile("cpuid" : "=a"(*a), "=d"(*d) : "0"(code) : "ebx", "ecx");
}
