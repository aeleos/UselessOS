.section .symbols

.extern __strchrnul
.type __strchrnul, @function

.extern _ctype
.type _ctype, @function

.extern abs
.type abs, @function

.extern alloc
.type alloc, @function

.extern arccos
.type arccos, @function

.extern arcsin
.type arcsin, @function

.extern array_m_create
.type array_m_create, @function

.extern array_m_destroy
.type array_m_destroy, @function

.extern array_m_index
.type array_m_index, @function

.extern array_m_insert
.type array_m_insert, @function

.extern array_m_lookup
.type array_m_lookup, @function

.extern array_m_place
.type array_m_place, @function

.extern array_m_remove
.type array_m_remove, @function

.extern array_o_create
.type array_o_create, @function

.extern array_o_destroy
.type array_o_destroy, @function

.extern array_o_index
.type array_o_index, @function

.extern array_o_insert
.type array_o_insert, @function

.extern array_o_lookup
.type array_o_lookup, @function

.extern array_o_place
.type array_o_place, @function

.extern array_o_remove
.type array_o_remove, @function

.extern atoi
.type atoi, @function

.extern bss
.type bss, @function

.extern calloc
.type calloc, @function

.extern checkA20
.type checkA20, @function

.extern code
.type code, @function

.extern convert
.type convert, @function

.extern cos
.type cos, @function

.extern cpuid
.type cpuid, @function

.extern create_heap
.type create_heap, @function

.extern data
.type data, @function

.extern delchar
.type delchar, @function

.extern digittoint
.type digittoint, @function

.extern enableA20
.type enableA20, @function

.extern end
.type end, @function

.extern factorial
.type factorial, @function

.extern fb
.type fb, @function

.extern free
.type free, @function

.extern inb
.type inb, @function

.extern initial_esp
.type initial_esp, @function

.extern inl
.type inl, @function

.extern ins
.type ins, @function

.extern insm
.type insm, @function

.extern interrupts_enabled
.type interrupts_enabled, @function

.extern io_wait
.type io_wait, @function

.extern isalnum
.type isalnum, @function

.extern isalpha
.type isalpha, @function

.extern isascii
.type isascii, @function

.extern isblank
.type isblank, @function

.extern iscntrl
.type iscntrl, @function

.extern isdigit
.type isdigit, @function

.extern isgraph
.type isgraph, @function

.extern islower
.type islower, @function

.extern isprint
.type isprint, @function

.extern isspace
.type isspace, @function

.extern isupper
.type isupper, @function

.extern isxdigit
.type isxdigit, @function

.extern itoa
.type itoa, @function

.extern kernel_main
.type kernel_main, @function

.extern kfree
.type kfree, @function

.extern kheap
.type kheap, @function

.extern kmalloc
.type kmalloc, @function

.extern kmalloc_a
.type kmalloc_a, @function

.extern kmalloc_ap
.type kmalloc_ap, @function

.extern kmalloc_int
.type kmalloc_int, @function

.extern kmalloc_p
.type kmalloc_p, @function

.extern lock
.type lock, @function

.extern lock_create
.type lock_create, @function

.extern memadd
.type memadd, @function

.extern memcmp
.type memcmp, @function

.extern memcpy
.type memcpy, @function

.extern memset
.type memset, @function

.extern mutex
.type mutex, @function

.extern outb
.type outb, @function

.extern outl
.type outl, @function

.extern outs
.type outs, @function

.extern outsm
.type outsm, @function

.extern panic
.type panic, @function

.extern panic_msg
.type panic_msg, @function

.extern phys
.type phys, @function

.extern pi
.type pi, @function

.extern placement_address
.type placement_address, @function

.extern pow
.type pow, @function

.extern print_ok
.type print_ok, @function

.extern print_os_name
.type print_os_name, @function

.extern printf
.type printf, @function

.extern printf_dbg
.type printf_dbg, @function

.extern printf_err
.type printf_err, @function

.extern printf_hex
.type printf_hex, @function

.extern printf_info
.type printf_info, @function

.extern printk
.type printk, @function

.extern printk_dbg
.type printk_dbg, @function

.extern printk_err
.type printk_err, @function

.extern printk_info
.type printk_info, @function

.extern rand
.type rand, @function

.extern realloc
.type realloc, @function

.extern scroll_state
.type scroll_state, @function

.extern sin
.type sin, @function

.extern sprintf
.type sprintf, @function

.extern sqrt
.type sqrt, @function

.extern srand
.type srand, @function

.extern standard_lessthan_predicate
.type standard_lessthan_predicate, @function

.extern start
.type start, @function

.extern strcat
.type strcat, @function

.extern strccat
.type strccat, @function

.extern strchr
.type strchr, @function

.extern strcmp
.type strcmp, @function

.extern strcpy
.type strcpy, @function

.extern strcspn
.type strcspn, @function

.extern strdup
.type strdup, @function

.extern strlen
.type strlen, @function

.extern strncpy
.type strncpy, @function

.extern strpbrk
.type strpbrk, @function

.extern strsplit
.type strsplit, @function

.extern strspn
.type strspn, @function

.extern strtok_r
.type strtok_r, @function

.extern term_history
.type term_history, @function

.extern term_scroll
.type term_scroll, @function

.extern terminal_clear
.type terminal_clear, @function

.extern terminal_getcursor
.type terminal_getcursor, @function

.extern terminal_initialize
.type terminal_initialize, @function

.extern terminal_interpret_ansi
.type terminal_interpret_ansi, @function

.extern terminal_movecursor
.type terminal_movecursor, @function

.extern terminal_putchar
.type terminal_putchar, @function

.extern terminal_setbgcolor
.type terminal_setbgcolor, @function

.extern terminal_setcolor
.type terminal_setcolor, @function

.extern terminal_setcursor
.type terminal_setcursor, @function

.extern terminal_settextcolor
.type terminal_settextcolor, @function

.extern terminal_updatecursor
.type terminal_updatecursor, @function

.extern terminal_writestring
.type terminal_writestring, @function

.extern toascii
.type toascii, @function

.extern tolower
.type tolower, @function

.extern toupper
.type toupper, @function

.extern unlock
.type unlock, @function

.extern used_mem
.type used_mem, @function

.extern validate
.type validate, @function

.extern vprintf
.type vprintf, @function

.extern vprintf_err
.type vprintf_err, @function

.extern vsprintf
.type vsprintf, @function

.global kernel_symbols_start
kernel_symbols_start:

.long __strchrnul
.asciz "__strchrnul"

.long _ctype
.asciz "_ctype"

.long abs
.asciz "abs"

.long alloc
.asciz "alloc"

.long arccos
.asciz "arccos"

.long arcsin
.asciz "arcsin"

.long array_m_create
.asciz "array_m_create"

.long array_m_destroy
.asciz "array_m_destroy"

.long array_m_index
.asciz "array_m_index"

.long array_m_insert
.asciz "array_m_insert"

.long array_m_lookup
.asciz "array_m_lookup"

.long array_m_place
.asciz "array_m_place"

.long array_m_remove
.asciz "array_m_remove"

.long array_o_create
.asciz "array_o_create"

.long array_o_destroy
.asciz "array_o_destroy"

.long array_o_index
.asciz "array_o_index"

.long array_o_insert
.asciz "array_o_insert"

.long array_o_lookup
.asciz "array_o_lookup"

.long array_o_place
.asciz "array_o_place"

.long array_o_remove
.asciz "array_o_remove"

.long atoi
.asciz "atoi"

.long bss
.asciz "bss"

.long calloc
.asciz "calloc"

.long checkA20
.asciz "checkA20"

.long code
.asciz "code"

.long convert
.asciz "convert"

.long cos
.asciz "cos"

.long cpuid
.asciz "cpuid"

.long create_heap
.asciz "create_heap"

.long data
.asciz "data"

.long delchar
.asciz "delchar"

.long digittoint
.asciz "digittoint"

.long enableA20
.asciz "enableA20"

.long end
.asciz "end"

.long factorial
.asciz "factorial"

.long fb
.asciz "fb"

.long free
.asciz "free"

.long inb
.asciz "inb"

.long initial_esp
.asciz "initial_esp"

.long inl
.asciz "inl"

.long ins
.asciz "ins"

.long insm
.asciz "insm"

.long interrupts_enabled
.asciz "interrupts_enabled"

.long io_wait
.asciz "io_wait"

.long isalnum
.asciz "isalnum"

.long isalpha
.asciz "isalpha"

.long isascii
.asciz "isascii"

.long isblank
.asciz "isblank"

.long iscntrl
.asciz "iscntrl"

.long isdigit
.asciz "isdigit"

.long isgraph
.asciz "isgraph"

.long islower
.asciz "islower"

.long isprint
.asciz "isprint"

.long isspace
.asciz "isspace"

.long isupper
.asciz "isupper"

.long isxdigit
.asciz "isxdigit"

.long itoa
.asciz "itoa"

.long kernel_main
.asciz "kernel_main"

.long kfree
.asciz "kfree"

.long kheap
.asciz "kheap"

.long kmalloc
.asciz "kmalloc"

.long kmalloc_a
.asciz "kmalloc_a"

.long kmalloc_ap
.asciz "kmalloc_ap"

.long kmalloc_int
.asciz "kmalloc_int"

.long kmalloc_p
.asciz "kmalloc_p"

.long lock
.asciz "lock"

.long lock_create
.asciz "lock_create"

.long memadd
.asciz "memadd"

.long memcmp
.asciz "memcmp"

.long memcpy
.asciz "memcpy"

.long memset
.asciz "memset"

.long mutex
.asciz "mutex"

.long outb
.asciz "outb"

.long outl
.asciz "outl"

.long outs
.asciz "outs"

.long outsm
.asciz "outsm"

.long panic
.asciz "panic"

.long panic_msg
.asciz "panic_msg"

.long phys
.asciz "phys"

.long pi
.asciz "pi"

.long placement_address
.asciz "placement_address"

.long pow
.asciz "pow"

.long print_ok
.asciz "print_ok"

.long print_os_name
.asciz "print_os_name"

.long printf
.asciz "printf"

.long printf_dbg
.asciz "printf_dbg"

.long printf_err
.asciz "printf_err"

.long printf_hex
.asciz "printf_hex"

.long printf_info
.asciz "printf_info"

.long printk
.asciz "printk"

.long printk_dbg
.asciz "printk_dbg"

.long printk_err
.asciz "printk_err"

.long printk_info
.asciz "printk_info"

.long rand
.asciz "rand"

.long realloc
.asciz "realloc"

.long scroll_state
.asciz "scroll_state"

.long sin
.asciz "sin"

.long sprintf
.asciz "sprintf"

.long sqrt
.asciz "sqrt"

.long srand
.asciz "srand"

.long standard_lessthan_predicate
.asciz "standard_lessthan_predicate"

.long start
.asciz "start"

.long strcat
.asciz "strcat"

.long strccat
.asciz "strccat"

.long strchr
.asciz "strchr"

.long strcmp
.asciz "strcmp"

.long strcpy
.asciz "strcpy"

.long strcspn
.asciz "strcspn"

.long strdup
.asciz "strdup"

.long strlen
.asciz "strlen"

.long strncpy
.asciz "strncpy"

.long strpbrk
.asciz "strpbrk"

.long strsplit
.asciz "strsplit"

.long strspn
.asciz "strspn"

.long strtok_r
.asciz "strtok_r"

.long term_history
.asciz "term_history"

.long term_scroll
.asciz "term_scroll"

.long terminal_clear
.asciz "terminal_clear"

.long terminal_getcursor
.asciz "terminal_getcursor"

.long terminal_initialize
.asciz "terminal_initialize"

.long terminal_interpret_ansi
.asciz "terminal_interpret_ansi"

.long terminal_movecursor
.asciz "terminal_movecursor"

.long terminal_putchar
.asciz "terminal_putchar"

.long terminal_setbgcolor
.asciz "terminal_setbgcolor"

.long terminal_setcolor
.asciz "terminal_setcolor"

.long terminal_setcursor
.asciz "terminal_setcursor"

.long terminal_settextcolor
.asciz "terminal_settextcolor"

.long terminal_updatecursor
.asciz "terminal_updatecursor"

.long terminal_writestring
.asciz "terminal_writestring"

.long toascii
.asciz "toascii"

.long tolower
.asciz "tolower"

.long toupper
.asciz "toupper"

.long unlock
.asciz "unlock"

.long used_mem
.asciz "used_mem"

.long validate
.asciz "validate"

.long vprintf
.asciz "vprintf"

.long vprintf_err
.asciz "vprintf_err"

.long vsprintf
.asciz "vsprintf"

.global kernel_symbols_end
kernel_symbols_end:
