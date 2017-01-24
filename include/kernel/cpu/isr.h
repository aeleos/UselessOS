#ifndef ISR_H
#define ISR_H

#include <lib/stdint.h>
#include <lib/common.h>


void isr_register_handler(uint32_t num, handler_t handler);

#endif
