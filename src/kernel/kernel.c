#include <kernel.h>


#include <boot/multiboot.h>



#include <sys/isr.h>
#include <sys/descriptor_tables.h>
#include <sys/paging.h>

#include <lib/string.h>
#include <lib/printf.h>

#include <util/tests.h>



char *fb = (char *) 0x000B8000;
uintptr_t initial_esp = 0;


void print_os_name(void) {
	printf("\x1B[10f;[\x1B[11f;Useless OS v\x1B[12f;0.0.1\x1B[10f;]\x1B[15f\n");
}



int kernel_main(struct multiboot *mboot_ptr, uint32_t mboot_magic, uintptr_t esp) {
  initial_esp = esp;

  //initialize terminal interface
	terminal_initialize();
  // terminal_writestring("P");
	//introductory message
	print_os_name();
  // printf("&#93;\n");
  // printf("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789\n");
  test_colors();
	// printf_info("Printing stack\n");
  dump_stack(esp);
  //
  // printf_info("Available memory: ");
  // printf("%d -> %dMB\n", mboot_ptr->mem_upper, (mboot_ptr->mem_upper/1024));
  //
  gdt_install();
	idt_install();
  //
  paging_install();
	// // // sys_install();
  // //
	// // // test_interrupts();
  test_heap();
  // printf("\x1B[h10");
  // terminal_writestring("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");

  return 0;
}
