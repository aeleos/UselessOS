#ifndef SYSFUNC_H
#define SYSFUNC_H

#include <sys/syscall.h>
#include <sys/task.h>
#include <lib/types.h>
#include <sys/fs.h>

//installs common syscalls into syscall table
void create_sysfuncs();

//Standard terminal driver puts
DECL_SYSCALL1(terminal_writestring, const char*);

//Standard terminal driver putc
DECL_SYSCALL1(terminal_putchar, char);

//Yeilds current process's running state to a different process
//Typically invoked if process is blocked by I/O, or sleeping
DECL_SYSCALL1(yield, task_state);

//Standard read syscall
//reads at most count characters into buf using file descriptor fd
DECL_SYSCALL3(read, int, void*, size_t);

#endif
