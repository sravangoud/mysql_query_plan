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
include client/CMakeFiles/mysql_plugin.dir/depend.make

# Include the progress variables for this target.
include client/CMakeFiles/mysql_plugin.dir/progress.make

# Include the compile flags for this target's objects.
include client/CMakeFiles/mysql_plugin.dir/flags.make

client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o: client/CMakeFiles/mysql_plugin.dir/flags.make
client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o: client/mysql_plugin.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client/mysql_plugin.c

client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mysql_plugin.dir/mysql_plugin.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client/mysql_plugin.c > CMakeFiles/mysql_plugin.dir/mysql_plugin.c.i

client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mysql_plugin.dir/mysql_plugin.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client/mysql_plugin.c -o CMakeFiles/mysql_plugin.dir/mysql_plugin.c.s

client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o.requires:
.PHONY : client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o.requires

client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o.provides: client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o.requires
	$(MAKE) -f client/CMakeFiles/mysql_plugin.dir/build.make client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o.provides.build
.PHONY : client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o.provides

client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o.provides.build: client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o

# Object files for target mysql_plugin
mysql_plugin_OBJECTS = \
"CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o"

# External object files for target mysql_plugin
mysql_plugin_EXTERNAL_OBJECTS =

client/mysql_plugin: client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o
client/mysql_plugin: libmysql/libmysqlclient.a
client/mysql_plugin: client/CMakeFiles/mysql_plugin.dir/build.make
client/mysql_plugin: client/CMakeFiles/mysql_plugin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable mysql_plugin"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mysql_plugin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
client/CMakeFiles/mysql_plugin.dir/build: client/mysql_plugin
.PHONY : client/CMakeFiles/mysql_plugin.dir/build

client/CMakeFiles/mysql_plugin.dir/requires: client/CMakeFiles/mysql_plugin.dir/mysql_plugin.c.o.requires
.PHONY : client/CMakeFiles/mysql_plugin.dir/requires

client/CMakeFiles/mysql_plugin.dir/clean:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client && $(CMAKE_COMMAND) -P CMakeFiles/mysql_plugin.dir/cmake_clean.cmake
.PHONY : client/CMakeFiles/mysql_plugin.dir/clean

client/CMakeFiles/mysql_plugin.dir/depend:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client /home/sravang/Projects_New/mysql_rep/mysql_query_plan/client/CMakeFiles/mysql_plugin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : client/CMakeFiles/mysql_plugin.dir/depend

