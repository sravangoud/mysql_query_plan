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
include storage/foo/CMakeFiles/foo.dir/depend.make

# Include the progress variables for this target.
include storage/foo/CMakeFiles/foo.dir/progress.make

# Include the compile flags for this target's objects.
include storage/foo/CMakeFiles/foo.dir/flags.make

storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o: storage/foo/CMakeFiles/foo.dir/flags.make
storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o: storage/foo/ha_foo.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/foo.dir/ha_foo.cc.o -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo/ha_foo.cc

storage/foo/CMakeFiles/foo.dir/ha_foo.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/foo.dir/ha_foo.cc.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo/ha_foo.cc > CMakeFiles/foo.dir/ha_foo.cc.i

storage/foo/CMakeFiles/foo.dir/ha_foo.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/foo.dir/ha_foo.cc.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo/ha_foo.cc -o CMakeFiles/foo.dir/ha_foo.cc.s

storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o.requires:
.PHONY : storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o.requires

storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o.provides: storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o.requires
	$(MAKE) -f storage/foo/CMakeFiles/foo.dir/build.make storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o.provides.build
.PHONY : storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o.provides

storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o.provides.build: storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o

# Object files for target foo
foo_OBJECTS = \
"CMakeFiles/foo.dir/ha_foo.cc.o"

# External object files for target foo
foo_EXTERNAL_OBJECTS =

storage/foo/ha_foo.so: storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o
storage/foo/ha_foo.so: libservices/libmysqlservices.a
storage/foo/ha_foo.so: storage/foo/CMakeFiles/foo.dir/build.make
storage/foo/ha_foo.so: storage/foo/CMakeFiles/foo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module ha_foo.so"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/foo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
storage/foo/CMakeFiles/foo.dir/build: storage/foo/ha_foo.so
.PHONY : storage/foo/CMakeFiles/foo.dir/build

storage/foo/CMakeFiles/foo.dir/requires: storage/foo/CMakeFiles/foo.dir/ha_foo.cc.o.requires
.PHONY : storage/foo/CMakeFiles/foo.dir/requires

storage/foo/CMakeFiles/foo.dir/clean:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo && $(CMAKE_COMMAND) -P CMakeFiles/foo.dir/cmake_clean.cmake
.PHONY : storage/foo/CMakeFiles/foo.dir/clean

storage/foo/CMakeFiles/foo.dir/depend:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo /home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo/CMakeFiles/foo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : storage/foo/CMakeFiles/foo.dir/depend

