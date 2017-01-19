#include <drivers/terminal.h>
#include <drivers/kbman.h>

#include <lib/panic.h>
#include <lib/ctype.h>
#include <lib/array_m.h>
#include <lib/kheap.h>
#include <lib/memory.h>
#include <lib/string.h>
#include <lib/printf.h>

#include <sys/mutex.h>
#include <sys/io.h>

#define TERM_HISTORY_MAX 2048

/// Shared lock to keep all terminal operations atomic
static lock_t* mutex;

/// Combines a foreground and background color
typedef union rawcolor {
	struct {
		term_color fg : 4;
		term_color bg : 4;
	};
	uint8_t raw;
} rawcolor;

/// Internal structure of the terminal buffer
typedef union term_display {
	uint16_t grid[TERM_HEIGHT][TERM_WIDTH];
	uint16_t mem[TERM_AREA];
} term_display;

/// Internal scroll state
typedef struct term_scroll_state {
	int height;
} term_scroll_t;

/// Current scroll state
term_scroll_t scroll_state;

/// Current position of the terminal cursor
static struct term_cursor g_cursor_pos;

/// Current foreground and background color for newly written text
static rawcolor g_terminal_color;

/// Screen buffer for the terminal
static term_display* const g_terminal_buffer = (term_display*)0xB8000;

/// Buffer to keep track of terminal history, not just what's currently visible
array_m* term_history;

/// Keeps state of when we're redrawing the terminal while scrolling
/// No history is recorded while this flag is set
static volatile bool is_scroll_redraw;

static void push_back_line(void);
static void newline(void);
static void putraw(char ch);
static void backspace(void);
static rawcolor make_color(term_color fg, term_color bg);
static uint16_t make_terminal_entry(char ch, rawcolor color);
static void update_cursor(term_cursor loc);
static void term_end_line();
int terminal_interpret_ansi(char c);

void terminal_initialize(void) {
	//initialize shared lock
	mutex = lock_create();

	is_scroll_redraw = false;
	term_history = array_m_create(TERM_HISTORY_MAX);

	//set up first line buffer
	term_end_line();

	terminal_setcolor(TERM_DEFAULT_FG, TERM_DEFAULT_BG);
	terminal_clear();
}

void terminal_clear(void) {
	lock(mutex);

	for(int i = 0; i < TERM_AREA; i++) {
		uint16_t blank = make_terminal_entry(' ', g_terminal_color);
		g_terminal_buffer->mem[i] = blank;
	}

	terminal_setcursor((term_cursor){0, 0});

	unlock(mutex);
}

static void push_back_line(void) {
	lock(mutex);

	// Move all lines up one. This won't clear the last line

	/*
	memmove(&g_terminal_buffer->mem[0],
	        &g_terminal_buffer->mem[TERM_WIDTH],
	        TERM_COUNT - TERM_WIDTH);
	*/

	// memmove is not currently implemented, so do this for now
	for(uint16_t y = 1; y < TERM_HEIGHT; y++) {
		memcpy(&g_terminal_buffer->grid[y-1][0],
		       &g_terminal_buffer->grid[y][0],
		       TERM_WIDTH * sizeof(g_terminal_buffer->grid[0][0]));
	}

	// Clear the last line
	uint16_t blank = make_terminal_entry(' ', g_terminal_color);
	for(uint16_t x = 0; x < TERM_WIDTH; x++) {
		g_terminal_buffer->grid[TERM_HEIGHT - 1][x] = blank;
	}

	unlock(mutex);
}

static void term_end_line() {
	if (is_scroll_redraw) return;

	//if history is at capacity, dump the oldest line
    while (term_history->size >= TERM_HISTORY_MAX - 1) {
        array_m_remove(term_history, 0);
    }

	char* newline = (char*)kmalloc(sizeof(char) * TERM_WIDTH * 2);
	array_m_insert(term_history, newline);
}

static void term_record_char(char ch) {
	if (is_scroll_redraw) return;

	//add this character to line buffer
	char* current = (char*)array_m_lookup(term_history, term_history->size - 1);
	strccat(current, ch);
}

static void term_record_backspace() {
	if (is_scroll_redraw) return;

	// remove backspaced character
	// remove space rendered in place of backspaced character
	char* current = (char*)array_m_lookup(term_history, term_history->size - 1);
	current[strlen(current) - 2] = '\0';
}

static void term_scroll_to_bottom() {
	while (scroll_state.height > 0) {
		term_scroll(TERM_SCROLL_DOWN);
	}
}

typedef struct term_cell_color {
	term_color fg;
	term_color bg;
} term_cell_color;

static void term_record_color(term_cell_color col) {
	if (is_scroll_redraw) return;

	//append color format to line history
	char* current = (char*)array_m_lookup(term_history, term_history->size - 1);
	strcat(current, "\e[");

	//convert color code to string
	char buf[3];
	itoa(col.fg, buf);
	buf[2] = '\0';

	strcat(current, buf);
	strcat(current, ";");
}

static void newline(void) {
	//flush the current line to terminal history
	term_end_line();

	g_cursor_pos.x = 0;
	if(++g_cursor_pos.y >= TERM_HEIGHT) {
		push_back_line();
		g_cursor_pos.y = TERM_HEIGHT - 1;
	}
}

static void putraw(char ch) {
	lock(mutex);

	term_record_char(ch);

	// Find where to draw the character
	uint16_t* entry = &g_terminal_buffer->grid[g_cursor_pos.y][g_cursor_pos.x];

	// Draw the character
	*entry = make_terminal_entry(ch, g_terminal_color);

	// Advance cursor to next valid position
	if(++g_cursor_pos.x >= TERM_WIDTH) {
		newline();
	}

	unlock(mutex);
}

static void backspace(void) {
	term_cursor new_pos;
	if(g_cursor_pos.x == 0) {
		if(g_cursor_pos.y == 0) {
			// Can't delete if we're at the first spot
			return;
		}

		// Go back to last column on previous line
		new_pos.x = TERM_WIDTH - 1;
		new_pos.y = g_cursor_pos.y - 1;
	}
	else {
		// Go back one character on this line
		new_pos.x = g_cursor_pos.x - 1;
		new_pos.y = g_cursor_pos.y;
	}

	// Draw a space over the previous character, then back up
	g_cursor_pos = new_pos;
	putraw(' ');
	g_cursor_pos = new_pos;

	term_record_backspace();
}

//TODO REWORK THIS
//IMPORTANT
//SPAGEHTTI UPSETTI
static bool was_last_ansi;
void terminal_putchar(char ch) {
	// if (ch == KEY_UP || ch == KEY_DOWN) return;
  //
  // if (ch == ']'){
  //   printf("here");
  //   putraw(ch);
  //   return;
  // }
	if (!is_scroll_redraw) {
		//make sure we're at the bottom of the terminal before printing more
		term_scroll_to_bottom();
	}

  if (was_last_ansi && ch == ';') {
    was_last_ansi = false;
    return;
  }


	switch(ch) {
		// Newline
		case '\n':
			newline();
			break;

		// Tab
		case '\t': {
			uint16_t tab = TERM_TABWIDTH - (g_cursor_pos.x % TERM_TABWIDTH);
			while(tab--) {
				if(g_cursor_pos.x >= TERM_WIDTH) {
					// Wrap to new line
					newline();
					break;
				}

				// Draw spaces to make the tab
				putraw(' ');
			}
			break;
		}

		// Backspace
		case '\b':
			backspace();
			break;

		// Alarm
		case '\a':
			//TODO
			break;

		// Formfeed
		case '\f':
			terminal_clear();
			break;

		// Vertical tab
		case '\v':
			if(++g_cursor_pos.y >= TERM_HEIGHT) {
				push_back_line();
				g_cursor_pos.y = TERM_HEIGHT - 1;
			}
			break;



		// Normal characters
		default:
      if (terminal_interpret_ansi(ch) || !isprint(ch)) {
      // printf("ansi");
        was_last_ansi = true;
        break;
      }

      was_last_ansi = false;
			putraw(ch);
			break;
	}

	// Update displayed cursor position
	terminal_updatecursor();
}

int terminal_interpret_ansi(char c) {
	typedef enum {
		normal, bracket, params
	} state_t;

	static state_t state = normal;     // State tracker
	static char buf[32] = "";          // Stores the string for 1 param
	static uint32_t args[32] = { 0 };  // Stores the parsed params
	static uint32_t current_arg = 0;   // Number of params
	static uint32_t current_index = 0; // Number of chars in current param
	static term_cursor saved_cursor;
	static rawcolor saved_color;
	static uint8_t saved_menu_color;


	if (state == normal) {
		if (c == 0x1B) { // Escape character
			state = bracket;
		}
		else {
			return 0;
		}
	}
	else if (state == bracket) {
		if (c == '[') {
			state = params;
		}
		else {
			state = normal;
			return 0;
		}
	}
	else if (state == params) {
		if (c == ';') {
			buf[current_index] = '\0';
			args[current_arg++] = atoi(buf);
			current_index = 0;
		}
		else if (isdigit(c)) {
			if (current_index >= 32) {
				current_arg = 0;
				current_index = 0;
				state = normal;
			}
			else {
				buf[current_index++] = c;
			}
		}
		else if (isalpha(c)) {
			buf[current_index] = '\0';
			args[current_arg++] = atoi(buf);

			switch (c) {
				case 's': // Save cursor position
					saved_cursor = g_cursor_pos;
					state = normal;
					break;
				case 'u': // Restore cursor position
					g_cursor_pos = saved_cursor;
					state = normal;
					break;
				// case 'K': // Erase until the end of line
				// 	for (uint32_t x = tty_column; x < TERM_WIDTH; x++) {
				// 		if (args[0]){
				// 			ENTRY(x, tty_row) = tty_make_entry(' ', tty_menu_color);
				// 		} else {
				// 			ENTRY(x, tty_row) = tty_make_entry(' ', tty_color);
				// 		}
				// 	}
				// 	state = normal;
				// 	break;
				case 'H':
					g_cursor_pos.x = args[0];
					g_cursor_pos.y = args[1];
					break;
        case 'x':
          g_cursor_pos.x = args[0]; break;
        case 'y':
          g_cursor_pos.y  = args[0]; break;
				case 'A': // Cursor up
					g_cursor_pos.y -= args[0]; break;
				case 'B': // Cursor down
					g_cursor_pos.y += args[0]; break;
				case 'C': // Cursor right
					g_cursor_pos.x += args[0]; break;
				case 'D': // Cursor left
					g_cursor_pos.x -= args[0]; break;
				case 'J': // 2J: clear screen & reset cursor
					if (args[0] == 2) {
						// tty_init();
					}
					break;
			}

			if (c == 'f') { // Set graphics mode
				for (uint32_t i = 0; i < current_arg; i++) {
          if (args[i] < 16) terminal_settextcolor((term_color)args[i]);
				}
			}

      if (c == 'b') { // Set graphics mode
        for (uint32_t i = 0; i < current_arg; i++) {
          if (args[i] < 16) terminal_setbgcolor((term_color)args[i]);
        }
      }

      if (c == 'c') { // Set graphics mode
        for (uint32_t i = 0; i < current_arg; i++) {
          switch (args[i]) {
            case 0:
              //tty_set_blink(0); break;
              terminal_updatecursor(); break;
            case 1: saved_color = g_terminal_color; break;//save tty color
            case 2: g_terminal_color = saved_color; break;//restore tty color
            // case 3: saved_menu_color = tty_menu_color; saved_color = tty_color; break;//save menu color
            // case 4: tty_menu_color = saved_menu_color; tty_color = saved_color; break;//restore menu color
          }
        }
      }

			current_arg = 0;
			current_index = 0;
			state = normal;
		}
	}

	return 1;
}


void terminal_writestring(const char* str) {
	while(*str != '\0') {
		terminal_putchar(*str++);
	}
}

static rawcolor make_color(term_color fg, term_color bg) {
	rawcolor ret;
	ret.fg =  fg;
	ret.bg = bg;
	return ret;
}

static uint16_t make_terminal_entry(char ch, rawcolor color) {
	return (color.raw << 8) | ch;
}

void terminal_setcolor(term_color fg, term_color bg) {
	if (fg > 15 || bg > 15) return;

	term_record_color((term_cell_color){fg, bg});
	g_terminal_color = make_color(fg, bg);
}

void terminal_settextcolor(term_color color) {
	terminal_setcolor(color, g_terminal_color.bg);
}

void terminal_setbgcolor(term_color color) {
	terminal_setcolor(g_terminal_color.fg, color);
}

term_cursor terminal_getcursor(void) {
	return g_cursor_pos;
}

void terminal_setcursor(term_cursor curs) {
	ASSERT(curs.x < TERM_WIDTH && curs.y < TERM_HEIGHT,
		"Cursor out of bounds: (%d, %d)", curs.x, curs.y);
	g_cursor_pos = curs;
}

void terminal_updatecursor(void) {
	uint16_t loc = g_cursor_pos.y * TERM_WIDTH + g_cursor_pos.x;
	outb(0x3D4, 14);       //tell VGA board we're setting high cursor byte
	outb(0x3D5, loc >> 8); //send high cursor byte
	outb(0x3D4, 15);       //tell VGA board we're setting the low cursor byte
	outb(0x3D5, loc);      //send low cursor byte
}

void terminal_movecursor(term_cursor loc) {
	terminal_setcursor(loc);
	terminal_updatecursor();
}

void term_scroll(term_scroll_direction dir) {
	lock(mutex);

	if (dir == TERM_SCROLL_UP) {
		if (scroll_state.height + TERM_HEIGHT == term_history->size) return;
		scroll_state.height++;
	} else {
		if (scroll_state.height == 0) return;
		scroll_state.height--;
	}

	is_scroll_redraw = true;
	terminal_clear();
	terminal_setcolor(COLOR_GREEN, COLOR_BLACK);

	for (int y = 0; y < TERM_HEIGHT; y++) {
		int32_t line_idx = term_history->size - (TERM_HEIGHT - y) - scroll_state.height;
		char* line = (char*)array_m_lookup(term_history, line_idx);
		printf("%s", line);
		if (y < TERM_HEIGHT - 1) printf("\n");
	}

	is_scroll_redraw = false;

	unlock(mutex);
}
