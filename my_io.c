#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <liblightnvm.h>
#include <time.h>
#include <pthread.h>

#define nr_blk_write 64 

struct thread_args{
    int channel;
    int lun;
    int block;
};

static char nvm_dev_path[NVM_DEV_PATH_LEN] = "/dev/nvme1n1";

static int channel = 0;
static int lun = 0;
static int block = 10;

static struct nvm_dev *dev;
static const struct nvm_geo *geo;
//static struct nvm_addr blk_addr;

size_t compare_meta_buffers(char *expected, char *actual, size_t nbytes)
{
    size_t diff = 0;

    for (size_t i = 0; i < nbytes; ++i) {

        printf("i(%06lu), expected(%02d|0x%02x|%c) actual(%02d|0x%02x|%c)\n",
                i, (int)expected[i], (int)expected[i], expected[i], (int)actual[i], (int)actual[i], actual[i]);

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
    struct nvm_ret ret_tmp;
	  struct nvm_addr addrs[naddrs];
    ssize_t res;

    static struct nvm_addr blk_addr_tmp;

    blk_addr_tmp.ppa = 0;
    blk_addr_tmp.g.ch = channel;
    blk_addr_tmp.g.lun = lun;
    blk_addr_tmp.g.blk = block;
    
		for (size_t pl = 0; pl < geo->nplanes; ++pl) {
			addrs[pl].ppa = blk_addr_tmp.ppa;
			addrs[pl].g.pl = pl;
		}

    res = nvm_addr_erase(dev, addrs, geo->nplanes, 2, &ret_tmp);
    if (res < 0) {
        perror("Erase failure");
        return -1;
    }
}

int __write_test(int ag_ch, int ag_lun, int ag_blk){

    char *buf_w = NULL, *buf_r = NULL, *meta_w = NULL, *meta_r = NULL;
    const int naddrs = geo->nplanes * geo->nsectors;
    struct nvm_addr addrs[naddrs];
    struct nvm_ret ret;
    ssize_t res;
    size_t buf_nbytes, meta_nbytes;
    int failed = 1;
    int use_meta = 1;
    int pmode = 2;

    struct nvm_addr blk_addres;

    blk_addres.ppa = 0;
    blk_addres.g.ch = ag_ch;
    blk_addres.g.lun = ag_lun;
    blk_addres.g.blk = ag_blk;    

    printf("INFO: N naddrs(%d), use_meta(%d) on ", naddrs, use_meta);
    nvm_addr_pr(blk_addres);


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
        }
        res = nvm_addr_write(dev, addrs, naddrs, buf_w,
                use_meta ? meta_w : NULL, pmode, &ret);
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

void *write_test(void *data){
    
    struct thread_args ag = *(struct thread_args *)data;
    int no_start_blk = ag.block;

    for(int i=0; i < nr_blk_write ; i++){
        __write_test(ag.channel, ag.lun, no_start_blk);
        
        no_start_blk ++;
        if(no_start_blk == 1065)
            no_start_blk = 0;
    }
}


int main(int argc, char **argv){

    int numjobs = 16;
    pthread_t th[16];
    struct thread_args th_args; 
    int status;

    /* open nvme device */
    dev = nvm_dev_open(nvm_dev_path);
    if (!dev) {
        perror("nvm_dev_open");
        return -1;
        //CU_ASSERT_PTR_NOT_NULL(dev);
    }
    geo = nvm_dev_get_geo(dev);


    /* erase all blocks which need to write  */
    for(int i=0; i < numjobs; i++){
        for(int j=0; j< nr_blk_write; i++){
            erase_blk(i % 16, numjobs % 16, j); // channel, lun, block
        } 
    }

    /* create and run threads */
    for(int i=0; i < numjobs; i++){
        th_args.channel = i % 16;
        th_args.lun = numjobs % 16;
        th_args.block = 0;
        
        if(pthread_create(&th[i], NULL, write_test, (void *)&th_args)){
            perror("thread create error: ");
            exit(0);
        }
    }

    /* wait and join multiple thread */
    for(int i=0; i < numjobs; i++){
        pthread_join(th[i], (void **)&status); 
        printf("Thread End, status: %d\n", status);
    }

    /* close device */
    nvm_dev_close(dev);
    
    return 0;
}
