#ifndef STD_COMMON_H
#define STD_COMMON_H

#include <stdint.h>


#define kernel_begin_critical() __asm__("cli");
#define kernel_end_critical() __asm__("sti");

#define CLI() __asm__ volatile("cli")
#define STI() __asm__ volatile("sti")
#define HLT() __asm__ volatile("hlt")

#ifndef NULL
#define NULL (0)
#endif

//if the memory layout of this changes, kernel/util/interrupts/interrupt.s must be changed as well
//to correct offsets
typedef struct {
	uint32_t gs, fs, es, ds;
	uint32_t edi, esi, ebp, esp, ebx, edx, ecx, eax;
	uint32_t int_no, err_code;
	uint32_t eip, cs, eflags, useresp, ss;
} __attribute__((packed)) registers_t;

typedef void (*handler_t)(registers_t*);



//returns if interrupts are on
char interrupts_enabled(void);

//requests CPUID
void cpuid(int code, uint32_t* a, uint32_t* d);


#endif // STD_COMMON_H
