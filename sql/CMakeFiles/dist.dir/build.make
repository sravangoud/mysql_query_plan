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

# Utility rule file for dist.

# Include the progress variables for this target.
include sql/CMakeFiles/dist.dir/progress.make

sql/CMakeFiles/dist: sql/sql_yacc.cc
sql/CMakeFiles/dist: sql/sql_yacc.h
	/usr/bin/cmake -P /home/sravang/Projects_New/mysql-5.5_New/make_dist.cmake

dist: sql/CMakeFiles/dist
dist: sql/CMakeFiles/dist.dir/build.make
.PHONY : dist

# Rule to build all files generated by this target.
sql/CMakeFiles/dist.dir/build: dist
.PHONY : sql/CMakeFiles/dist.dir/build

sql/CMakeFiles/dist.dir/clean:
	cd /home/sravang/Projects_New/mysql-5.5_New/sql && $(CMAKE_COMMAND) -P CMakeFiles/dist.dir/cmake_clean.cmake
.PHONY : sql/CMakeFiles/dist.dir/clean

sql/CMakeFiles/dist.dir/depend:
	cd /home/sravang/Projects_New/mysql-5.5_New && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sravang/Projects_New/mysql-5.5_New /home/sravang/Projects_New/mysql-5.5_New/sql /home/sravang/Projects_New/mysql-5.5_New /home/sravang/Projects_New/mysql-5.5_New/sql /home/sravang/Projects_New/mysql-5.5_New/sql/CMakeFiles/dist.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : sql/CMakeFiles/dist.dir/depend
