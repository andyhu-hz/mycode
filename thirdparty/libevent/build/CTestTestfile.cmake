# CMake generated Testfile for 
# Source directory: /Users/andy/mycode/libevent
# Build directory: /Users/andy/mycode/libevent/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test-changelist__SELECT "/Users/andy/mycode/libevent/build/bin/test-changelist")
set_tests_properties(test-changelist__SELECT PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOPOLL=1;EVENT_NOKQUEUE=1")
add_test(test-eof__SELECT "/Users/andy/mycode/libevent/build/bin/test-eof")
set_tests_properties(test-eof__SELECT PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOPOLL=1;EVENT_NOKQUEUE=1")
add_test(test-fdleak__SELECT "/Users/andy/mycode/libevent/build/bin/test-fdleak")
set_tests_properties(test-fdleak__SELECT PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOPOLL=1;EVENT_NOKQUEUE=1")
add_test(test-init__SELECT "/Users/andy/mycode/libevent/build/bin/test-init")
set_tests_properties(test-init__SELECT PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOPOLL=1;EVENT_NOKQUEUE=1")
add_test(test-time__SELECT "/Users/andy/mycode/libevent/build/bin/test-time")
set_tests_properties(test-time__SELECT PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOPOLL=1;EVENT_NOKQUEUE=1")
add_test(test-weof__SELECT "/Users/andy/mycode/libevent/build/bin/test-weof")
set_tests_properties(test-weof__SELECT PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOPOLL=1;EVENT_NOKQUEUE=1")
add_test(test-dumpevents__SELECT "/Users/andy/mycode/libevent/build/bin/test-dumpevents" "|" "/usr/bin/python" "/Users/andy/mycode/libevent/test/check-dumpevents.py")
set_tests_properties(test-dumpevents__SELECT PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOPOLL=1;EVENT_NOKQUEUE=1")
add_test(regress__SELECT "/Users/andy/mycode/libevent/build/bin/regress")
set_tests_properties(regress__SELECT PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOPOLL=1;EVENT_NOKQUEUE=1")
add_test(regress__SELECT_debug "/Users/andy/mycode/libevent/build/bin/regress")
set_tests_properties(regress__SELECT_debug PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOPOLL=1;EVENT_NOKQUEUE=1;EVENT_DEBUG_MODE=1")
add_test(test-changelist__POLL "/Users/andy/mycode/libevent/build/bin/test-changelist")
set_tests_properties(test-changelist__POLL PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOKQUEUE=1")
add_test(test-eof__POLL "/Users/andy/mycode/libevent/build/bin/test-eof")
set_tests_properties(test-eof__POLL PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOKQUEUE=1")
add_test(test-fdleak__POLL "/Users/andy/mycode/libevent/build/bin/test-fdleak")
set_tests_properties(test-fdleak__POLL PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOKQUEUE=1")
add_test(test-init__POLL "/Users/andy/mycode/libevent/build/bin/test-init")
set_tests_properties(test-init__POLL PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOKQUEUE=1")
add_test(test-time__POLL "/Users/andy/mycode/libevent/build/bin/test-time")
set_tests_properties(test-time__POLL PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOKQUEUE=1")
add_test(test-weof__POLL "/Users/andy/mycode/libevent/build/bin/test-weof")
set_tests_properties(test-weof__POLL PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOKQUEUE=1")
add_test(test-dumpevents__POLL "/Users/andy/mycode/libevent/build/bin/test-dumpevents" "|" "/usr/bin/python" "/Users/andy/mycode/libevent/test/check-dumpevents.py")
set_tests_properties(test-dumpevents__POLL PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOKQUEUE=1")
add_test(regress__POLL "/Users/andy/mycode/libevent/build/bin/regress")
set_tests_properties(regress__POLL PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOKQUEUE=1")
add_test(regress__POLL_debug "/Users/andy/mycode/libevent/build/bin/regress")
set_tests_properties(regress__POLL_debug PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOKQUEUE=1;EVENT_DEBUG_MODE=1")
add_test(test-changelist__KQUEUE "/Users/andy/mycode/libevent/build/bin/test-changelist")
set_tests_properties(test-changelist__KQUEUE PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOPOLL=1")
add_test(test-eof__KQUEUE "/Users/andy/mycode/libevent/build/bin/test-eof")
set_tests_properties(test-eof__KQUEUE PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOPOLL=1")
add_test(test-fdleak__KQUEUE "/Users/andy/mycode/libevent/build/bin/test-fdleak")
set_tests_properties(test-fdleak__KQUEUE PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOPOLL=1")
add_test(test-init__KQUEUE "/Users/andy/mycode/libevent/build/bin/test-init")
set_tests_properties(test-init__KQUEUE PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOPOLL=1")
add_test(test-time__KQUEUE "/Users/andy/mycode/libevent/build/bin/test-time")
set_tests_properties(test-time__KQUEUE PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOPOLL=1")
add_test(test-weof__KQUEUE "/Users/andy/mycode/libevent/build/bin/test-weof")
set_tests_properties(test-weof__KQUEUE PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOPOLL=1")
add_test(test-dumpevents__KQUEUE "/Users/andy/mycode/libevent/build/bin/test-dumpevents" "|" "/usr/bin/python" "/Users/andy/mycode/libevent/test/check-dumpevents.py")
set_tests_properties(test-dumpevents__KQUEUE PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOPOLL=1")
add_test(regress__KQUEUE "/Users/andy/mycode/libevent/build/bin/regress")
set_tests_properties(regress__KQUEUE PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOPOLL=1")
add_test(regress__KQUEUE_debug "/Users/andy/mycode/libevent/build/bin/regress")
set_tests_properties(regress__KQUEUE_debug PROPERTIES  ENVIRONMENT "EVENT_SHOW_METHOD=1;EVENT_NOSELECT=1;EVENT_NOPOLL=1;EVENT_DEBUG_MODE=1")
add_test(test-ratelim__group_lim "/Users/andy/mycode/libevent/build/bin/test-ratelim" "-g" "30000" "-n" "30" "-t" "100" "--check-grouplimit" "1000" "--check-stddev" "100")
add_test(test-ratelim__con_lim "/Users/andy/mycode/libevent/build/bin/test-ratelim" "-c" "1000" "-n" "30" "-t" "100" "--check-connlimit" "50" "--check-stddev" "50")
add_test(test-ratelim__group_con_lim "/Users/andy/mycode/libevent/build/bin/test-ratelim" "-c" "1000" "-g" "30000" "-n" "30" "-t" "100" "--check-grouplimit" "1000" "--check-connlimit" "50" "--check-stddev" "50")
add_test(test-ratelim__group_con_lim_drain "/Users/andy/mycode/libevent/build/bin/test-ratelim" "-c" "1000" "-g" "35000" "-n" "30" "-t" "100" "-G" "500" "--check-grouplimit" "1000" "--check-connlimit" "50" "--check-stddev" "50")