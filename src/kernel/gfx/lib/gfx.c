#include <gfx/lib/gfx.h>
#include <drivers/terminal.h>

void switch_to_text() {
	//do nothing if we're already in terminal mode
	/*
	if (!current_screen) {
		return;
	}
	*/

	regs16_t regs;
	regs.ax = 0x0003;
	int32(0x10, &regs);
	term_scroll(TERM_SCROLL_UP);
}
