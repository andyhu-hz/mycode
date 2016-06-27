program_NAME := test_library.so
program_C_SRCS := $(wildcard test_library.c)
program_CXX_SRCS := $(wildcard *.cpp)
program_C_OBJS := ${program_C_SRCS:.c=.o}
program_CXX_OBJS := ${program_CXX_SRCS:.cpp=.o}
program_OBJS := $(program_C_OBJS) $(program_CXX_OBJS)
program_INCLUDE_DIRS := ../thirdparty/openssl-1.0.1i/include/ 
program_LIBRARY_DIRS := ../thirdparty/openssl-1.0.1i
program_static_LIBRARIES := ../thirdparty/openssl-1.0.1i/libssl.a ../thirdparty/openssl-1.0.1i/libcrypto.a
program_shared_LIBRARIES :=

CPPFLAGS += $(foreach includedir,$(program_INCLUDE_DIRS),-I$(includedir))
CPPFLAGS += -g -Wall -fPIC -bundle -undefined dynamic_lookup
LDFLAGS += $(foreach librarydir,$(program_LIBRARY_DIRS),-L$(librarydir))
LDFLAGS += $(foreach library,$(program_static_LIBRARIES),$(library))
LDFLAGS += $(foreach library,$(program_shared_LIBRARIES),-l$(library))

$(CC) = gcc
#$(CPP) = gcc -E
#$(CXX) = g++
$(LD) = ld


.PHONY: all clean distclean

all: $(program_NAME)

$(program_NAME): $(program_OBJS)
	$(LINK.cc) $(program_OBJS) -o $(program_NAME)

clean:
	@- $(RM) $(program_NAME)
	@- $(RM) $(program_OBJS)

distclean: clean

