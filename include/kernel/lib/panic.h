#ifndef STD_PANIC_H
#define STD_PANIC_H

#include <stdint.h>


#define PANIC(msg, ...) panic_msg(__LINE__, __FILE__, msg, ##__VA_ARGS__);
#define ASSERT(cond, msg, ...) if (!(cond)) PANIC(msg, ##__VA_ARGS__)

void panic_msg(uint16_t line, const char* file, const char* msg, ...) __attribute__((__noreturn__));


#endif // STD_PANIC_H
