#include <drivers/pit.h>
#include <cpu/isr.h>
#include <cpu/irq.h>
// #include <kernel.h>
#include <lib/math.h>
#include <lib/common.h>
#include <lib/printf.h>

static volatile uint32_t tick = 0;

//defined in timer.c
//inform that a tick has occured
// void handle_tick(uint32_t tick) {};

static void tick_callback(registers_t regs) {
	tick++;
	// printf("%d\n", tick);

	// handle_tick(tick);
}

uint32_t tick_count() {
	return tick;
}

void pit_install(uint32_t frequency) {
	printf_info("Initializing PIT timer...");


	//firstly, register our timer callback
	irq_register_handler(IRQ0, &tick_callback);

	//value we need to send to PIC is value to divide it's input clock
	//(1193180 Hz) by, to get desired frequency
	//divisor *must* be small enough to fit into 16 bytes
	uint32_t divisor = 1193180 / frequency;

	//send command byte
	outb(0x43, 0x36);

	//divisor has to be sent byte-wise, so split here into upper/lower bytes
	uint8_t l = (uint8_t )(divisor & 0xFF);
	uint8_t h = (uint8_t)((divisor >> 8) & 0xFF);

	//send frequency divisor
	outb(0x40, l);
	outb(0x40, h);
	print_ok();
}
