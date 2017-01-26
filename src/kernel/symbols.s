.section .symbols

.extern bss
.type bss, @function

.extern checkA20
.type checkA20, @function

.extern code
.type code, @function

.extern data
.type data, @function

.extern enableA20
.type enableA20, @function

.extern end
.type end, @function

.extern fb
.type fb, @function

.extern fb_write_cell
.type fb_write_cell, @function

.extern initial_esp
.type initial_esp, @function

.extern kernel_main
.type kernel_main, @function

.extern phys
.type phys, @function

.extern start
.type start, @function

.global kernel_symbols_start
kernel_symbols_start:

.long bss
.asciz "bss"

.long checkA20
.asciz "checkA20"

.long code
.asciz "code"

.long data
.asciz "data"

.long enableA20
.asciz "enableA20"

.long end
.asciz "end"

.long fb
.asciz "fb"

.long fb_write_cell
.asciz "fb_write_cell"

.long initial_esp
.asciz "initial_esp"

.long kernel_main
.asciz "kernel_main"

.long phys
.asciz "phys"

.long start
.asciz "start"

.global kernel_symbols_end
kernel_symbols_end:
