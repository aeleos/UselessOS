#ifndef TASK_H
#define TASK_H

#include <lib/common.h>
#include <sys/paging.h>
#include <lib/array_l.h>
#include <lib/array_m.h>


#define KERNEL_STACK_SIZE 2048 //use 2kb kernel stack

typedef enum task_state {
    RUNNABLE = 0,
	ZOMBIE, //intermediate state after task finishes executing before being flushed from system
    KB_WAIT,
    PIT_WAIT,
	MOUSE_WAIT,
} task_state;

typedef enum mlfq_option {
	LOW_LATENCY = 0, //minimize latency between tasks running, tasks share a single queue
	PRIORITIZE_INTERACTIVE, //use more queues, allowing interactive tasks to dominate
} mlfq_option;

typedef struct task {
	char* name; //user-printable process name
	int id;  //PID
	int queue; //scheduler ring this task is slotted in

	task_state state; //current process state
    uint32_t wake_timestamp; //used if process is in PIT_WAIT state

	uint32_t begin_date;
	uint32_t end_date;

	uint32_t relinquish_date;
	uint32_t lifespan;
	struct task* next;

	uint32_t esp; //stack pointer
	uint32_t ebp; //base pointer
	uint32_t eip; //instruction pointer

	page_directory_t* page_dir; //paging directory for this process

	array_m* files;
} task_t;

//initializes tasking system
void tasking_install();
bool tasking_installed();

void block_task(task_t* task, task_state reason);

//initialize a new process structure
//does not add returned process to running queue
task_t* create_process(char* name, uint32_t eip, bool wants_stack);

//adds task to running queue
void add_process(task_t* task);

//changes running process
uint32_t task_switch();

//forks current process
//spawns new process with different memory space
int fork();

//stop executing the current process and remove it from active processes
void _kill();

//used whenever a system event occurs
//looks at blocked tasks and unblocks as necessary
void update_blocked_tasks();

//returns pid of current process
int getpid();

//print all active processes
void proc();

//used to immediately invoke iosentinel process
//to wake any processes that were waiting on an i/o event that
//has now been recieved
void force_enumerate_blocked();

//appends current task to stack of responders,
//and marks current task as designated recipient of keyboard events
void become_first_responder();

//relinquish first responder status
//process which first responder status was taken from becomes first responder
void resign_first_responder();

void handle_pit_tick();


#endif
