#include <multiboot.h>


char *fb = (char *) 0x000B8000;


void fb_write_cell(unsigned int i, char c, unsigned char fg, unsigned char bg)
{
    fb[i] = c;
    fb[i + 1] = ((fg & 0x0F) << 4) | (bg & 0x0F);
}




int kmain(struct multiboot *mboot, uint32_t mboot_mag, uintptr_t esp) {

  fb_write_cell(0, 'A', 2, 8);



}
