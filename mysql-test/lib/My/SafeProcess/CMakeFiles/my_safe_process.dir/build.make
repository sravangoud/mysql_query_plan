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
include mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/depend.make

# Include the progress variables for this target.
include mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/progress.make

# Include the compile flags for this target's objects.
include mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/flags.make

mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o: mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/flags.make
mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o: mysql-test/lib/My/SafeProcess/safe_process.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/my_safe_process.dir/safe_process.cc.o -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess/safe_process.cc

mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/my_safe_process.dir/safe_process.cc.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess/safe_process.cc > CMakeFiles/my_safe_process.dir/safe_process.cc.i

mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/my_safe_process.dir/safe_process.cc.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess/safe_process.cc -o CMakeFiles/my_safe_process.dir/safe_process.cc.s

mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o.requires:
.PHONY : mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o.requires

mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o.provides: mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o.requires
	$(MAKE) -f mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/build.make mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o.provides.build
.PHONY : mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o.provides

mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o.provides.build: mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o

# Object files for target my_safe_process
my_safe_process_OBJECTS = \
"CMakeFiles/my_safe_process.dir/safe_process.cc.o"

# External object files for target my_safe_process
my_safe_process_EXTERNAL_OBJECTS =

mysql-test/lib/My/SafeProcess/my_safe_process: mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o
mysql-test/lib/My/SafeProcess/my_safe_process: mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/build.make
mysql-test/lib/My/SafeProcess/my_safe_process: mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable my_safe_process"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_safe_process.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/build: mysql-test/lib/My/SafeProcess/my_safe_process
.PHONY : mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/build

mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/requires: mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/safe_process.cc.o.requires
.PHONY : mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/requires

mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/clean:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess && $(CMAKE_COMMAND) -P CMakeFiles/my_safe_process.dir/cmake_clean.cmake
.PHONY : mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/clean

mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/depend:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess /home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : mysql-test/lib/My/SafeProcess/CMakeFiles/my_safe_process.dir/depend

