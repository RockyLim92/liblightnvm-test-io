#ifndef _PROF_H
#define _PROF_H

#include <stdio.h>
#include <time.h>
#include <stdlib.h>

//function level profiling
#define BILLION     (1000000001ULL)
#define calclock(timevalue, total_time, total_count, delay_time) do { \
		unsigned long long timedelay, temp, temp_n; \
		struct timespec *myclock = (struct timespec*)timevalue; \
		if(myclock[1].tv_nsec >= myclock[0].tv_nsec){ \
				temp = myclock[1].tv_sec - myclock[0].tv_sec; \
				temp_n = myclock[1].tv_nsec - myclock[0].tv_nsec; \
				timedelay = BILLION * temp + temp_n; \
		} else { \
				temp = myclock[1].tv_sec - myclock[0].tv_sec - 1; \
				temp_n = BILLION + myclock[1].tv_nsec - myclock[0].tv_nsec; \
				timedelay = BILLION * temp + temp_n; \
		} \
    *delay_time = timedelay; \
		__sync_fetch_and_add(total_time, timedelay); \
		__sync_fetch_and_add(total_count, 1); \
} while(0)


//Global function time/count variables
unsigned long long total_time, total_count;

#endif


int main(void)
{
		int i=0;
		struct timespec local_time[2];
    unsigned long long delay_time;

		clock_gettime(CLOCK_MONOTONIC, &local_time[0]);
		for(i=0;i<10;i++){
				printf("Time test: %d\n", i); 
		}   
		clock_gettime(CLOCK_MONOTONIC, &local_time[1]);
		calclock(local_time, &total_time, &total_count, &delay_time);
		printf("%s, total_time: %llu, total_count: %llu\n", __func__, total_time, total_count);
}
