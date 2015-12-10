#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define TEST_BUFFER_SIZE    100000    //variable count to sort in a sort test case
#define TEST_GROUP_SIZE     10       //test case count in a group test
#define TEST_AVERAGE_COUNT  10       //test group count to caculate the average value

int partition(int A[], int p, int r){
    int x = A[r];
    int i = p-1;
    int j = 0;
    int temp = 0;

    for(j=p; j<=r-1; j++){
        if(A[j] <= x){
            ++i;
            temp = A[i];
            A[i] = A[j];
            A[j] = temp;
        }
    }
    temp = A[i+1];
    A[i+1] = A[r];
    A[r] = temp;
    
    return i+1;
}

void quick_sort(int A[], int p, int r){
    int q = 0;
    int i = 0;
    if(p<r) {
        q = partition(A, p, r);
        if(q>p+1) {
            quick_sort(A, p, q-1);
        }
        quick_sort(A, q+1, r);
    }
}

int main(){
    int test_buffer[TEST_BUFFER_SIZE] = {0};
    int time_buffer[TEST_AVERAGE_COUNT] = {0};
    int i = 0;
    int j = 0;
    int k = 0;
    struct timeval start, end;
    unsigned long time_diff = 0, all_time = 0;

    srand (time(NULL) );


    for(k=0; k<TEST_AVERAGE_COUNT; k++){
        gettimeofday(&start, NULL);
        for(j=0; j< TEST_GROUP_SIZE; j++) {
            for(i=0;i<TEST_BUFFER_SIZE;i++){
                test_buffer[i] = rand()%100000001;
                //printf("%d\t", test_buffer[i]);
            }
            
            //printf("\n\n");
            quick_sort(test_buffer, 0, TEST_BUFFER_SIZE-1);
            
            /*
            for(i=0;i<TEST_BUFFER_SIZE;i++){
                printf("%d\t", test_buffer[i]);
            }
            */
        }
        gettimeofday(&end, NULL);
        time_diff = 1000000*(end.tv_sec-start.tv_sec)+ (end.tv_usec-start.tv_usec);
        time_buffer[k] = time_diff;
        printf("Test %d: time = %luus\n", k+1, time_diff);
    }
    
    

    
    for(k=0; k< TEST_AVERAGE_COUNT; k++) {
        all_time += time_buffer[k];
    }
    time_diff = all_time/TEST_AVERAGE_COUNT;

    printf("Test Result: All_time = %luus, average time = %luus = %lums\n", all_time, time_diff, time_diff/1000);
}
