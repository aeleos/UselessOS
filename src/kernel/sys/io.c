#include <sys/io.h>

uint16_t ins(uint16_t port) {
	uint16_t rv;
	__asm__ volatile ("inw %1, %0" : "=a" (rv) : "dN" (port));
	return rv;
}

void outs(uint16_t port, uint16_t data) {
	__asm__ volatile ("outw %1, %0" : : "dN" (port), "a" (data));
}

uint32_t inl(uint16_t port) {
	unsigned int rv;
	__asm__ volatile ("inl %%dx, %%eax" : "=a" (rv) : "dN" (port));
	return rv;
}

void outl(uint16_t port, uint32_t data) {
	__asm__ volatile ("outl %%eax, %%dx" : : "dN" (port), "a" (data));
}

uint8_t inb(uint16_t port) {
	unsigned char rv;
	__asm__ volatile ("inb %1, %0" : "=a" (rv) : "dN" (port));
	return rv;
}

void outb(uint16_t port, uint8_t data) {
	__asm__ volatile ("outb %1, %0" : : "dN" (port), "a" (data));
}

void insm(uint16_t port, unsigned char * data, uint32_t size) {
	__asm__ volatile ("rep insw" : "+D" (data), "+c" (size) : "d" (port) : "memory");
}

void outsm(uint16_t port, unsigned char * data, uint32_t size) {
	__asm__ volatile ("rep outsw" : "+S" (data), "+c" (size) : "d" (port));
}



//force wait for i/o operation to complete
//this should only be used when there's nothing like
//a status register or IRQ to tell you info has been received
void io_wait(void) {
	//TODO this is fragile
	__asm__ volatile("		\
		jmp 1f;		\
		1: jmp 2f;	\
		2:		\
		");
}
