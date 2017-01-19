#ifndef GFX_H
#define GFX_H

typedef struct __attribute__((packed)) {
	unsigned short di, si, bp, sp, bx, dx, cx, ax;
	unsigned short gs, fs, es, ds, eflags;
} regs16_t;

extern void int32(unsigned char intnum, regs16_t* regs);

void switch_to_text();



#endif
