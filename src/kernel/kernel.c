#include <boot/multiboot.h>
#include <drivers/terminal.h>
#include <lib/printf.h>
#include <drivers/pit.h>

char *fb = (char *) 0x000B8000;
uintptr_t initial_esp = 0;



void print_os_name(void) {
	printf("\x1B[10f;[\x1B[11f;Useless OS v\x1B[12f;0.0.1\x1B[10f;]\x1B[15f\n");
}



int kernel_main(struct multiboot *mboot_ptr, uint32_t mboot_magic, uintptr_t esp) {
  // initial_esp = esp;

  terminal_initialize();

  print_os_name();

  printf_info("Available memory:  ");
  printf("%d -> %dMB\n", mboot_ptr->mem_upper, (mboot_ptr->mem_upper/1024));

	init_gdt();
	init_idt();
	init_irq();
  pit_install(1000);
  while(1){}
}
