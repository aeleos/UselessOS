#ifndef PIT_H
#define PIT_H

#include <lib/common.h>

void pit_install(uint32_t frequency);
uint32_t tick_count();

#endif
