#include <cpu/irq.h>
#include <lib/panic.h>
#include <lib/printf.h>
#include <lib/common.h>
#include <cpu/descriptor_tables.h>
#include <sys/io.h>


static handler_t irq_handlers[16];

void install_irq() {
	irq_remap();

	idt_set_entry(32, (uint32_t) irq0, 0x08, 0x8E);
	idt_set_entry(33, (uint32_t) irq1, 0x08, 0x8E);
	idt_set_entry(34, (uint32_t) irq2, 0x08, 0x8E);
	idt_set_entry(35, (uint32_t) irq3, 0x08, 0x8E);
	idt_set_entry(36, (uint32_t) irq4, 0x08, 0x8E);
	idt_set_entry(37, (uint32_t) irq5, 0x08, 0x8E);
	idt_set_entry(38, (uint32_t) irq6, 0x08, 0x8E);
	idt_set_entry(39, (uint32_t) irq7, 0x08, 0x8E);
	idt_set_entry(40, (uint32_t) irq8, 0x08, 0x8E);
	idt_set_entry(41, (uint32_t) irq9, 0x08, 0x8E);
	idt_set_entry(42, (uint32_t) irq10, 0x08, 0x8E);
	idt_set_entry(43, (uint32_t) irq11, 0x08, 0x8E);
	idt_set_entry(44, (uint32_t) irq12, 0x08, 0x8E);
	idt_set_entry(45, (uint32_t) irq13, 0x08, 0x8E);
	idt_set_entry(46, (uint32_t) irq14, 0x08, 0x8E);
	idt_set_entry(47, (uint32_t) irq15, 0x08, 0x8E);
	STI();
	printf_info("IRQ Initialized");
  print_ok();
}

void irq_handler(registers_t* regs) {
	uint32_t irq = regs->int_no;

	ASSERT(irq <= IRQ15, "IRQ code less than 47");

	// Handle spurious interrupts
	if (irq == IRQ7 || irq == IRQ15) {
		uint16_t isr = irq_get_isr();

		// If it's a real interrupt, the corresponding bit will be set in the ISR
		// Else, it was probably caused by a solar flare, so do not send EOI
		// If faulty IRQ was sent from the slave PIC, still send EOI to the master
		if (!(isr & (1 << (irq - IRQ0)))) {
			if (irq == IRQ15) {
				irq_send_eoi(IRQ0); // Sort of hackish
			}

			return;
		}
	}

	irq_send_eoi(irq);

	handler_t handler = irq_handlers[irq - IRQ0];

	if (handler) {
		handler(regs);
	}
	else {
		printf("Unhandled IRQ%d\n", irq - IRQ0);
	}

	// IRQs had been disabled before this function was called
	STI();
}

void irq_send_eoi(uint8_t irq) {
	// Send EOI to PIC2 if necessary
	if (irq > IRQ7) {
		outb(PIC2_CMD, PIC_EOI);
	}

	// Send to PIC1
	outb(PIC1_CMD, PIC_EOI);
}

void irq_register_handler(uint8_t irq, handler_t handler) {
	ASSERT(irq >= IRQ0 && irq <= IRQ15, "IRQ code out of range");

	CLI();

	if (!irq_handlers[irq - IRQ0]) {
		irq_handlers[irq - IRQ0] = handler;
	}
	else {
		printf("IRQ %d already registered\n", irq);
	}

	STI();
}

void irq_remap() {
	outb(0x20, 0x11);
	outb(0xA0, 0x11);
	outb(0x21, 0x20);
	outb(0xA1, 0x28);
	outb(0x21, 0x04);
	outb(0xA1, 0x02);
	outb(0x21, 0x01);
	outb(0xA1, 0x01);
	outb(0x21, 0x0);
	outb(0xA1, 0x0);
}

uint16_t irq_get_isr() {
	outb(PIC1, PIC_ISR);
	outb(PIC2, PIC_ISR);

	return (inb(PIC2) << 8) | inb(PIC1);
}

uint16_t irq_getmask(uint16_t pic) {
	return ins(pic);
}

void irq_setmask(uint16_t pic, uint16_t mask) {
	outs(pic, mask);
}

// Sets an IRQ number to hide
void irq_mask(uint8_t irq) {
	uint16_t pic = 0;

	if (irq < 8) {
		pic = PIC1_DATA;
	}
	else {
		pic = PIC2_DATA;
		irq -= 8; // from range 8-15 to 0-7
	}

	uint16_t mask = irq_getmask(pic);
	mask |= (1 << irq);
	irq_setmask(pic, mask);
}

void irq_unmask(uint8_t irq) {
	uint16_t pic = 0;

	if (irq < 8) {
		pic = PIC1_DATA;
	}
	else {
		pic = PIC2_DATA;
		irq -= 8;
	}

	uint16_t mask = irq_getmask(pic);
	mask &= ~(1 << mask);
	irq_setmask(pic, mask);
}
