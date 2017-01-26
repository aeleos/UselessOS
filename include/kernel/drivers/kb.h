#ifndef KB_DRIVER_H
#define KB_DRIVER_H

#include <lib/stdbool.h>
#include <drivers/keymap.h>


#define KEYBOARD_BUFFER_SIZE 32

#define ESC 27
#define BACKSPACE '\b'
#define TAB '\t'
#define ENTER '\n'
#define RETURN '\r'
#define NEWLINE ENTER

// Non-ASCII special scancodes // Esc in scancode is 1
#define KESC 1
#define KF1 0x80
#define KF2 (KF1 + 1)
#define KF3 (KF2 + 1)
#define KF4 (KF3 + 1)
#define KF5 (KF4 + 1)
#define KF6 (KF5 + 1)
#define KF7 (KF6 + 1)
#define KF8 (KF7 + 1)
#define KF9 (KF8 + 1)
#define KF10 (KF9 + 1)
#define KF11 (KF10 + 1)
#define KF12 (KF11 + 1)

// Cursor Keys
#define KINS 0x90
#define KDEL (KINS + 1)
#define KHOME (KDEL + 1)
#define KEND (KHOME + 1)
#define KPGUP (KEND + 1)
#define KPGDN (KPGUP + 1)
#define KLEFT (KPGDN + 1)
#define KUP (KLEFT + 1)
#define KDOWN (KUP + 1)
#define KRIGHT (KDOWN + 1)

// "Meta" keys
#define KMETA_ALT 0x0200 // Alt is pressed
#define KMETA_CTRL 0x0400 // Ctrl is pressed
#define KMETA_SHIFT 0x0800 // Shift is pressed
#define KMETA_ANY (KMETA_ALT | KMETA_CTRL | KMETA_SHIFT)
#define KMETA_CAPS 0x1000 // CapsLock is on
#define KMETA_NUM 0x2000 // NumLock is on
#define KMETA_SCRL 0x4000 // ScrollLock is on

// Other keys
#define KPRNT ( KRT + 1 )
#define KPAUSE ( KPRNT + 1 )
#define KLWIN ( KPAUSE + 1 )
#define KRWIN ( KLWIN + 1 )
#define KMENU ( KRWIN + 1 )
#define KRLEFT_CTRL 0x1D
#define KRRIGHT_CTRL 0x1D
#define KRLEFT_ALT 0x38
#define KRRIGHT_ALT 0x38
#define KRLEFT_SHIFT 0x2A
#define KRRIGHT_SHIFT 0x36
#define KRCAPS_LOCK 0x3A
#define KRSCROLL_LOCK 0x46
#define KRNUM_LOCK 0x45
#define KRDEL 0x53

#define CONTROL		0x1
#define ALT			0x2
#define ALTGR		0x4
#define LSHIFT		0x8
#define RSHIFT		0x10
#define CAPSLOCK	0x20
#define SCROLLLOCK	0x40
#define NUMLOCK		0x80

#define RELEASED_MASK 0x80

//non-blocking getchar()
//returns NULL if no pending keys
char kgetch();
//blocks until character is recieved
char getchar();
//check if there is a pending keypress
uint8_t haskey();
//return mask of modifier keys
key_status_t kb_modifiers();

//install PS/2 keyboard driver
void kb_install();
//swap layout to interpret incoming scancodes
void switch_layout(keymap_t* layout);
//get current layout
keymap_t* kb_layout();


#endif