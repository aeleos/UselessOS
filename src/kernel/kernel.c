#include <kernel.h>


#include <boot/multiboot.h>



#include <sys/isr.h>

#include <lib/string.h>
#include <lib/printf.h>




char *fb = (char *) 0x000B8000;
uintptr_t initial_esp = 0;


void print_os_name(void) {
	printf("\x1B[10;[\x1B[11;Useless OS v\x1B[12;0.0.1\x1B[10;]\n");
}



int kernel_main(struct multiboot *mboot_ptr, uint32_t mboot_magic, uintptr_t esp) {
  initial_esp = esp;

  //initialize terminal interface
	terminal_initialize();
  // terminal_writestring("P");
	//introductory message
	print_os_name();
	printf_info("Printing stack\n");
  dump_stack(esp);

  // terminal_writestring("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");

  return 0;
}
