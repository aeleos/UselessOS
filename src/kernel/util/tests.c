#include <util/tests.h>
// #include <std/std.h>
#include <drivers/terminal.h>
#include <lib/printf.h>
#include <lib/kheap.h>
// #include <kernel/drivers/vesa/vesa.h>
// #include <kernel/drivers/rtc/clock.h>
// #include <crypto/crypto.h>

void test_colors() {
	printf_info("Testing colors...\n");
	for (int i = 0; i < 16; i++) {
		printf("\x1B[%df;@", i);
	}
	printf("\n");
}

void force_hardware_irq() {
	printf_info("Forcing hardware IRQ...\n");
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wdiv-by-zero"
	int i = 500/0;
#pragma GCC diagnostic pop
	printf_dbg("%d", i);
}

void force_page_fault() {
	printf_info("Forcing page fault...\n");
	uint32_t* ptr = (uint32_t*)0xA0000000;
	uint32_t do_fault = *ptr;
	printf_err("This should never be reached: %d\n", do_fault);
}

void test_interrupts() {
	printf_info("Testing interrupts...\n");
	__asm__ volatile("mov $0xdeadbeef, %eax");
	__asm__ volatile("mov $0xcafebabe, %ecx");
	// __asm__ volatile("int $0x3");
	// __asm__ volatile("int $0x5");
}

void test_heap() {
	printf_info("Testing heap...");

	uint32_t* a = (uint32_t*)kmalloc(8);
	uint32_t* b = (uint32_t*)kmalloc(8);
	// printf_dbg("a: %x, b: %x\n", a, b);
	kfree(a);
	kfree(b);

	uint32_t* c = (uint32_t*)kmalloc(12);
	// printf_dbg("c: %x\n", c);
	kfree(c);

	if (a == c) {
		// printf_info("Heap test passed\n");
    printf("\x1B[s\x1B[72x\x1B[15f;[  \x1B[2f;OK  \x1B[15f;]\x1B[u\n");
	}
	else printf_err("Heap test failed, expected %x to be marked free\n", a);
}

void test_malloc() {
	printf_info("Testing malloc...\n");

	//Check used memory before malloc test
	//if more mem is used after test, then the test failed
	uint32_t used = used_mem();

	for (int i = 0; i < 32; i++) {
		uint32_t* tmp = (uint32_t*)kmalloc(0x1000);
		kfree(tmp);
	}

	if (used != used_mem()) {
		printf_err("Malloc test failed. Expected %x bytes in use, had %x\n", used, used_mem());
		return;
	}
	printf_info("Malloc test passed\n");
}

void test_printf() {
	printf_info("Testing printf...\n");
	printf_info("int: %d | hex: %x | char: %c | str: %s | float: %f | %%\n", 126, 0x14B7, 'q', "test", 3.1415926);
}

// void test_time_unique() {
// 	printf_info("Testing time_unique...");
// 	for (int i = 0; i < 100; i++) {
// 		static uint32_t last = 0;
// 		uint32_t current = time_unique();
//
// 		if (last == time_unique()) {
// 			//we find the number of times this stamp was encountered by
// 			//reverse engineering the clock slide
// 			//the slide is the slide stamp minus the real stamp
// 			printf_err("time_unique failed, stamp %u encountered %u times", time_unique(), time_unique() - time());
// 			return;
// 		}
// 		last = current;
// 	}
// 	printf_info("time_unique test passed");
// }
//
// void test_crypto() {
// 	printf_info("Testing SHA256...");
// 	printf_info("SHA256 test %s", sha256_test() ? "passed":"failed");
// 	printf_info("Testing AES...");
// 	printf_info("AES test %s", aes_test() ? "passed":"failed");
// }
