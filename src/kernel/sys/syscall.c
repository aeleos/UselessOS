#include <sys/syscall.h>
#include <sys/sysfunc.h>
#include <cpu/isr.h>
#include <drivers/terminal.h>
#include <drivers/pit.h>
#include <sys/task.h>
#include <lib/array_m.h>
#include <lib/common.h>
#include <lib/printf.h>

#define MAX_SYSCALLS 128

static void sys_handler(registers_t regs);

array_m* syscalls;

void sys_install() {
	printf_info("Initializing syscalls...");

	isrs_install_handler(0x80, (isr_t)sys_handler);
	syscalls = array_m_create(MAX_SYSCALLS);
	create_sysfuncs();

	print_ok();
}

bool sys_installed() {
	//has the syscalls array been created?
	return (bool)syscalls;
}

void sys_insert(void* syscall) {
	if (syscalls->size + 1 == MAX_SYSCALLS) {
		printf_err("Not installing syscall %d, too many in use!", syscalls->size);
		return;
	}
	array_m_insert(syscalls, syscall);
}

void sys_handler(registers_t regs) {
	//check requested syscall number
	//stored in eax
	if (!syscalls || regs.eax >= MAX_SYSCALLS) {
		printf_err("Syscall %d called but not defined", regs.eax);
		return;
	}

	//location of syscall funcptr
	int (*location)() = (int(*)())array_m_lookup(syscalls, regs.eax);

	//we don't know how many arguments the function wants.
	//so just push them all on the stack in correct order
	//the function will use whatever it wants, and we can just
	//pop it all back off afterwards
	int ret;
	__asm__ volatile("		\
		push %1;	\
		push %2;	\
		push %3;	\
		push %4;	\
		push %5;	\
		call *%6;	\
		pop %%ebx;	\
		pop %%ebx;	\
		pop %%ebx;	\
		pop %%ebx;	\
		pop %%ebx;	\
	" : "=a" (ret) : "r" (regs.edi), "r" (regs.esi), "r" (regs.edx), "r" (regs.ecx), "r" (regs.ebx), "r" (location));
	regs.eax = ret;
}
