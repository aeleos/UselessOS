#ifndef IO_H
#define IO_H

#include <lib/types.h>

unsigned char inb(uint16_t port);
void outb(uint16_t port, uint8_t data);

uint16_t ins(uint16_t port);
void outs(uint16_t port, uint16_t data);

uint32_t inl(uint16_t port);
void outl(uint16_t port, uint32_t data);

void insm(uint16_t port, unsigned char * data, uint32_t size);
void outsm(uint16_t port, unsigned char * data, uint32_t size);

#endif
