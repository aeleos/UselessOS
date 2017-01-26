#include <cpu/isr.h>
#include <lib/panic.h>
#include <lib/printf.h>
#include <lib/stdbool.h>
#include <lib/ctype.h>
#include <lib/types.h>

void halt_execution() {
	//disable interrupts so this never ends
	kernel_begin_critical();

	//enter infinite loop
	printf_err("Halting execution");
	do {} while (1);
}

void print_regs(registers_t regs) {
    printf("\n==============================    registers    ================================\n");
	printf("eax: %x		ecx: %x		edx: %x		ebx: %x\n", regs.eax, regs.ecx, regs.edx, regs.ebx);
	printf("esp: %x		ebp: %x 	esi: %x		edi: %x\n", regs.esp, regs.ebp, regs.esi, regs.edi);
	printf("eip: %x		int: %x		err: %x		cs:  %x\n", regs.eip, regs.int_no, regs.err_code, regs.cs);
	printf("useresp: %x ss:  %x		efl: %x\n", regs.useresp, regs.ss, regs.eflags);
	printf("gs:  %x		fs:	 %x		es:  %x		ds:  %x\n", regs.gs, regs.fs, regs.es, regs.ds);
}


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wsequence-point"
//TODO: figure out undefinedness of "esp--"
void dump_stack(uint32_t* esp) {
	printk("dump @ %x\n", esp);

	//jump back 16 bytes
	//4 bytes in a uint32_t
	//16 / 4 == 4
	esp -= 4;

	for (int i = 0; i < 8; i++) {
		uint32_t* current_base = esp;
		printk("[%x] ", esp);
		//print each byte in word
		for (int j = 0; j < 4; j++) {
			printk("%x ", *(esp++));
		}

#define GET_BYTE(number, byte_idx) (number >> (8*byte_idx)) & 0xff
		//we want to print out every byte of the 4 words we just printed out
		for (int i = 0; i < 4; i++) {
			uint32_t* ptr = current_base;
			//for each byte in current word
			for (size_t j = 0; j < sizeof(uint32_t); j++) {
				uint8_t val = GET_BYTE(*ptr, j);
				if (isalnum(val)) {
					printk("%c", val);
				}
				else {
					printk(".");
				}
			}
			ptr++;
		}
		printk("\n");
	}
}
#pragma GCC diagnostic pop

void common_halt(registers_t regs, bool recoverable) {
	//print out register info for debugging
	print_regs(regs);

	if (!recoverable) {
		//stop everything so we don't triple fault
		halt_execution();
	}
}

void print_selector_error_code(uint32_t err_code) {
	printf_err("Selector error code %x interpreted below", err_code);

	if (err_code & 0xF) printf_err("Exception originated outside processor");
	else printf_err("Exception occurred inside processor");

	if (err_code & 0x00) printf_err("Selector index references descriptor in GDT");
	else if (err_code & 0x01) printf_err("Selector index references descriptor in IDT");
	else if (err_code & 0x10) printf_err("Selector index references descriptor in LDT");
	else if (err_code & 0x11) printf_err("Selector index references descruptor in IDT");

	printf_info("Selector index follows");
	//TODO print index
	//index is bits 3 to 15 (13 bits)
}

void handle_divide_by_zero(registers_t regs) {
	printf_err("Attempted division by zero");
	common_halt(regs, false);
}

void handle_bound_range_exceeded(registers_t regs) {
	printf_err("Bound range exception");
	common_halt(regs, false);
}

void handle_invalid_opcode(registers_t regs) {
	printf_err("Invalid opcode encountered");
	common_halt(regs, false);
}

void handle_device_not_available(registers_t regs) {
	printf_err("Device not available");
	common_halt(regs, false);
}

void handle_double_fault(registers_t regs) {
	printf_err("=======================");
	printf_err("Caught double fault!");
	printf_err("=======================");
	common_halt(regs, false);
}

void handle_invalid_tss(registers_t regs) {
	printf_err("Invalid TSS section!");
	print_selector_error_code(regs.err_code);
	common_halt(regs, false);
}

void handle_segment_not_present(registers_t regs) {
	printf_err("Segment not present");
	print_selector_error_code(regs.err_code);
	common_halt(regs, false);
}

void handle_stack_segment_fault(registers_t regs) {
	printf_err("Stack segment fault");
	print_selector_error_code(regs.err_code);
	common_halt(regs, false);
}

void handle_general_protection_fault(registers_t regs) {
	printf_err("General protection fault");
	print_selector_error_code(regs.err_code);
	common_halt(regs, false);
}

void handle_floating_point_exception(registers_t regs) {
	printf_err("Floating point exception");
	common_halt(regs, false);
}

void handle_alignment_check(registers_t regs) {
	printf_err("Alignment check");
	common_halt(regs, false);
}

void handle_machine_check(registers_t regs) {
	printf_err("Machine check");
	common_halt(regs, false);
}

void handle_virtualization_exception(registers_t regs) {
	printf_err("Virtualization exception");
	common_halt(regs, false);
}


static char* exception_msgs[] = {
	"Division By Zero",
	"Debugger",
	"Non-Maskable Interrupt",
	"Breakpoint",
	"Overflow",
	"Bounds",
	"Invalid Opcode",
	"Coprocessor Not Available",
	"Double fault",
	"Coprocessor Segment Overrun",
	"Invalid Task State Segment",
	"Segment Not Present",
	"Stack Fault",
	"General Protection Fault",
	"Page Fault",
	"Reserved",
	"Math Fault",
	"Alignement Check",
	"Machine Check",
	"SIMD Floating-Point Exception",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
	"Reserved",
};

static handler_t isrs_handlers[256];

void isrs_handler(registers_t* regs) {
	ASSERT(regs->int_no < 256, "less than 256 regs");

	if (isrs_handlers[regs->int_no]) {
		handler_t handler = isrs_handlers[regs->int_no];
		handler(regs);
	}
	else {
		terminal_clear();
    printf_err("Unhandled ISR: %d", regs->int_no);
		common_halt(*regs, true);
	}
}


void isrs_install_handler(uint32_t num, handler_t handler) {
	ASSERT(num < 256, "less than 256 regs");

	if (isrs_handlers[num]) {
		printf("Exception handler %d (%s) already registered\n", num,
			exception_msgs[num]);
	}
	else {
		isrs_handlers[num] = handler;
	}
}

void isrs_uninstall_handler(uint32_t num) {
  isrs_handlers[num] = 0;
}
