# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sravang/Projects_New/mysql_rep/mysql_query_plan

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sravang/Projects_New/mysql_rep/mysql_query_plan

# Include any dependencies generated for this target.
include unittest/mysys/CMakeFiles/bitmap-t.dir/depend.make

# Include the progress variables for this target.
include unittest/mysys/CMakeFiles/bitmap-t.dir/progress.make

# Include the compile flags for this target's objects.
include unittest/mysys/CMakeFiles/bitmap-t.dir/flags.make

unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o: unittest/mysys/CMakeFiles/bitmap-t.dir/flags.make
unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o: unittest/mysys/bitmap-t.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/bitmap-t.dir/bitmap-t.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys/bitmap-t.c

unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/bitmap-t.dir/bitmap-t.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys/bitmap-t.c > CMakeFiles/bitmap-t.dir/bitmap-t.c.i

unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/bitmap-t.dir/bitmap-t.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys/bitmap-t.c -o CMakeFiles/bitmap-t.dir/bitmap-t.c.s

unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o.requires:
.PHONY : unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o.requires

unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o.provides: unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o.requires
	$(MAKE) -f unittest/mysys/CMakeFiles/bitmap-t.dir/build.make unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o.provides.build
.PHONY : unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o.provides

unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o.provides.build: unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o

# Object files for target bitmap-t
bitmap__t_OBJECTS = \
"CMakeFiles/bitmap-t.dir/bitmap-t.c.o"

# External object files for target bitmap-t
bitmap__t_EXTERNAL_OBJECTS =

unittest/mysys/bitmap-t: unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o
unittest/mysys/bitmap-t: unittest/mytap/libmytap.a
unittest/mysys/bitmap-t: mysys/libmysys.a
unittest/mysys/bitmap-t: strings/libstrings.a
unittest/mysys/bitmap-t: dbug/libdbug.a
unittest/mysys/bitmap-t: mysys/libmysys.a
unittest/mysys/bitmap-t: dbug/libdbug.a
unittest/mysys/bitmap-t: strings/libstrings.a
unittest/mysys/bitmap-t: unittest/mysys/CMakeFiles/bitmap-t.dir/build.make
unittest/mysys/bitmap-t: unittest/mysys/CMakeFiles/bitmap-t.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable bitmap-t"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bitmap-t.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
unittest/mysys/CMakeFiles/bitmap-t.dir/build: unittest/mysys/bitmap-t
.PHONY : unittest/mysys/CMakeFiles/bitmap-t.dir/build

unittest/mysys/CMakeFiles/bitmap-t.dir/requires: unittest/mysys/CMakeFiles/bitmap-t.dir/bitmap-t.c.o.requires
.PHONY : unittest/mysys/CMakeFiles/bitmap-t.dir/requires

unittest/mysys/CMakeFiles/bitmap-t.dir/clean:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys && $(CMAKE_COMMAND) -P CMakeFiles/bitmap-t.dir/cmake_clean.cmake
.PHONY : unittest/mysys/CMakeFiles/bitmap-t.dir/clean

unittest/mysys/CMakeFiles/bitmap-t.dir/depend:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys /home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys/CMakeFiles/bitmap-t.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : unittest/mysys/CMakeFiles/bitmap-t.dir/depend

