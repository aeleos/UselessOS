#include <cpu/descriptor_tables.h>
#include <lib/printf.h>
#include <lib/memory.h>


static gdt_entry_t gdt_entries[6];
static gdt_entry_ptr_t gdt_ptr;
static idt_entry_t idt_entries[256];
static idt_entry_ptr_t idt_entry_ptr;

static tss_entry_t tss = {
	.ss0 = 0x10, /* Kernel Data Segment */
	.esp0 = 0,
	.es = 0x10,  /* Kernel Data Segment */
	.cs = 0x08,  /* Kernel Code Segment */
	.ds = 0x13,  /* Kernel Data Segment */
	.fs = 0x13,  /* Kernel Data Segment */
	.gs = 0x13   /* Kernel Data Segment */
};

void install_gdt() {
	gdt_ptr.limit = (sizeof(gdt_entry_t)*6) - 1;
	gdt_ptr.base = (uint32_t) &gdt_entries;

	gdt_set_entry(0, 0, 0, 0, 0);                // Null segment
	gdt_set_entry(1, 0, 0xFFFFFFFF, 0x9A, 0xCF); // Code segment
	gdt_set_entry(2, 0, 0xFFFFFFFF, 0x92, 0xCF); // Data segment
	gdt_set_entry(3, 0, 0xFFFFFFFF, 0xFA, 0xCF); // User mode code segment
	gdt_set_entry(4, 0, 0xFFFFFFFF, 0xF2, 0xCF); // User mode data segment

	gdt_write_tss(5, 0x10, 0x00);

	gdt_load((uintptr_t) &gdt_ptr);

	__asm__("mov $0x2B, %ax\n"
	    "ltr %ax\n");
	printf_info("GDT Initialized at 0x%X with a size of %dB", &gdt_entries, gdt_ptr.limit);
  print_ok();
}

void install_idt() {
	idt_entry_ptr.limit = sizeof(idt_entry_t)*256 - 1;
	idt_entry_ptr.base = (uint32_t) &idt_entries;

	memset(&idt_entries, 0, sizeof(idt_entry_t)*256);

	idt_set_entry(0, (uint32_t) isr0, 0x08, 0x8E);
	idt_set_entry(1, (uint32_t) isr1, 0x08, 0x8E);
	idt_set_entry(2, (uint32_t) isr2, 0x08, 0x8E);
	idt_set_entry(3, (uint32_t) isr3, 0x08, 0x8E);
	idt_set_entry(4, (uint32_t) isr4, 0x08, 0x8E);
	idt_set_entry(5, (uint32_t) isr5, 0x08, 0x8E);
	idt_set_entry(6, (uint32_t) isr6, 0x08, 0x8E);
	idt_set_entry(7, (uint32_t) isr7, 0x08, 0x8E);
	idt_set_entry(8, (uint32_t) isr8, 0x08, 0x8E);
	idt_set_entry(9, (uint32_t) isr9, 0x08, 0x8E);
	idt_set_entry(10, (uint32_t) isr10, 0x08, 0x8E);
	idt_set_entry(11, (uint32_t) isr11, 0x08, 0x8E);
	idt_set_entry(12, (uint32_t) isr12, 0x08, 0x8E);
	idt_set_entry(13, (uint32_t) isr13, 0x08, 0x8E);
	idt_set_entry(14, (uint32_t) isr14, 0x08, 0x8E);
	idt_set_entry(15, (uint32_t) isr15, 0x08, 0x8E);
	idt_set_entry(16, (uint32_t) isr16, 0x08, 0x8E);
	idt_set_entry(17, (uint32_t) isr17, 0x08, 0x8E);
	idt_set_entry(18, (uint32_t) isr18, 0x08, 0x8E);
	idt_set_entry(19, (uint32_t) isr19, 0x08, 0x8E);
	idt_set_entry(20, (uint32_t) isr20, 0x08, 0x8E);
	idt_set_entry(21, (uint32_t) isr21, 0x08, 0x8E);
	idt_set_entry(22, (uint32_t) isr22, 0x08, 0x8E);
	idt_set_entry(23, (uint32_t) isr23, 0x08, 0x8E);
	idt_set_entry(24, (uint32_t) isr24, 0x08, 0x8E);
	idt_set_entry(25, (uint32_t) isr25, 0x08, 0x8E);
	idt_set_entry(26, (uint32_t) isr26, 0x08, 0x8E);
	idt_set_entry(27, (uint32_t) isr27, 0x08, 0x8E);
	idt_set_entry(28, (uint32_t) isr28, 0x08, 0x8E);
	idt_set_entry(29, (uint32_t) isr29, 0x08, 0x8E);
	idt_set_entry(30, (uint32_t) isr30, 0x08, 0x8E);
	idt_set_entry(31, (uint32_t) isr31, 0x08, 0x8E);
	idt_set_entry(48, (uint32_t) isr48, 0x08, 0x8E);

	idt_load((uintptr_t) &idt_entry_ptr);
	printf_info("IDT Initialized at 0x%X with a size of %dB", &idt_entries, idt_entry_ptr.limit);
  print_ok();

}


void gdt_set_entry(uint32_t num, uint32_t base, uint32_t limit, uint8_t access, uint8_t granularity) {
	gdt_entries[num].base_low = (base & 0xFFFF);
	gdt_entries[num].base_middle = (base >> 16) & 0xFF;
	gdt_entries[num].base_high = (base >> 24) & 0xFF;

	gdt_entries[num].limit_low = (limit & 0xFFFF);
	gdt_entries[num].granularity = (limit >> 16) & 0x0F;

	gdt_entries[num].granularity |= granularity & 0xF0;
	gdt_entries[num].access	= access;
}

// Taken from ToaruOS
void gdt_write_tss(uint32_t num, uint32_t ss0, uint32_t esp0) {
	uintptr_t base = (uintptr_t) &tss;
	uintptr_t limit = base + sizeof(tss);

	/* Add the TSS descriptor to the GDT */
	gdt_set_entry(num, base, limit, 0xE9, 0x00);

	memset(&tss, 0x00, sizeof(tss));

	tss.ss0 = ss0;
	tss.esp0 = esp0;
	tss.cs = 0x0b;
	tss.ss = 0x13;
	tss.ds = 0x13;
	tss.es = 0x13;
	tss.fs = 0x13;
	tss.gs = 0x13;

	tss.iomap_base = sizeof(tss);
}

void gdt_set_kernel_stack(uintptr_t stack) {
	tss.esp0 = stack;
}


void idt_set_entry(uint8_t num, uint32_t base, uint16_t selector, uint8_t flags) {
	idt_entries[num].base_low = base & 0xFFFF;
	idt_entries[num].base_high = (base >> 16) & 0xFFFF;

	idt_entries[num].selector = selector;
	idt_entries[num].zero = 0;
	idt_entries[num].flags	= flags /* | 0x60 */;
}
