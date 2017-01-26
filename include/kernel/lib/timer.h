#ifndef STD_TIMER_H
#define STD_TIMER_H

#include <lib/stdbool.h>
#include <lib/stdint.h>


#define MAX_CALLBACKS 100

typedef struct {
	void* callback;
	uint32_t interval;
	uint32_t time_left;
	bool repeats;
	void* context;
} timer_callback;

void sleep(uint32_t ms);
timer_callback add_callback(void* callback, int interval, bool repeats, void* context);
void remove_callback(timer_callback callback);


#endif // STD_TIMER_H
