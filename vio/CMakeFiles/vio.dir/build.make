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
include vio/CMakeFiles/vio.dir/depend.make

# Include the progress variables for this target.
include vio/CMakeFiles/vio.dir/progress.make

# Include the compile flags for this target's objects.
include vio/CMakeFiles/vio.dir/flags.make

vio/CMakeFiles/vio.dir/vio.c.o: vio/CMakeFiles/vio.dir/flags.make
vio/CMakeFiles/vio.dir/vio.c.o: vio/vio.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object vio/CMakeFiles/vio.dir/vio.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -o CMakeFiles/vio.dir/vio.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/vio.c

vio/CMakeFiles/vio.dir/vio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vio.dir/vio.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/vio.c > CMakeFiles/vio.dir/vio.c.i

vio/CMakeFiles/vio.dir/vio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vio.dir/vio.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/vio.c -o CMakeFiles/vio.dir/vio.c.s

vio/CMakeFiles/vio.dir/vio.c.o.requires:
.PHONY : vio/CMakeFiles/vio.dir/vio.c.o.requires

vio/CMakeFiles/vio.dir/vio.c.o.provides: vio/CMakeFiles/vio.dir/vio.c.o.requires
	$(MAKE) -f vio/CMakeFiles/vio.dir/build.make vio/CMakeFiles/vio.dir/vio.c.o.provides.build
.PHONY : vio/CMakeFiles/vio.dir/vio.c.o.provides

vio/CMakeFiles/vio.dir/vio.c.o.provides.build: vio/CMakeFiles/vio.dir/vio.c.o

vio/CMakeFiles/vio.dir/viosocket.c.o: vio/CMakeFiles/vio.dir/flags.make
vio/CMakeFiles/vio.dir/viosocket.c.o: vio/viosocket.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object vio/CMakeFiles/vio.dir/viosocket.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -o CMakeFiles/vio.dir/viosocket.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/viosocket.c

vio/CMakeFiles/vio.dir/viosocket.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vio.dir/viosocket.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/viosocket.c > CMakeFiles/vio.dir/viosocket.c.i

vio/CMakeFiles/vio.dir/viosocket.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vio.dir/viosocket.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/viosocket.c -o CMakeFiles/vio.dir/viosocket.c.s

vio/CMakeFiles/vio.dir/viosocket.c.o.requires:
.PHONY : vio/CMakeFiles/vio.dir/viosocket.c.o.requires

vio/CMakeFiles/vio.dir/viosocket.c.o.provides: vio/CMakeFiles/vio.dir/viosocket.c.o.requires
	$(MAKE) -f vio/CMakeFiles/vio.dir/build.make vio/CMakeFiles/vio.dir/viosocket.c.o.provides.build
.PHONY : vio/CMakeFiles/vio.dir/viosocket.c.o.provides

vio/CMakeFiles/vio.dir/viosocket.c.o.provides.build: vio/CMakeFiles/vio.dir/viosocket.c.o

vio/CMakeFiles/vio.dir/viossl.c.o: vio/CMakeFiles/vio.dir/flags.make
vio/CMakeFiles/vio.dir/viossl.c.o: vio/viossl.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object vio/CMakeFiles/vio.dir/viossl.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -o CMakeFiles/vio.dir/viossl.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/viossl.c

vio/CMakeFiles/vio.dir/viossl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vio.dir/viossl.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/viossl.c > CMakeFiles/vio.dir/viossl.c.i

vio/CMakeFiles/vio.dir/viossl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vio.dir/viossl.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/viossl.c -o CMakeFiles/vio.dir/viossl.c.s

vio/CMakeFiles/vio.dir/viossl.c.o.requires:
.PHONY : vio/CMakeFiles/vio.dir/viossl.c.o.requires

vio/CMakeFiles/vio.dir/viossl.c.o.provides: vio/CMakeFiles/vio.dir/viossl.c.o.requires
	$(MAKE) -f vio/CMakeFiles/vio.dir/build.make vio/CMakeFiles/vio.dir/viossl.c.o.provides.build
.PHONY : vio/CMakeFiles/vio.dir/viossl.c.o.provides

vio/CMakeFiles/vio.dir/viossl.c.o.provides.build: vio/CMakeFiles/vio.dir/viossl.c.o

vio/CMakeFiles/vio.dir/viosslfactories.c.o: vio/CMakeFiles/vio.dir/flags.make
vio/CMakeFiles/vio.dir/viosslfactories.c.o: vio/viosslfactories.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object vio/CMakeFiles/vio.dir/viosslfactories.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -o CMakeFiles/vio.dir/viosslfactories.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/viosslfactories.c

vio/CMakeFiles/vio.dir/viosslfactories.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/vio.dir/viosslfactories.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/viosslfactories.c > CMakeFiles/vio.dir/viosslfactories.c.i

vio/CMakeFiles/vio.dir/viosslfactories.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/vio.dir/viosslfactories.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/viosslfactories.c -o CMakeFiles/vio.dir/viosslfactories.c.s

vio/CMakeFiles/vio.dir/viosslfactories.c.o.requires:
.PHONY : vio/CMakeFiles/vio.dir/viosslfactories.c.o.requires

vio/CMakeFiles/vio.dir/viosslfactories.c.o.provides: vio/CMakeFiles/vio.dir/viosslfactories.c.o.requires
	$(MAKE) -f vio/CMakeFiles/vio.dir/build.make vio/CMakeFiles/vio.dir/viosslfactories.c.o.provides.build
.PHONY : vio/CMakeFiles/vio.dir/viosslfactories.c.o.provides

vio/CMakeFiles/vio.dir/viosslfactories.c.o.provides.build: vio/CMakeFiles/vio.dir/viosslfactories.c.o

# Object files for target vio
vio_OBJECTS = \
"CMakeFiles/vio.dir/vio.c.o" \
"CMakeFiles/vio.dir/viosocket.c.o" \
"CMakeFiles/vio.dir/viossl.c.o" \
"CMakeFiles/vio.dir/viosslfactories.c.o"

# External object files for target vio
vio_EXTERNAL_OBJECTS =

vio/libvio.a: vio/CMakeFiles/vio.dir/vio.c.o
vio/libvio.a: vio/CMakeFiles/vio.dir/viosocket.c.o
vio/libvio.a: vio/CMakeFiles/vio.dir/viossl.c.o
vio/libvio.a: vio/CMakeFiles/vio.dir/viosslfactories.c.o
vio/libvio.a: vio/CMakeFiles/vio.dir/build.make
vio/libvio.a: vio/CMakeFiles/vio.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libvio.a"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && $(CMAKE_COMMAND) -P CMakeFiles/vio.dir/cmake_clean_target.cmake
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vio.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vio/CMakeFiles/vio.dir/build: vio/libvio.a
.PHONY : vio/CMakeFiles/vio.dir/build

vio/CMakeFiles/vio.dir/requires: vio/CMakeFiles/vio.dir/vio.c.o.requires
vio/CMakeFiles/vio.dir/requires: vio/CMakeFiles/vio.dir/viosocket.c.o.requires
vio/CMakeFiles/vio.dir/requires: vio/CMakeFiles/vio.dir/viossl.c.o.requires
vio/CMakeFiles/vio.dir/requires: vio/CMakeFiles/vio.dir/viosslfactories.c.o.requires
.PHONY : vio/CMakeFiles/vio.dir/requires

vio/CMakeFiles/vio.dir/clean:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio && $(CMAKE_COMMAND) -P CMakeFiles/vio.dir/cmake_clean.cmake
.PHONY : vio/CMakeFiles/vio.dir/clean

vio/CMakeFiles/vio.dir/depend:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio /home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/CMakeFiles/vio.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vio/CMakeFiles/vio.dir/depend

