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
CMAKE_SOURCE_DIR = /home/sravang/Projects_New/mysql-5.5_New

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sravang/Projects_New/mysql-5.5_New

# Include any dependencies generated for this target.
include client/CMakeFiles/mysqlshow.dir/depend.make

# Include the progress variables for this target.
include client/CMakeFiles/mysqlshow.dir/progress.make

# Include the compile flags for this target's objects.
include client/CMakeFiles/mysqlshow.dir/flags.make

client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o: client/CMakeFiles/mysqlshow.dir/flags.make
client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o: client/mysqlshow.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql-5.5_New/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o"
	cd /home/sravang/Projects_New/mysql-5.5_New/client && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/mysqlshow.dir/mysqlshow.c.o   -c /home/sravang/Projects_New/mysql-5.5_New/client/mysqlshow.c

client/CMakeFiles/mysqlshow.dir/mysqlshow.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mysqlshow.dir/mysqlshow.c.i"
	cd /home/sravang/Projects_New/mysql-5.5_New/client && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/sravang/Projects_New/mysql-5.5_New/client/mysqlshow.c > CMakeFiles/mysqlshow.dir/mysqlshow.c.i

client/CMakeFiles/mysqlshow.dir/mysqlshow.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mysqlshow.dir/mysqlshow.c.s"
	cd /home/sravang/Projects_New/mysql-5.5_New/client && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/sravang/Projects_New/mysql-5.5_New/client/mysqlshow.c -o CMakeFiles/mysqlshow.dir/mysqlshow.c.s

client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o.requires:
.PHONY : client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o.requires

client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o.provides: client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o.requires
	$(MAKE) -f client/CMakeFiles/mysqlshow.dir/build.make client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o.provides.build
.PHONY : client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o.provides

client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o.provides.build: client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o

# Object files for target mysqlshow
mysqlshow_OBJECTS = \
"CMakeFiles/mysqlshow.dir/mysqlshow.c.o"

# External object files for target mysqlshow
mysqlshow_EXTERNAL_OBJECTS =

client/mysqlshow: client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o
client/mysqlshow: libmysql/libmysqlclient.a
client/mysqlshow: client/CMakeFiles/mysqlshow.dir/build.make
client/mysqlshow: client/CMakeFiles/mysqlshow.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable mysqlshow"
	cd /home/sravang/Projects_New/mysql-5.5_New/client && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mysqlshow.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
client/CMakeFiles/mysqlshow.dir/build: client/mysqlshow
.PHONY : client/CMakeFiles/mysqlshow.dir/build

client/CMakeFiles/mysqlshow.dir/requires: client/CMakeFiles/mysqlshow.dir/mysqlshow.c.o.requires
.PHONY : client/CMakeFiles/mysqlshow.dir/requires

client/CMakeFiles/mysqlshow.dir/clean:
	cd /home/sravang/Projects_New/mysql-5.5_New/client && $(CMAKE_COMMAND) -P CMakeFiles/mysqlshow.dir/cmake_clean.cmake
.PHONY : client/CMakeFiles/mysqlshow.dir/clean

client/CMakeFiles/mysqlshow.dir/depend:
	cd /home/sravang/Projects_New/mysql-5.5_New && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sravang/Projects_New/mysql-5.5_New /home/sravang/Projects_New/mysql-5.5_New/client /home/sravang/Projects_New/mysql-5.5_New /home/sravang/Projects_New/mysql-5.5_New/client /home/sravang/Projects_New/mysql-5.5_New/client/CMakeFiles/mysqlshow.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : client/CMakeFiles/mysqlshow.dir/depend
