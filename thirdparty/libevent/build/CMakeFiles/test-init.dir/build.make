# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.0.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.0.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/andy/mycode/libevent

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/andy/mycode/libevent/build

# Include any dependencies generated for this target.
include CMakeFiles/test-init.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test-init.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test-init.dir/flags.make

CMakeFiles/test-init.dir/test/test-init.c.o: CMakeFiles/test-init.dir/flags.make
CMakeFiles/test-init.dir/test/test-init.c.o: ../test/test-init.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/andy/mycode/libevent/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/test-init.dir/test/test-init.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/test-init.dir/test/test-init.c.o   -c /Users/andy/mycode/libevent/test/test-init.c

CMakeFiles/test-init.dir/test/test-init.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/test-init.dir/test/test-init.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/andy/mycode/libevent/test/test-init.c > CMakeFiles/test-init.dir/test/test-init.c.i

CMakeFiles/test-init.dir/test/test-init.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/test-init.dir/test/test-init.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/andy/mycode/libevent/test/test-init.c -o CMakeFiles/test-init.dir/test/test-init.c.s

CMakeFiles/test-init.dir/test/test-init.c.o.requires:
.PHONY : CMakeFiles/test-init.dir/test/test-init.c.o.requires

CMakeFiles/test-init.dir/test/test-init.c.o.provides: CMakeFiles/test-init.dir/test/test-init.c.o.requires
	$(MAKE) -f CMakeFiles/test-init.dir/build.make CMakeFiles/test-init.dir/test/test-init.c.o.provides.build
.PHONY : CMakeFiles/test-init.dir/test/test-init.c.o.provides

CMakeFiles/test-init.dir/test/test-init.c.o.provides.build: CMakeFiles/test-init.dir/test/test-init.c.o

# Object files for target test-init
test__init_OBJECTS = \
"CMakeFiles/test-init.dir/test/test-init.c.o"

# External object files for target test-init
test__init_EXTERNAL_OBJECTS =

bin/test-init: CMakeFiles/test-init.dir/test/test-init.c.o
bin/test-init: CMakeFiles/test-init.dir/build.make
bin/test-init: lib/libevent_extra.a
bin/test-init: CMakeFiles/test-init.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable bin/test-init"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-init.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test-init.dir/build: bin/test-init
.PHONY : CMakeFiles/test-init.dir/build

CMakeFiles/test-init.dir/requires: CMakeFiles/test-init.dir/test/test-init.c.o.requires
.PHONY : CMakeFiles/test-init.dir/requires

CMakeFiles/test-init.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test-init.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test-init.dir/clean

CMakeFiles/test-init.dir/depend:
	cd /Users/andy/mycode/libevent/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andy/mycode/libevent /Users/andy/mycode/libevent /Users/andy/mycode/libevent/build /Users/andy/mycode/libevent/build /Users/andy/mycode/libevent/build/CMakeFiles/test-init.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test-init.dir/depend

