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
CMAKE_SOURCE_DIR = /build/buildd/mysql-5.5-5.5.24

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /build/buildd/mysql-5.5-5.5.24/builddir

# Include any dependencies generated for this target.
include plugin/auth/CMakeFiles/qa_auth_server.dir/depend.make

# Include the progress variables for this target.
include plugin/auth/CMakeFiles/qa_auth_server.dir/progress.make

# Include the compile flags for this target's objects.
include plugin/auth/CMakeFiles/qa_auth_server.dir/flags.make

plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o: plugin/auth/CMakeFiles/qa_auth_server.dir/flags.make
plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o: ../plugin/auth/qa_auth_server.c
	$(CMAKE_COMMAND) -E cmake_progress_report /build/buildd/mysql-5.5-5.5.24/builddir/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/plugin/auth && /usr/bin/i686-linux-gnu-gcc-4.5  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o   -c /build/buildd/mysql-5.5-5.5.24/plugin/auth/qa_auth_server.c

plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/qa_auth_server.dir/qa_auth_server.c.i"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/plugin/auth && /usr/bin/i686-linux-gnu-gcc-4.5  $(C_DEFINES) $(C_FLAGS) -E /build/buildd/mysql-5.5-5.5.24/plugin/auth/qa_auth_server.c > CMakeFiles/qa_auth_server.dir/qa_auth_server.c.i

plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/qa_auth_server.dir/qa_auth_server.c.s"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/plugin/auth && /usr/bin/i686-linux-gnu-gcc-4.5  $(C_DEFINES) $(C_FLAGS) -S /build/buildd/mysql-5.5-5.5.24/plugin/auth/qa_auth_server.c -o CMakeFiles/qa_auth_server.dir/qa_auth_server.c.s

plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o.requires:
.PHONY : plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o.requires

plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o.provides: plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o.requires
	$(MAKE) -f plugin/auth/CMakeFiles/qa_auth_server.dir/build.make plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o.provides.build
.PHONY : plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o.provides

plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o.provides.build: plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o

# Object files for target qa_auth_server
qa_auth_server_OBJECTS = \
"CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o"

# External object files for target qa_auth_server
qa_auth_server_EXTERNAL_OBJECTS =

plugin/auth/qa_auth_server.so: plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o
plugin/auth/qa_auth_server.so: libservices/libmysqlservices.a
plugin/auth/qa_auth_server.so: plugin/auth/CMakeFiles/qa_auth_server.dir/build.make
plugin/auth/qa_auth_server.so: plugin/auth/CMakeFiles/qa_auth_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared module qa_auth_server.so"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/plugin/auth && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/qa_auth_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
plugin/auth/CMakeFiles/qa_auth_server.dir/build: plugin/auth/qa_auth_server.so
.PHONY : plugin/auth/CMakeFiles/qa_auth_server.dir/build

plugin/auth/CMakeFiles/qa_auth_server.dir/requires: plugin/auth/CMakeFiles/qa_auth_server.dir/qa_auth_server.c.o.requires
.PHONY : plugin/auth/CMakeFiles/qa_auth_server.dir/requires

plugin/auth/CMakeFiles/qa_auth_server.dir/clean:
	cd /build/buildd/mysql-5.5-5.5.24/builddir/plugin/auth && $(CMAKE_COMMAND) -P CMakeFiles/qa_auth_server.dir/cmake_clean.cmake
.PHONY : plugin/auth/CMakeFiles/qa_auth_server.dir/clean

plugin/auth/CMakeFiles/qa_auth_server.dir/depend:
	cd /build/buildd/mysql-5.5-5.5.24/builddir && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /build/buildd/mysql-5.5-5.5.24 /build/buildd/mysql-5.5-5.5.24/plugin/auth /build/buildd/mysql-5.5-5.5.24/builddir /build/buildd/mysql-5.5-5.5.24/builddir/plugin/auth /build/buildd/mysql-5.5-5.5.24/builddir/plugin/auth/CMakeFiles/qa_auth_server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : plugin/auth/CMakeFiles/qa_auth_server.dir/depend

