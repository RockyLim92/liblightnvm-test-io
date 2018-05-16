#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <liblightnvm.h>
#include <time.h>
#include <pthread.h>

static char nvm_dev_path[NVM_DEV_PATH_LEN] = "/dev/nvme0n1";
#define NR_BLOCK_TO_WRITE 64 
#define NR_BLOCK_TO_READ 64
#define READ_FROM_THIS_LUN 4

#define NUMJOBS_WRITE 16
#define NUMJOBS_READ 16

#define NR_CHANNELS_RESERVED_FOR_READ 0 // 0이면 모든 채널에서 다 읽음, x면 앞에서부터 x개는 reserve됨

#define READ 1
#define WRITE 2

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

static struct nvm_dev *dev;
static const struct nvm_geo *geo;

struct thread_args{
		int channel;
		int lun;
		int block;
		int rw;
};


size_t compare_meta_buffers(char *expected, char *actual, size_t nbytes)
{
		size_t diff = 0;

		for (size_t i = 0; i < nbytes; ++i) {
				if (expected[i] != actual[i]) {
						++diff;
				}
		}

		return diff;
}

size_t compare_buffers(char *expected, char *actual, size_t nbytes)
{
		size_t diff = 0;

		for (size_t i = 0; i < nbytes; ++i) {
				if (expected[i] != actual[i]) {
						++diff;
				}
		}

		return diff;
}

void print_mismatch(char *expected, char *actual, size_t nbytes)
{
		printf("MISMATCHES:\n");
		for (size_t i = 0; i < nbytes; ++i) {
				if (expected[i] != actual[i]) {
						printf("i(%06lu), expected(%c) != actual(%02d|0x%02x|%c)\n",
										i, expected[i], (int)actual[i], (int)actual[i], actual[i]);
				}
		}
}

int erase_blk(int ch, int lun, int blk){

		const int naddrs = geo->nplanes * geo->nsectors;
		struct nvm_addr blk_addr_tmp;
		struct nvm_ret ret_tmp;
		struct nvm_addr addrs[naddrs];
		ssize_t res = 0;


		blk_addr_tmp.ppa = 0;
		blk_addr_tmp.g.ch = ch;
		blk_addr_tmp.g.lun = lun;
		blk_addr_tmp.g.blk = blk;

		for (size_t pl = 0; pl < geo->nplanes; ++pl) {
				addrs[pl].ppa = blk_addr_tmp.ppa;
				addrs[pl].g.pl = pl;
		}

		res = nvm_addr_erase(dev, addrs, geo->nplanes, NVM_FLAG_PMODE_QUAD, &ret_tmp);
		if (res < 0) {
				perror("Erase failure");
				return -1;
		}
}

int __write_test(int ag_ch, int ag_lun, int ag_blk){

		char *buf_w = NULL, *buf_r = NULL, *meta_w = NULL, *meta_r = NULL;
		const int naddrs = geo->nplanes * geo->nsectors;	// naddrs = 16
		struct nvm_addr blk_addres;
		struct nvm_addr addrs[naddrs];
		struct nvm_ret ret;
		ssize_t res;
		size_t buf_nbytes, meta_nbytes;
		int failed = 1;
		int use_meta = 1;
		int pmode = NVM_FLAG_PMODE_QUAD;


		blk_addres.ppa = 0;
		blk_addres.g.ch = ag_ch;
		blk_addres.g.lun = ag_lun;
		blk_addres.g.blk = ag_blk;    

		/* setup buffers for data write and meta write */
		buf_nbytes = naddrs * geo->sector_nbytes;
		meta_nbytes = naddrs * geo->meta_nbytes;

		buf_w = nvm_buf_alloc(geo, buf_nbytes);	// Setup buffers
		if (!buf_w) {
				perror("nvm_buf_alloc");
				goto exit_naddr;
		}
		nvm_buf_fill(buf_w, buf_nbytes);

		meta_w = nvm_buf_alloc(geo, meta_nbytes);
		if (!meta_w) {
				perror("nvm_buf_alloc");
				goto exit_naddr;
		}

		/* fill meta */
		for (size_t i = 0; i < meta_nbytes; ++i) {
				meta_w[i] = 65;
		}

		/* fill data */
		for (int i = 0; i < naddrs; ++i) {
				char meta_descr[meta_nbytes];
				memset(meta_descr, 0, meta_nbytes);
				int sec = i % geo->nsectors;
				int pl = (i / geo->nsectors) % geo->nplanes;

				sprintf(meta_descr, "[P(%02d),S(%02d)]", pl, sec);
				//printf("[P(%02d),S(%02d)]", pl, sec);
				//printf(" strlen(meta_descr) %lu geo->meta_nbytes %lu\n", strlen(meta_descr), geo->meta_nbytes);
				if (strlen(meta_descr) > geo->meta_nbytes) {
						perror("Failed constructing meta buffer");
						goto exit_naddr;
				}

				memcpy(meta_w + i * geo->meta_nbytes, meta_descr, strlen(meta_descr));
				//memcpy(meta_w + i * geo->meta_nbytes, meta_descr, meta_nbytes);
		}

		/* submit nvme write command */
		for (size_t pg = 0; pg < geo->npages; ++pg) {
				for (int i = 0; i < naddrs; ++i) {
						addrs[i].ppa = blk_addres.ppa;
						addrs[i].g.pg = pg;
						addrs[i].g.sec = i % geo->nsectors;
						addrs[i].g.pl = (i / geo->nsectors) % geo->nplanes;

						//nvm_addr_pr(addrs[i]);
				}
				//printf("[rocky][%s::%d] submit write cmd!!\n", __FUNCTION__, __LINE__);
				
				res = nvm_addr_write(dev, addrs, naddrs, buf_w, use_meta ? meta_w : NULL, pmode, &ret);
				if (res < 0) {
						perror("Write failure");
						goto exit_naddr;
				}
		}

		failed = 0;


exit_naddr:
		nvm_buf_free(meta_r);
		nvm_buf_free(buf_r);
		nvm_buf_free(meta_w);
		nvm_buf_free(buf_w);

		if (failed){
				printf("Failure on PPA(0x%016lx)\n", blk_addres.ppa);
				return -1;
		}
		return 0;

}

int __read_test(int ag_ch, int ag_lun, int ag_blk){

		char *buf_w = NULL, *buf_r = NULL, *meta_w = NULL, *meta_r = NULL;
		const int naddrs = geo->nplanes * geo->nsectors;	// naddrs = 16
		struct nvm_addr blk_addres;
		struct nvm_addr addrs[naddrs];
		struct nvm_ret ret;
		ssize_t res;
		size_t buf_nbytes, meta_nbytes;
		int use_meta = 1;
		int pmode = NVM_FLAG_PMODE_QUAD;
		int failed = 1;


		blk_addres.ppa = 0;
		blk_addres.g.ch = ag_ch;
		blk_addres.g.lun = ag_lun;
		blk_addres.g.blk = ag_blk;    

		buf_nbytes = naddrs * geo->sector_nbytes;
		meta_nbytes = naddrs * geo->meta_nbytes;

		buf_r = nvm_buf_alloc(geo, buf_nbytes);
		if (!buf_r) {
				perror("nvm_buf_alloc");
				goto exit_naddr;
		}

		meta_r = nvm_buf_alloc(geo, meta_nbytes);
		if (!meta_r) {
				perror("nvm_buf_alloc");
				goto exit_naddr;
		}


		/* Read */
		for (size_t pg = 0; pg < geo->npages; ++pg) {
				size_t buf_diff = 0, meta_diff = 0;

				for (int i = 0; i < naddrs; ++i) {
						addrs[i].ppa = blk_addres.ppa;

						addrs[i].g.pg = pg;
						addrs[i].g.pl = (i / geo->nsectors) % geo->nplanes;
						addrs[i].g.sec = i % geo->nsectors;

						//nvm_addr_pr(addrs[i]);
				}
				//printf("[rocky][%s::%d] submit read cmd\n", __FUNCTION__, __LINE__);

				memset(buf_r, 0, buf_nbytes);
				if (use_meta)
						memset(meta_r, 0 , meta_nbytes);

				res = nvm_addr_read(dev, addrs, naddrs, buf_r, use_meta ? meta_r : NULL, pmode, &ret);
				if (res < 0) {
						perror("Read failure: command error");
						goto exit_naddr;
				}
		}
		
		failed = 0;


exit_naddr:
		nvm_buf_free(meta_r);
		nvm_buf_free(buf_r);
		nvm_buf_free(meta_w);
		nvm_buf_free(buf_w);

		if (failed){
				printf("Failure on PPA(0x%016lx)\n", blk_addres.ppa);
				return -1;
		}
		return 0;

} 


void *thread_test(void *data){

		struct thread_args *ag = (struct thread_args *)data;
    struct nvm_addr lun_addr;
	  const struct nvm_bbt *bbt;
	  struct nvm_ret ret = {0,0};

    lun_addr.ppa = 0;
    lun_addr.g.ch = ag->channel;
    lun_addr.g.lun = ag->lun;

		
		//printf("[rocky][%s::%d] create thread ch: %d, lun: %d, block: %d, r/w: %d\n", __FUNCTION__, __LINE__, ag->channel, ag->lun, ag->block, ag->rw);

	  bbt = nvm_bbt_get(dev, lun_addr, &ret);

		struct timespec local_time[2];
		clock_gettime(CLOCK_MONOTONIC, &local_time[0]);
		unsigned long long delay_time;

		/*===================  FROM  ===================*/

		int no_start_blk = ag->block;
		
    for(int i=0; i < NR_BLOCK_TO_WRITE ; i++){

retry:
        //printf("blk no %d, status: %04x\n",no_start_blk,  bbt->blks[no_start_blk * 4] );
#if 1
        if(bbt->blks[no_start_blk * 4] == NVM_BBT_BAD){
            printf("write: target block is BAD\n");

            no_start_blk++;
            goto retry;
        }
#endif

				if(ag->rw == WRITE){
						//printf("[rocky][%s::%d] write - ch: %d, lun: %d, blk: %d\n", __FUNCTION__, __LINE__, lun_addr.g.ch, lun_addr.g.lun, no_start_blk);
						__write_test(lun_addr.g.ch, lun_addr.g.lun, no_start_blk);

				}
				else if(ag->rw == READ){
						//printf("[rocky][%s::%d] read - ch: %d, lun: %d, blk: %d\n", __FUNCTION__, __LINE__, lun_addr.g.ch, lun_addr.g.lun, no_start_blk);
						__read_test(lun_addr.g.ch, lun_addr.g.lun, no_start_blk);
				
				}

				no_start_blk ++;
				if(no_start_blk == 1065)
						no_start_blk = 0;
		}

		/*===================  END  ===================*/

		clock_gettime(CLOCK_MONOTONIC, &local_time[1]);
		calclock(local_time, &total_time, &total_count, &delay_time );

		printf("r/w: %d, elapsed time: %llu,  total_time: %llu, total_count: %llu\n", ag->rw, delay_time, total_time, total_count);
		return 0;
}



int main(int argc, char **argv){

		pthread_t th[NUMJOBS_WRITE];
		pthread_t th_r[NUMJOBS_READ];

		int status;
		int no_start_blk = 0;
    
    // variables for bbt
    struct nvm_addr lun_addr;
    const struct nvm_bbt *bbt;
    struct nvm_ret ret = {0,0};

		/* open nvme device */
		dev = nvm_dev_open(nvm_dev_path);
		if (!dev) {
				perror("nvm_dev_open");
				return -1;
		}
		geo = nvm_dev_get_geo(dev);

		/* erase all blocks which need to write  */
		for(int i=0; i < NUMJOBS_WRITE; i++){
				no_start_blk = 0;
				for(int j=0; j< NR_BLOCK_TO_WRITE; j++){

            lun_addr.ppa = 0;
            lun_addr.g.ch = i % 16;
            lun_addr.g.lun = i / 16;
	  
            bbt = nvm_bbt_get(dev, lun_addr, &ret);

retry:

            if(bbt->blks[no_start_blk * 4] == NVM_BBT_BAD){
                printf("erase: target block is BAD\n");

                no_start_blk++;
                goto retry;
            }

						printf("[rocky][%s::%d] erase - ch: %d, lun: %d, blk: %d\n", __FUNCTION__, __LINE__,i % 16, i / 16, no_start_blk);
						erase_blk(i % 16, i / 16, no_start_blk); // channel, lun, block

            no_start_blk++;
            if(no_start_blk == 1065)
                no_start_blk = 0;
				} 
		}

		no_start_blk = 0;
		/* write data for read  */
		for(int i = 0; i < NUMJOBS_READ; i++ ){
				no_start_blk = 0;
				for(int j = 0; j < NR_BLOCK_TO_READ; j++){
				
            lun_addr.ppa = 0;
						lun_addr.g.ch = (i % 16) ;
            lun_addr.g.lun = (i / 16) + READ_FROM_THIS_LUN;
            bbt = nvm_bbt_get(dev, lun_addr, &ret);

retry2:

            if(bbt->blks[no_start_blk * 4] == NVM_BBT_BAD){
                printf("erase: target block is BAD\n");

                no_start_blk++;
                goto retry2;
            }

						printf("[rocky][%s::%d] erase and write for read - ch: %d, lun: %d, blk: %d\n", __FUNCTION__, __LINE__, (i % 16), (i / 16) + READ_FROM_THIS_LUN, no_start_blk); 
						
						erase_blk( (i % 16), (i / 16) + READ_FROM_THIS_LUN, no_start_blk);// channel, lun, block
						__write_test( (i % 16) , (i / 16) + READ_FROM_THIS_LUN, no_start_blk ); // channel, lun, block

            no_start_blk++;
            if(no_start_blk == 1065)
								no_start_blk = 0;
				} 
		}

#if 0

		struct thread_args *th_args; 

		/* create and run threads for write  */
		for(int i=0; i < NUMJOBS_WRITE; i++){
				th_args = malloc(sizeof(struct thread_args));
				
				th_args->channel = i % 16;
				th_args->lun = i / 16;
				th_args->block = 0;
				th_args->rw = WRITE;
				
				//printf("[rocky][%s::%d] create write thread ch: %d\n", __FUNCTION__, __LINE__, th_args->channel);

				if(pthread_create(&th[i], NULL, thread_test, (void *)th_args)){
						perror("thread create error: ");
						exit(0);
				}
		}

		/* create and run threads for read  */
		for(int i=0; i < NUMJOBS_READ; i++){
				th_args = malloc(sizeof(struct thread_args));
				
				th_args->channel = i % 16;
				th_args->lun = (i / 16) + READ_FROM_THIS_LUN; // 4
				th_args->block = 0;
				th_args->rw = READ;
						
				//printf("[rocky][%s::%d] create read thread ch: %d\n", __FUNCTION__, __LINE__, th_args->channel);

				if(pthread_create(&th_r[i], NULL, thread_test, (void *)th_args)){
						perror("thread create error: ");
						exit(0);
				}
		}

		free(th_args);

		/* wait and join multiple thread */
		for(int i=0; i < NUMJOBS_WRITE; i++){
				pthread_join(th[i], (void **)&status); 
				printf("Thread End, status: %d\n", status);
		}
		for(int i=0; i < NUMJOBS_READ; i++){
				pthread_join(th_r[i], (void **)&status); 
				printf("Thread End, status: %d\n", status);
		}

#endif

		/* close device */
		nvm_dev_close(dev);

		return 0;
}
