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
include storage/heap/CMakeFiles/hp_test2.dir/depend.make

# Include the progress variables for this target.
include storage/heap/CMakeFiles/hp_test2.dir/progress.make

# Include the compile flags for this target's objects.
include storage/heap/CMakeFiles/hp_test2.dir/flags.make

storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o: storage/heap/CMakeFiles/hp_test2.dir/flags.make
storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o: ../storage/heap/hp_test2.c
	$(CMAKE_COMMAND) -E cmake_progress_report /build/buildd/mysql-5.5-5.5.24/builddir/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/storage/heap && /usr/bin/i686-linux-gnu-gcc-4.5  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/hp_test2.dir/hp_test2.c.o   -c /build/buildd/mysql-5.5-5.5.24/storage/heap/hp_test2.c

storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hp_test2.dir/hp_test2.c.i"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/storage/heap && /usr/bin/i686-linux-gnu-gcc-4.5  $(C_DEFINES) $(C_FLAGS) -E /build/buildd/mysql-5.5-5.5.24/storage/heap/hp_test2.c > CMakeFiles/hp_test2.dir/hp_test2.c.i

storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hp_test2.dir/hp_test2.c.s"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/storage/heap && /usr/bin/i686-linux-gnu-gcc-4.5  $(C_DEFINES) $(C_FLAGS) -S /build/buildd/mysql-5.5-5.5.24/storage/heap/hp_test2.c -o CMakeFiles/hp_test2.dir/hp_test2.c.s

storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o.requires:
.PHONY : storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o.requires

storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o.provides: storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o.requires
	$(MAKE) -f storage/heap/CMakeFiles/hp_test2.dir/build.make storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o.provides.build
.PHONY : storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o.provides

storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o.provides.build: storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o

# Object files for target hp_test2
hp_test2_OBJECTS = \
"CMakeFiles/hp_test2.dir/hp_test2.c.o"

# External object files for target hp_test2
hp_test2_EXTERNAL_OBJECTS =

storage/heap/hp_test2: storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o
storage/heap/hp_test2: mysys/libmysys.a
storage/heap/hp_test2: storage/heap/libheap.a
storage/heap/hp_test2: dbug/libdbug.a
storage/heap/hp_test2: strings/libstrings.a
storage/heap/hp_test2: mysys/libmysys.a
storage/heap/hp_test2: dbug/libdbug.a
storage/heap/hp_test2: strings/libstrings.a
storage/heap/hp_test2: storage/heap/CMakeFiles/hp_test2.dir/build.make
storage/heap/hp_test2: storage/heap/CMakeFiles/hp_test2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable hp_test2"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/storage/heap && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hp_test2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
storage/heap/CMakeFiles/hp_test2.dir/build: storage/heap/hp_test2
.PHONY : storage/heap/CMakeFiles/hp_test2.dir/build

storage/heap/CMakeFiles/hp_test2.dir/requires: storage/heap/CMakeFiles/hp_test2.dir/hp_test2.c.o.requires
.PHONY : storage/heap/CMakeFiles/hp_test2.dir/requires

storage/heap/CMakeFiles/hp_test2.dir/clean:
	cd /build/buildd/mysql-5.5-5.5.24/builddir/storage/heap && $(CMAKE_COMMAND) -P CMakeFiles/hp_test2.dir/cmake_clean.cmake
.PHONY : storage/heap/CMakeFiles/hp_test2.dir/clean

storage/heap/CMakeFiles/hp_test2.dir/depend:
	cd /build/buildd/mysql-5.5-5.5.24/builddir && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /build/buildd/mysql-5.5-5.5.24 /build/buildd/mysql-5.5-5.5.24/storage/heap /build/buildd/mysql-5.5-5.5.24/builddir /build/buildd/mysql-5.5-5.5.24/builddir/storage/heap /build/buildd/mysql-5.5-5.5.24/builddir/storage/heap/CMakeFiles/hp_test2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : storage/heap/CMakeFiles/hp_test2.dir/depend

