#ifndef PRINTF_H
#define PRINTF_H

#include <drivers/terminal.h>
#include <stdarg.h>

void print_ok();

//standard printf
void printf(char* format, ...);
int putchar(int ch);
//same as above, but outputs to syslog
//(applies to all _k functions listed here)
void printk(char* format, ...);

//debug-priority printf
void printf_dbg(char* format, ...);
void printk_dbg(char* format, ...);

//info-priority printf
void printf_info(char* format, ...);
void printk_info(char* format, ...);

//error-priority printf
void printf_err(char* format, ...);
void printk_err(char* format, ...);

void sprintf(char* str, char* format, ...);

void vprintf_err(const char* format, va_list ap);

#endif
