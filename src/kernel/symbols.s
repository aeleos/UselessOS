.section .symbols

.extern USasciiNonShift
.type USasciiNonShift, @function

.extern __strchrnul
.type __strchrnul, @function

.extern _ctype
.type _ctype, @function

.extern _int32
.type _int32, @function

.extern _kill
.type _kill, @function

.extern abs
.type abs, @function

.extern add_callback
.type add_callback, @function

.extern add_process
.type add_process, @function

.extern alloc
.type alloc, @function

.extern alloc_frame
.type alloc_frame, @function

.extern arccos
.type arccos, @function

.extern arcsin
.type arcsin, @function

.extern array_l_create
.type array_l_create, @function

.extern array_l_destroy
.type array_l_destroy, @function

.extern array_l_index
.type array_l_index, @function

.extern array_l_insert
.type array_l_insert, @function

.extern array_l_remove
.type array_l_remove, @function

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

.extern bcd2bin
.type bcd2bin, @function

.extern become_first_responder
.type become_first_responder, @function

.extern block_task
.type block_task, @function

.extern booster
.type booster, @function

.extern bss
.type bss, @function

.extern callback_num
.type callback_num, @function

.extern calloc
.type calloc, @function

.extern checkA20
.type checkA20, @function

.extern clone_directory
.type clone_directory, @function

.extern close_fs
.type close_fs, @function

.extern code
.type code, @function

.extern common_halt
.type common_halt, @function

.extern contract
.type contract, @function

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

.extern create_process
.type create_process, @function

.extern create_sysfuncs
.type create_sysfuncs, @function

.extern current_directory
.type current_directory, @function

.extern current_task
.type current_task, @function

.extern current_time
.type current_time, @function

.extern data
.type data, @function

.extern date
.type date, @function

.extern delchar
.type delchar, @function

.extern demote_task
.type demote_task, @function

.extern dequeue_task
.type dequeue_task, @function

.extern destroy_task
.type destroy_task, @function

.extern digittoint
.type digittoint, @function

.extern dump_stack
.type dump_stack, @function

.extern enableA20
.type enableA20, @function

.extern end
.type end, @function

.extern enqueue_task
.type enqueue_task, @function

.extern epoch_time
.type epoch_time, @function

.extern expand
.type expand, @function

.extern factorial
.type factorial, @function

.extern fb
.type fb, @function

.extern fgetc
.type fgetc, @function

.extern fgets
.type fgets, @function

.extern finddir_fs
.type finddir_fs, @function

.extern first_queue_containing_runnable
.type first_queue_containing_runnable, @function

.extern first_queue_runnable
.type first_queue_runnable, @function

.extern first_responder
.type first_responder, @function

.extern flush_cache
.type flush_cache, @function

.extern fopen
.type fopen, @function

.extern force_enumerate_blocked
.type force_enumerate_blocked, @function

.extern force_hardware_irq
.type force_hardware_irq, @function

.extern force_page_fault
.type force_page_fault, @function

.extern fork
.type fork, @function

.extern frames
.type frames, @function

.extern fread
.type fread, @function

.extern free
.type free, @function

.extern free_directory
.type free_directory, @function

.extern free_frame
.type free_frame, @function

.extern fs_root
.type fs_root, @function

.extern gdt_load
.type gdt_load, @function

.extern gdt_set_entry
.type gdt_set_entry, @function

.extern gdt_set_kernel_stack
.type gdt_set_kernel_stack, @function

.extern gdt_write_tss
.type gdt_write_tss, @function

.extern get_RTC_register
.type get_RTC_register, @function

.extern get_cr0
.type get_cr0, @function

.extern get_cr3
.type get_cr3, @function

.extern get_page
.type get_page, @function

.extern get_update_in_progress_flag
.type get_update_in_progress_flag, @function

.extern getchar
.type getchar, @function

.extern getpid
.type getpid, @function

.extern goto_pid
.type goto_pid, @function

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

.extern handle_pit_tick
.type handle_pit_tick, @function

.extern handle_segment_not_present
.type handle_segment_not_present, @function

.extern handle_stack_segment_fault
.type handle_stack_segment_fault, @function

.extern handle_tick
.type handle_tick, @function

.extern handle_virtualization_exception
.type handle_virtualization_exception, @function

.extern haskey
.type haskey, @function

.extern heap_fail
.type heap_fail, @function

.extern heap_print
.type heap_print, @function

.extern heap_verify_integrity
.type heap_verify_integrity, @function

.extern identity_map_lfb
.type identity_map_lfb, @function

.extern idle
.type idle, @function

.extern idt_load
.type idt_load, @function

.extern idt_set_entry
.type idt_set_entry, @function

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

.extern install_gdt
.type install_gdt, @function

.extern install_idt
.type install_idt, @function

.extern install_irq
.type install_irq, @function

.extern int32
.type int32, @function

.extern interrupts_enabled
.type interrupts_enabled, @function

.extern io_wait
.type io_wait, @function

.extern iosent
.type iosent, @function

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

.extern irq_get_isr
.type irq_get_isr, @function

.extern irq_getmask
.type irq_getmask, @function

.extern irq_handler
.type irq_handler, @function

.extern irq_mask
.type irq_mask, @function

.extern irq_register_handler
.type irq_register_handler, @function

.extern irq_remap
.type irq_remap, @function

.extern irq_send_eoi
.type irq_send_eoi, @function

.extern irq_setmask
.type irq_setmask, @function

.extern irq_unmask
.type irq_unmask, @function

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

.extern isr48
.type isr48, @function

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

.extern isrs_handler
.type isrs_handler, @function

.extern isrs_install_handler
.type isrs_install_handler, @function

.extern isrs_uninstall_handler
.type isrs_uninstall_handler, @function

.extern isspace
.type isspace, @function

.extern isupper
.type isupper, @function

.extern isxdigit
.type isxdigit, @function

.extern itoa
.type itoa, @function

.extern kb_buffer
.type kb_buffer, @function

.extern kb_buffer_end
.type kb_buffer_end, @function

.extern kb_buffer_start
.type kb_buffer_start, @function

.extern kb_callback
.type kb_callback, @function

.extern kb_install
.type kb_install, @function

.extern kb_modifiers
.type kb_modifiers, @function

.extern kb_us
.type kb_us, @function

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

.extern kgetch
.type kgetch, @function

.extern kheap
.type kheap, @function

.extern kheap_print
.type kheap_print, @function

.extern kmalloc_a
.type kmalloc_a, @function

.extern kmalloc_ap
.type kmalloc_ap, @function

.extern kmalloc_int
.type kmalloc_int, @function

.extern kmalloc_p
.type kmalloc_p, @function

.extern kmalloc_real
.type kmalloc_real, @function

.extern kmalloc_track_int
.type kmalloc_track_int, @function

.extern layout
.type layout, @function

.extern list_task
.type list_task, @function

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

.extern memdebug
.type memdebug, @function

.extern memset
.type memset, @function

.extern memsize
.type memsize, @function

.extern merge_blocks
.type merge_blocks, @function

.extern mlfq_schedule
.type mlfq_schedule, @function

.extern move_stack
.type move_stack, @function

.extern mutex
.type mutex, @function

.extern nframes
.type nframes, @function

.extern open_fs
.type open_fs, @function

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

.extern pit_install
.type pit_install, @function

.extern placement_address
.type placement_address, @function

.extern pow
.type pow, @function

.extern print_ok
.type print_ok, @function

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

.extern printk
.type printk, @function

.extern printk_dbg
.type printk_dbg, @function

.extern printk_err
.type printk_err, @function

.extern printk_info
.type printk_info, @function

.extern proc
.type proc, @function

.extern promote_task
.type promote_task, @function

.extern rand
.type rand, @function

.extern read_cr0
.type read_cr0, @function

.extern read_cr3
.type read_cr3, @function

.extern read_eip
.type read_eip, @function

.extern read_fs
.type read_fs, @function

.extern read_rtc_register
.type read_rtc_register, @function

.extern readdir_fs
.type readdir_fs, @function

.extern realloc
.type realloc, @function

.extern reap
.type reap, @function

.extern remove_callback
.type remove_callback, @function

.extern resign_first_responder
.type resign_first_responder, @function

.extern rtc_install
.type rtc_install, @function

.extern scroll_state
.type scroll_state, @function

.extern set_cr0
.type set_cr0, @function

.extern set_cr3
.type set_cr3, @function

.extern set_paging_bit
.type set_paging_bit, @function

.extern sin
.type sin, @function

.extern sleep
.type sleep, @function

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

.extern switch_layout
.type switch_layout, @function

.extern switch_page_directory
.type switch_page_directory, @function

.extern switch_queue
.type switch_queue, @function

.extern sys_insert
.type sys_insert, @function

.extern sys_install
.type sys_install, @function

.extern sys_installed
.type sys_installed, @function

.extern sys_read
.type sys_read, @function

.extern sys_terminal_putchar
.type sys_terminal_putchar, @function

.extern sys_terminal_writestring
.type sys_terminal_writestring, @function

.extern sys_yield
.type sys_yield, @function

.extern syscalls
.type syscalls, @function

.extern task_switch
.type task_switch, @function

.extern task_switch_real
.type task_switch_real, @function

.extern tasking_install
.type tasking_install, @function

.extern tasking_installed
.type tasking_installed, @function

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

.extern tick_count
.type tick_count, @function

.extern time
.type time, @function

.extern time_unique
.type time_unique, @function

.extern toascii
.type toascii, @function

.extern tolower
.type tolower, @function

.extern toupper
.type toupper, @function

.extern unblock_task
.type unblock_task, @function

.extern unlist_task
.type unlist_task, @function

.extern unlock
.type unlock, @function

.extern update_blocked_tasks
.type update_blocked_tasks, @function

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

.extern write_fs
.type write_fs, @function

.extern yield
.type yield, @function

.global kernel_symbols_start
kernel_symbols_start:

.long USasciiNonShift
.asciz "USasciiNonShift"

.long __strchrnul
.asciz "__strchrnul"

.long _ctype
.asciz "_ctype"

.long _int32
.asciz "_int32"

.long _kill
.asciz "_kill"

.long abs
.asciz "abs"

.long add_callback
.asciz "add_callback"

.long add_process
.asciz "add_process"

.long alloc
.asciz "alloc"

.long alloc_frame
.asciz "alloc_frame"

.long arccos
.asciz "arccos"

.long arcsin
.asciz "arcsin"

.long array_l_create
.asciz "array_l_create"

.long array_l_destroy
.asciz "array_l_destroy"

.long array_l_index
.asciz "array_l_index"

.long array_l_insert
.asciz "array_l_insert"

.long array_l_remove
.asciz "array_l_remove"

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

.long bcd2bin
.asciz "bcd2bin"

.long become_first_responder
.asciz "become_first_responder"

.long block_task
.asciz "block_task"

.long booster
.asciz "booster"

.long bss
.asciz "bss"

.long callback_num
.asciz "callback_num"

.long calloc
.asciz "calloc"

.long checkA20
.asciz "checkA20"

.long clone_directory
.asciz "clone_directory"

.long close_fs
.asciz "close_fs"

.long code
.asciz "code"

.long common_halt
.asciz "common_halt"

.long contract
.asciz "contract"

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

.long create_process
.asciz "create_process"

.long create_sysfuncs
.asciz "create_sysfuncs"

.long current_directory
.asciz "current_directory"

.long current_task
.asciz "current_task"

.long current_time
.asciz "current_time"

.long data
.asciz "data"

.long date
.asciz "date"

.long delchar
.asciz "delchar"

.long demote_task
.asciz "demote_task"

.long dequeue_task
.asciz "dequeue_task"

.long destroy_task
.asciz "destroy_task"

.long digittoint
.asciz "digittoint"

.long dump_stack
.asciz "dump_stack"

.long enableA20
.asciz "enableA20"

.long end
.asciz "end"

.long enqueue_task
.asciz "enqueue_task"

.long epoch_time
.asciz "epoch_time"

.long expand
.asciz "expand"

.long factorial
.asciz "factorial"

.long fb
.asciz "fb"

.long fgetc
.asciz "fgetc"

.long fgets
.asciz "fgets"

.long finddir_fs
.asciz "finddir_fs"

.long first_queue_containing_runnable
.asciz "first_queue_containing_runnable"

.long first_queue_runnable
.asciz "first_queue_runnable"

.long first_responder
.asciz "first_responder"

.long flush_cache
.asciz "flush_cache"

.long fopen
.asciz "fopen"

.long force_enumerate_blocked
.asciz "force_enumerate_blocked"

.long force_hardware_irq
.asciz "force_hardware_irq"

.long force_page_fault
.asciz "force_page_fault"

.long fork
.asciz "fork"

.long frames
.asciz "frames"

.long fread
.asciz "fread"

.long free
.asciz "free"

.long free_directory
.asciz "free_directory"

.long free_frame
.asciz "free_frame"

.long fs_root
.asciz "fs_root"

.long gdt_load
.asciz "gdt_load"

.long gdt_set_entry
.asciz "gdt_set_entry"

.long gdt_set_kernel_stack
.asciz "gdt_set_kernel_stack"

.long gdt_write_tss
.asciz "gdt_write_tss"

.long get_RTC_register
.asciz "get_RTC_register"

.long get_cr0
.asciz "get_cr0"

.long get_cr3
.asciz "get_cr3"

.long get_page
.asciz "get_page"

.long get_update_in_progress_flag
.asciz "get_update_in_progress_flag"

.long getchar
.asciz "getchar"

.long getpid
.asciz "getpid"

.long goto_pid
.asciz "goto_pid"

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

.long handle_pit_tick
.asciz "handle_pit_tick"

.long handle_segment_not_present
.asciz "handle_segment_not_present"

.long handle_stack_segment_fault
.asciz "handle_stack_segment_fault"

.long handle_tick
.asciz "handle_tick"

.long handle_virtualization_exception
.asciz "handle_virtualization_exception"

.long haskey
.asciz "haskey"

.long heap_fail
.asciz "heap_fail"

.long heap_print
.asciz "heap_print"

.long heap_verify_integrity
.asciz "heap_verify_integrity"

.long identity_map_lfb
.asciz "identity_map_lfb"

.long idle
.asciz "idle"

.long idt_load
.asciz "idt_load"

.long idt_set_entry
.asciz "idt_set_entry"

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

.long install_gdt
.asciz "install_gdt"

.long install_idt
.asciz "install_idt"

.long install_irq
.asciz "install_irq"

.long int32
.asciz "int32"

.long interrupts_enabled
.asciz "interrupts_enabled"

.long io_wait
.asciz "io_wait"

.long iosent
.asciz "iosent"

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

.long irq_get_isr
.asciz "irq_get_isr"

.long irq_getmask
.asciz "irq_getmask"

.long irq_handler
.asciz "irq_handler"

.long irq_mask
.asciz "irq_mask"

.long irq_register_handler
.asciz "irq_register_handler"

.long irq_remap
.asciz "irq_remap"

.long irq_send_eoi
.asciz "irq_send_eoi"

.long irq_setmask
.asciz "irq_setmask"

.long irq_unmask
.asciz "irq_unmask"

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

.long isr48
.asciz "isr48"

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

.long isrs_handler
.asciz "isrs_handler"

.long isrs_install_handler
.asciz "isrs_install_handler"

.long isrs_uninstall_handler
.asciz "isrs_uninstall_handler"

.long isspace
.asciz "isspace"

.long isupper
.asciz "isupper"

.long isxdigit
.asciz "isxdigit"

.long itoa
.asciz "itoa"

.long kb_buffer
.asciz "kb_buffer"

.long kb_buffer_end
.asciz "kb_buffer_end"

.long kb_buffer_start
.asciz "kb_buffer_start"

.long kb_callback
.asciz "kb_callback"

.long kb_install
.asciz "kb_install"

.long kb_modifiers
.asciz "kb_modifiers"

.long kb_us
.asciz "kb_us"

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

.long kgetch
.asciz "kgetch"

.long kheap
.asciz "kheap"

.long kheap_print
.asciz "kheap_print"

.long kmalloc_a
.asciz "kmalloc_a"

.long kmalloc_ap
.asciz "kmalloc_ap"

.long kmalloc_int
.asciz "kmalloc_int"

.long kmalloc_p
.asciz "kmalloc_p"

.long kmalloc_real
.asciz "kmalloc_real"

.long kmalloc_track_int
.asciz "kmalloc_track_int"

.long layout
.asciz "layout"

.long list_task
.asciz "list_task"

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

.long memdebug
.asciz "memdebug"

.long memset
.asciz "memset"

.long memsize
.asciz "memsize"

.long merge_blocks
.asciz "merge_blocks"

.long mlfq_schedule
.asciz "mlfq_schedule"

.long move_stack
.asciz "move_stack"

.long mutex
.asciz "mutex"

.long nframes
.asciz "nframes"

.long open_fs
.asciz "open_fs"

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

.long pit_install
.asciz "pit_install"

.long placement_address
.asciz "placement_address"

.long pow
.asciz "pow"

.long print_ok
.asciz "print_ok"

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

.long printk
.asciz "printk"

.long printk_dbg
.asciz "printk_dbg"

.long printk_err
.asciz "printk_err"

.long printk_info
.asciz "printk_info"

.long proc
.asciz "proc"

.long promote_task
.asciz "promote_task"

.long rand
.asciz "rand"

.long read_cr0
.asciz "read_cr0"

.long read_cr3
.asciz "read_cr3"

.long read_eip
.asciz "read_eip"

.long read_fs
.asciz "read_fs"

.long read_rtc_register
.asciz "read_rtc_register"

.long readdir_fs
.asciz "readdir_fs"

.long realloc
.asciz "realloc"

.long reap
.asciz "reap"

.long remove_callback
.asciz "remove_callback"

.long resign_first_responder
.asciz "resign_first_responder"

.long rtc_install
.asciz "rtc_install"

.long scroll_state
.asciz "scroll_state"

.long set_cr0
.asciz "set_cr0"

.long set_cr3
.asciz "set_cr3"

.long set_paging_bit
.asciz "set_paging_bit"

.long sin
.asciz "sin"

.long sleep
.asciz "sleep"

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

.long switch_layout
.asciz "switch_layout"

.long switch_page_directory
.asciz "switch_page_directory"

.long switch_queue
.asciz "switch_queue"

.long sys_insert
.asciz "sys_insert"

.long sys_install
.asciz "sys_install"

.long sys_installed
.asciz "sys_installed"

.long sys_read
.asciz "sys_read"

.long sys_terminal_putchar
.asciz "sys_terminal_putchar"

.long sys_terminal_writestring
.asciz "sys_terminal_writestring"

.long sys_yield
.asciz "sys_yield"

.long syscalls
.asciz "syscalls"

.long task_switch
.asciz "task_switch"

.long task_switch_real
.asciz "task_switch_real"

.long tasking_install
.asciz "tasking_install"

.long tasking_installed
.asciz "tasking_installed"

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

.long tick_count
.asciz "tick_count"

.long time
.asciz "time"

.long time_unique
.asciz "time_unique"

.long toascii
.asciz "toascii"

.long tolower
.asciz "tolower"

.long toupper
.asciz "toupper"

.long unblock_task
.asciz "unblock_task"

.long unlist_task
.asciz "unlist_task"

.long unlock
.asciz "unlock"

.long update_blocked_tasks
.asciz "update_blocked_tasks"

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

.long write_fs
.asciz "write_fs"

.long yield
.asciz "yield"

.global kernel_symbols_end
kernel_symbols_end:
