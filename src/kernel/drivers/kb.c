#include <drivers/kb.h>
#include <drivers/kb_us.h>
#include <lib/common.h>
#include <cpu/isr.h>
#include <sys/sysfunc.h>
#include <drivers/kbman.h>
#include <lib/printf.h>


char USasciiNonShift[] = {
0, ESC, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', BACKSPACE,
TAB, 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', ENTER, 0,
'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '`', 0, '\\',
'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', 0, 0, 0, ' ', 0,
KF1, KF2, KF3, KF4, KF5, KF6, KF7, KF8, KF9, KF10, 0, 0,
KHOME, KUP, KPGUP,'-', KLEFT, '5', KRIGHT, '+', KEND, KDOWN, KPGDN, KINS, KDEL, 0, 0, 0, KF11, KF12 };

void kb_callback(registers_t regs);

keymap_t* layout;

//index into circular buffer of kb data
uint32_t kb_buffer_start;
uint32_t kb_buffer_end;
//circular buffer of kb data
char kb_buffer[256];

void kb_install() {
	printf_info("Initializing keyboard driver...");
  print_ok();

	irq_register_handler(IRQ1, &kb_callback);
	switch_layout(&kb_us);

	kb_buffer_start = 0;
	kb_buffer_end = 0;
}

char kgetch() {
	// printf("getch start %d end %d\n", kb_buffer_start, kb_buffer_end);
	if (kb_buffer_start != kb_buffer_end) {
		char c = kb_buffer[kb_buffer_start++];
		//if we went out of bounds, wrap to start of buffer
		kb_buffer_start &= 255;
		return c;
	}
	//no characters available
	return '\0';
}

char getchar() {
	// sys_yield(KB_WAIT);
	return kgetch();
}

uint8_t haskey() {
	return (kb_buffer_start != kb_buffer_end);
}

void switch_layout(keymap_t* new) {
	layout = new;
}

key_status_t kb_modifiers() {
	return layout->controls;
}

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
void kb_callback(registers_t regs) {
	uint8_t scancode = inb(0x60);

	//check if key was released
	if (scancode & RELEASED_MASK) {
		//modifier flags stored in first 5 bits
		for (int i = 0; i < 5; i++) {
			if (layout->control_map[i] == (scancode & ~RELEASED_MASK)) {
				//releasing key always disables its function
				layout->controls &= ~(1 << i);
				return;
			}
		}

		//inform OS
		//clear released bit
		scancode &= ~RELEASED_MASK;
		kbman_process_release(layout->scancodes[scancode]);
	}
	else {
		//was this a control key?
		//also invert bit in status map
		for (int i = 0; i < 8; i++) {
			if (layout->control_map[i] == scancode) {
				//if bit was set, delete it
				if (layout->controls & 1 << i) {
					layout->controls &= ~(1 << i);
				}
				//set it
				else {
					layout->controls |= 1 << i;
				}
				return;
			}
		}

		//non-control key
		//get uppercase/lowecase version depending on control keys status
		uint8_t* scancodes = layout->scancodes;
		if ((layout->controls & (LSHIFT | RSHIFT | CAPSLOCK)) && !(layout->controls & CONTROL)) {
			scancodes = layout->shift_scancodes;
		}

		//don't overflow buffer if possible :p
		if (kb_buffer_end != kb_buffer_start - 1) {
			kb_buffer[kb_buffer_end++] = USasciiNonShift[scancode];
      // printf("%c\n", USasciiNonShift[scancode]);
      // printf("%d\n", scancode);
			kb_buffer_end &= 255;
		}

		//inform OS of keypress
		kbman_process(USasciiNonShift[scancode]);
	}
}
#pragma GCC diagnostic pop
