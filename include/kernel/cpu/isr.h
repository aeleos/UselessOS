#ifndef ISR_H
#define ISR_H

#include <lib/stdint.h>
#include <lib/common.h>


#define IRQ0  32
#define IRQ1  33
#define IRQ2  34
#define IRQ3  35
#define IRQ4  36
#define IRQ5  37
#define IRQ6  38
#define IRQ7  39
#define IRQ8  40
#define IRQ9  41
#define IRQ10 42
#define IRQ11 43
#define IRQ12 44
#define IRQ13 45
#define IRQ14 46
#define IRQ15 47

//enables registration of callbacks for interrupts or IRQs
//for IRQs, to ease confusion, use #defines above
//as first parameter
typedef void (*isr_t)(registers_t);
void isrs_install_handler(uint32_t num, handler_t handler);
void isrs_uninstall_handler(uint32_t num);
void isr_install_default();
void pic_acknowledge(unsigned int interrupt);

//debug function
//dumps memory around 'ptr' to kernel log
void dump_stack(uint32_t* ptr);


#endif
