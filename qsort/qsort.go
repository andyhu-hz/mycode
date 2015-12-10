package main

import (
	"fmt"
	"time"
	"math/rand"
)

const TEST_BUFFER_SIZE = 100000
const TEST_GROUP_SIZE = 10
const TEST_AVERAGE_COUNT = 10

func partition(A []int, p, r int) int{
    x := A[r]
    i := p-1
    j := 0
    temp := 0

    for j=p; j<=r-1; j++ {
        if A[j] <= x {
            i = i+1
            temp = A[i]
            A[i] = A[j]
            A[j] = temp
        }
    }
    temp = A[i+1]
    A[i+1] = A[r]
    A[r] = temp
    
    return i+1
}

func quick_sort(A []int, p, r int){
    //fmt.Println("quick_sort, p=%d, r=%d", p, r)
    q := 0
    if p<r {
        q = partition(A, p, r)
        if q>p+1 {
            quick_sort(A, p, q-1)
        }
        quick_sort(A, q+1, r)
    }
}

func main() {
    fmt.Println("Hello, Go!")
    
    //var test_buffer [TEST_BUFFER_SIZE]int
    //var time_buffer [TEST_AVERAGE_COUNT]time.Duration
    
    test_buffer := make([]int, TEST_BUFFER_SIZE)
    time_buffer := make([]time.Duration, TEST_AVERAGE_COUNT)
    i := 0
    j := 0
    k := 0
    
    var start, end time.Time
    var time_diff, all_time time.Duration
    rand.Seed(time.Now().UTC().UnixNano())
    
    for k=0; k<TEST_AVERAGE_COUNT; k++ {
        start = time.Now()
        for j=0; j< TEST_GROUP_SIZE; j++ {
            for i=0; i<TEST_BUFFER_SIZE; i++ {
                test_buffer[i] = rand.Intn(100000001)
                //fmt.Println("%d\t", test_buffer[i])
            }
            
            //fmt.Println("\n\n")
            quick_sort(test_buffer, 0, TEST_BUFFER_SIZE-1)
            
            /*
            for i=0; i<TEST_BUFFER_SIZE; i++ {
                fmt.Println("%d\t", test_buffer[i])
            }
            */
        }
        end = time.Now()
        time_diff = end.Sub(start)
        time_buffer[k] = time_diff
        fmt.Println("Test ", k+1, ": time =",  time_diff)
    }
    
    for k=0; k< TEST_AVERAGE_COUNT; k++ {
        all_time += time_buffer[k];
    }
    time_diff = all_time/TEST_AVERAGE_COUNT;

    fmt.Println("Test Result: All_time = ", all_time, "average time = ", time_diff, "time is ms", time_diff);
    
}
