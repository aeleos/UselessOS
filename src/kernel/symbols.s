.section .symbols

.extern __strchrnul
.type __strchrnul, @function

.extern _ctype
.type _ctype, @function

.extern _int32
.type _int32, @function

.extern abs
.type abs, @function

.extern alloc
.type alloc, @function

.extern alloc_frame
.type alloc_frame, @function

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

.extern clone_directory
.type clone_directory, @function

.extern code
.type code, @function

.extern common_halt
.type common_halt, @function

.extern convert
.type convert, @function

.extern copy_page_physical
.type copy_page_physical, @function

.extern cos
.type cos, @function

.extern cpuid
.type cpuid, @function

.extern create_heap
.type create_heap, @function

.extern current_directory
.type current_directory, @function

.extern data
.type data, @function

.extern delchar
.type delchar, @function

.extern digittoint
.type digittoint, @function

.extern dump_stack
.type dump_stack, @function

.extern enableA20
.type enableA20, @function

.extern end
.type end, @function

.extern expand
.type expand, @function

.extern factorial
.type factorial, @function

.extern fb
.type fb, @function

.extern flush_cache
.type flush_cache, @function

.extern force_hardware_irq
.type force_hardware_irq, @function

.extern force_page_fault
.type force_page_fault, @function

.extern frames
.type frames, @function

.extern free
.type free, @function

.extern free_frame
.type free_frame, @function

.extern gdt_entries
.type gdt_entries, @function

.extern gdt_flush
.type gdt_flush, @function

.extern gdt_install
.type gdt_install, @function

.extern gdt_ptr
.type gdt_ptr, @function

.extern get_cr0
.type get_cr0, @function

.extern get_cr3
.type get_cr3, @function

.extern get_page
.type get_page, @function

.extern halt_execution
.type halt_execution, @function

.extern handle_alignment_check
.type handle_alignment_check, @function

.extern handle_bound_range_exceeded
.type handle_bound_range_exceeded, @function

.extern handle_device_not_available
.type handle_device_not_available, @function

.extern handle_divide_by_zero
.type handle_divide_by_zero, @function

.extern handle_double_fault
.type handle_double_fault, @function

.extern handle_floating_point_exception
.type handle_floating_point_exception, @function

.extern handle_general_protection_fault
.type handle_general_protection_fault, @function

.extern handle_invalid_opcode
.type handle_invalid_opcode, @function

.extern handle_invalid_tss
.type handle_invalid_tss, @function

.extern handle_machine_check
.type handle_machine_check, @function

.extern handle_segment_not_present
.type handle_segment_not_present, @function

.extern handle_stack_segment_fault
.type handle_stack_segment_fault, @function

.extern handle_virtualization_exception
.type handle_virtualization_exception, @function

.extern identity_map_lfb
.type identity_map_lfb, @function

.extern idt_entries
.type idt_entries, @function

.extern idt_flush
.type idt_flush, @function

.extern idt_install
.type idt_install, @function

.extern idt_ptr
.type idt_ptr, @function

.extern idt_set_gate
.type idt_set_gate, @function

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

.extern int32
.type int32, @function

.extern interrupt_handlers
.type interrupt_handlers, @function

.extern interrupts_enabled
.type interrupts_enabled, @function

.extern io_wait
.type io_wait, @function

.extern irq0
.type irq0, @function

.extern irq1
.type irq1, @function

.extern irq10
.type irq10, @function

.extern irq11
.type irq11, @function

.extern irq12
.type irq12, @function

.extern irq13
.type irq13, @function

.extern irq14
.type irq14, @function

.extern irq15
.type irq15, @function

.extern irq2
.type irq2, @function

.extern irq3
.type irq3, @function

.extern irq4
.type irq4, @function

.extern irq5
.type irq5, @function

.extern irq6
.type irq6, @function

.extern irq7
.type irq7, @function

.extern irq8
.type irq8, @function

.extern irq9
.type irq9, @function

.extern irq_common_stub_ret
.type irq_common_stub_ret, @function

.extern irq_handler
.type irq_handler, @function

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

.extern isr0
.type isr0, @function

.extern isr1
.type isr1, @function

.extern isr10
.type isr10, @function

.extern isr11
.type isr11, @function

.extern isr12
.type isr12, @function

.extern isr13
.type isr13, @function

.extern isr14
.type isr14, @function

.extern isr15
.type isr15, @function

.extern isr16
.type isr16, @function

.extern isr17
.type isr17, @function

.extern isr18
.type isr18, @function

.extern isr19
.type isr19, @function

.extern isr2
.type isr2, @function

.extern isr20
.type isr20, @function

.extern isr21
.type isr21, @function

.extern isr22
.type isr22, @function

.extern isr23
.type isr23, @function

.extern isr24
.type isr24, @function

.extern isr25
.type isr25, @function

.extern isr26
.type isr26, @function

.extern isr27
.type isr27, @function

.extern isr28
.type isr28, @function

.extern isr29
.type isr29, @function

.extern isr3
.type isr3, @function

.extern isr30
.type isr30, @function

.extern isr31
.type isr31, @function

.extern isr4
.type isr4, @function

.extern isr5
.type isr5, @function

.extern isr6
.type isr6, @function

.extern isr7
.type isr7, @function

.extern isr8
.type isr8, @function

.extern isr9
.type isr9, @function

.extern isr_handler
.type isr_handler, @function

.extern isr_install_default
.type isr_install_default, @function

.extern isspace
.type isspace, @function

.extern isupper
.type isupper, @function

.extern isxdigit
.type isxdigit, @function

.extern itoa
.type itoa, @function

.extern kbman_process
.type kbman_process, @function

.extern kbman_process_release
.type kbman_process_release, @function

.extern kernel_directory
.type kernel_directory, @function

.extern kernel_main
.type kernel_main, @function

.extern key_down
.type key_down, @function

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

.extern memsize
.type memsize, @function

.extern mutex
.type mutex, @function

.extern nframes
.type nframes, @function

.extern outb
.type outb, @function

.extern outl
.type outl, @function

.extern outs
.type outs, @function

.extern outsm
.type outsm, @function

.extern paging_install
.type paging_install, @function

.extern panic
.type panic, @function

.extern panic_msg
.type panic_msg, @function

.extern phys
.type phys, @function

.extern pi
.type pi, @function

.extern pic_acknowledge
.type pic_acknowledge, @function

.extern placement_address
.type placement_address, @function

.extern pow
.type pow, @function

.extern print_os_name
.type print_os_name, @function

.extern print_regs
.type print_regs, @function

.extern print_selector_error_code
.type print_selector_error_code, @function

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

.extern rand
.type rand, @function

.extern read_cr0
.type read_cr0, @function

.extern read_cr3
.type read_cr3, @function

.extern read_eip
.type read_eip, @function

.extern realloc
.type realloc, @function

.extern register_interrupt_handler
.type register_interrupt_handler, @function

.extern scroll_state
.type scroll_state, @function

.extern set_cr0
.type set_cr0, @function

.extern set_cr3
.type set_cr3, @function

.extern set_kernel_stack
.type set_kernel_stack, @function

.extern set_paging_bit
.type set_paging_bit, @function

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

.extern strlen
.type strlen, @function

.extern strncpy
.type strncpy, @function

.extern strpbrk
.type strpbrk, @function

.extern strspn
.type strspn, @function

.extern strtok_r
.type strtok_r, @function

.extern switch_page_directory
.type switch_page_directory, @function

.extern switch_to_text
.type switch_to_text, @function

.extern task_switch_real
.type task_switch_real, @function

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

.extern test_colors
.type test_colors, @function

.extern test_heap
.type test_heap, @function

.extern test_interrupts
.type test_interrupts, @function

.extern test_malloc
.type test_malloc, @function

.extern test_printf
.type test_printf, @function

.extern toascii
.type toascii, @function

.extern tolower
.type tolower, @function

.extern toupper
.type toupper, @function

.extern tss_entry
.type tss_entry, @function

.extern tss_flush
.type tss_flush, @function

.extern unlock
.type unlock, @function

.extern used_mem
.type used_mem, @function

.extern validate
.type validate, @function

.extern virtual_map_pages
.type virtual_map_pages, @function

.extern vmem_map
.type vmem_map, @function

.extern vprintf
.type vprintf, @function

.extern vprintf_err
.type vprintf_err, @function

.extern vsprintf
.type vsprintf, @function

.extern write_cr0
.type write_cr0, @function

.extern write_cr3
.type write_cr3, @function

.global kernel_symbols_start
kernel_symbols_start:

.long __strchrnul
.asciz "__strchrnul"

.long _ctype
.asciz "_ctype"

.long _int32
.asciz "_int32"

.long abs
.asciz "abs"

.long alloc
.asciz "alloc"

.long alloc_frame
.asciz "alloc_frame"

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

.long clone_directory
.asciz "clone_directory"

.long code
.asciz "code"

.long common_halt
.asciz "common_halt"

.long convert
.asciz "convert"

.long copy_page_physical
.asciz "copy_page_physical"

.long cos
.asciz "cos"

.long cpuid
.asciz "cpuid"

.long create_heap
.asciz "create_heap"

.long current_directory
.asciz "current_directory"

.long data
.asciz "data"

.long delchar
.asciz "delchar"

.long digittoint
.asciz "digittoint"

.long dump_stack
.asciz "dump_stack"

.long enableA20
.asciz "enableA20"

.long end
.asciz "end"

.long expand
.asciz "expand"

.long factorial
.asciz "factorial"

.long fb
.asciz "fb"

.long flush_cache
.asciz "flush_cache"

.long force_hardware_irq
.asciz "force_hardware_irq"

.long force_page_fault
.asciz "force_page_fault"

.long frames
.asciz "frames"

.long free
.asciz "free"

.long free_frame
.asciz "free_frame"

.long gdt_entries
.asciz "gdt_entries"

.long gdt_flush
.asciz "gdt_flush"

.long gdt_install
.asciz "gdt_install"

.long gdt_ptr
.asciz "gdt_ptr"

.long get_cr0
.asciz "get_cr0"

.long get_cr3
.asciz "get_cr3"

.long get_page
.asciz "get_page"

.long halt_execution
.asciz "halt_execution"

.long handle_alignment_check
.asciz "handle_alignment_check"

.long handle_bound_range_exceeded
.asciz "handle_bound_range_exceeded"

.long handle_device_not_available
.asciz "handle_device_not_available"

.long handle_divide_by_zero
.asciz "handle_divide_by_zero"

.long handle_double_fault
.asciz "handle_double_fault"

.long handle_floating_point_exception
.asciz "handle_floating_point_exception"

.long handle_general_protection_fault
.asciz "handle_general_protection_fault"

.long handle_invalid_opcode
.asciz "handle_invalid_opcode"

.long handle_invalid_tss
.asciz "handle_invalid_tss"

.long handle_machine_check
.asciz "handle_machine_check"

.long handle_segment_not_present
.asciz "handle_segment_not_present"

.long handle_stack_segment_fault
.asciz "handle_stack_segment_fault"

.long handle_virtualization_exception
.asciz "handle_virtualization_exception"

.long identity_map_lfb
.asciz "identity_map_lfb"

.long idt_entries
.asciz "idt_entries"

.long idt_flush
.asciz "idt_flush"

.long idt_install
.asciz "idt_install"

.long idt_ptr
.asciz "idt_ptr"

.long idt_set_gate
.asciz "idt_set_gate"

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

.long int32
.asciz "int32"

.long interrupt_handlers
.asciz "interrupt_handlers"

.long interrupts_enabled
.asciz "interrupts_enabled"

.long io_wait
.asciz "io_wait"

.long irq0
.asciz "irq0"

.long irq1
.asciz "irq1"

.long irq10
.asciz "irq10"

.long irq11
.asciz "irq11"

.long irq12
.asciz "irq12"

.long irq13
.asciz "irq13"

.long irq14
.asciz "irq14"

.long irq15
.asciz "irq15"

.long irq2
.asciz "irq2"

.long irq3
.asciz "irq3"

.long irq4
.asciz "irq4"

.long irq5
.asciz "irq5"

.long irq6
.asciz "irq6"

.long irq7
.asciz "irq7"

.long irq8
.asciz "irq8"

.long irq9
.asciz "irq9"

.long irq_common_stub_ret
.asciz "irq_common_stub_ret"

.long irq_handler
.asciz "irq_handler"

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

.long isr0
.asciz "isr0"

.long isr1
.asciz "isr1"

.long isr10
.asciz "isr10"

.long isr11
.asciz "isr11"

.long isr12
.asciz "isr12"

.long isr13
.asciz "isr13"

.long isr14
.asciz "isr14"

.long isr15
.asciz "isr15"

.long isr16
.asciz "isr16"

.long isr17
.asciz "isr17"

.long isr18
.asciz "isr18"

.long isr19
.asciz "isr19"

.long isr2
.asciz "isr2"

.long isr20
.asciz "isr20"

.long isr21
.asciz "isr21"

.long isr22
.asciz "isr22"

.long isr23
.asciz "isr23"

.long isr24
.asciz "isr24"

.long isr25
.asciz "isr25"

.long isr26
.asciz "isr26"

.long isr27
.asciz "isr27"

.long isr28
.asciz "isr28"

.long isr29
.asciz "isr29"

.long isr3
.asciz "isr3"

.long isr30
.asciz "isr30"

.long isr31
.asciz "isr31"

.long isr4
.asciz "isr4"

.long isr5
.asciz "isr5"

.long isr6
.asciz "isr6"

.long isr7
.asciz "isr7"

.long isr8
.asciz "isr8"

.long isr9
.asciz "isr9"

.long isr_handler
.asciz "isr_handler"

.long isr_install_default
.asciz "isr_install_default"

.long isspace
.asciz "isspace"

.long isupper
.asciz "isupper"

.long isxdigit
.asciz "isxdigit"

.long itoa
.asciz "itoa"

.long kbman_process
.asciz "kbman_process"

.long kbman_process_release
.asciz "kbman_process_release"

.long kernel_directory
.asciz "kernel_directory"

.long kernel_main
.asciz "kernel_main"

.long key_down
.asciz "key_down"

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

.long memsize
.asciz "memsize"

.long mutex
.asciz "mutex"

.long nframes
.asciz "nframes"

.long outb
.asciz "outb"

.long outl
.asciz "outl"

.long outs
.asciz "outs"

.long outsm
.asciz "outsm"

.long paging_install
.asciz "paging_install"

.long panic
.asciz "panic"

.long panic_msg
.asciz "panic_msg"

.long phys
.asciz "phys"

.long pi
.asciz "pi"

.long pic_acknowledge
.asciz "pic_acknowledge"

.long placement_address
.asciz "placement_address"

.long pow
.asciz "pow"

.long print_os_name
.asciz "print_os_name"

.long print_regs
.asciz "print_regs"

.long print_selector_error_code
.asciz "print_selector_error_code"

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

.long rand
.asciz "rand"

.long read_cr0
.asciz "read_cr0"

.long read_cr3
.asciz "read_cr3"

.long read_eip
.asciz "read_eip"

.long realloc
.asciz "realloc"

.long register_interrupt_handler
.asciz "register_interrupt_handler"

.long scroll_state
.asciz "scroll_state"

.long set_cr0
.asciz "set_cr0"

.long set_cr3
.asciz "set_cr3"

.long set_kernel_stack
.asciz "set_kernel_stack"

.long set_paging_bit
.asciz "set_paging_bit"

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

.long strlen
.asciz "strlen"

.long strncpy
.asciz "strncpy"

.long strpbrk
.asciz "strpbrk"

.long strspn
.asciz "strspn"

.long strtok_r
.asciz "strtok_r"

.long switch_page_directory
.asciz "switch_page_directory"

.long switch_to_text
.asciz "switch_to_text"

.long task_switch_real
.asciz "task_switch_real"

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

.long test_colors
.asciz "test_colors"

.long test_heap
.asciz "test_heap"

.long test_interrupts
.asciz "test_interrupts"

.long test_malloc
.asciz "test_malloc"

.long test_printf
.asciz "test_printf"

.long toascii
.asciz "toascii"

.long tolower
.asciz "tolower"

.long toupper
.asciz "toupper"

.long tss_entry
.asciz "tss_entry"

.long tss_flush
.asciz "tss_flush"

.long unlock
.asciz "unlock"

.long used_mem
.asciz "used_mem"

.long validate
.asciz "validate"

.long virtual_map_pages
.asciz "virtual_map_pages"

.long vmem_map
.asciz "vmem_map"

.long vprintf
.asciz "vprintf"

.long vprintf_err
.asciz "vprintf_err"

.long vsprintf
.asciz "vsprintf"

.long write_cr0
.asciz "write_cr0"

.long write_cr3
.asciz "write_cr3"

.global kernel_symbols_end
kernel_symbols_end:
