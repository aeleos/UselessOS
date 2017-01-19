#ifndef STD_COMMON_H
#define STD_COMMON_H

#include <stdint.h>


#define kernel_begin_critical() __asm__("cli");
#define kernel_end_critical() __asm__("sti");
//if the memory layout of this changes, kernel/util/interrupts/interrupt.s must be changed as well
//to correct offsets
typedef struct registers {
	unsigned int gs, fs, es, ds;				//segment registers
	unsigned int edi, esi, ebp, esp, ebx, edx, ecx, eax;	//pushed by pusha
	unsigned int int_no, err_code; 				//interrupt number and error code
	unsigned int eip, cs, eflags, useresp, ss;		//pushed by the processor automatically
} registers_t;


//returns if interrupts are on
char interrupts_enabled(void);

//requests CPUID
void cpuid(int code, uint32_t* a, uint32_t* d);


#endif // STD_COMMON_H
