qsort
=====

a program to test the perfermance of golang

How to test:
1. Quick sort 100000 int number in 1 test, do the test 10 times, count the elapsed time.
2. Do step 1 10 times to caculate an average time.


Result:

1. Test result (c)
DIZHHU-M-401L:qsort andy$ ./c_qsort
Test 1: time = 138925us
Test 2: time = 137634us
Test 3: time = 137445us
Test 4: time = 135364us
Test 5: time = 137119us
Test 6: time = 134629us
Test 7: time = 135696us
Test 8: time = 134360us
Test 9: time = 140360us
Test 10: time = 140941us
Test Result: All_time = 1372473us, average time = 137247us = 137ms

2. Test result (go)
IZHHU-M-401L:qsort andy$ ./g_qsort
Hello, Go!
Test  1 : time = 122.90511ms
Test  2 : time = 124.990755ms
Test  3 : time = 119.833173ms
Test  4 : time = 119.919789ms
Test  5 : time = 120.232501ms
Test  6 : time = 121.107199ms
Test  7 : time = 120.763ms
Test  8 : time = 119.999822ms
Test  9 : time = 120.601885ms
Test  10 : time = 119.991423ms
Test Result: All_time =  1.210344657s average time =  121.034465ms time is ms 121.034465ms

It seems the go's perfermance is better than c language. Is it true?
