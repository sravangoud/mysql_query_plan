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
include storage/myisam/CMakeFiles/myisampack.dir/depend.make

# Include the progress variables for this target.
include storage/myisam/CMakeFiles/myisampack.dir/progress.make

# Include the compile flags for this target's objects.
include storage/myisam/CMakeFiles/myisampack.dir/flags.make

storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o: storage/myisam/CMakeFiles/myisampack.dir/flags.make
storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o: ../storage/myisam/myisampack.c
	$(CMAKE_COMMAND) -E cmake_progress_report /build/buildd/mysql-5.5-5.5.24/builddir/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/storage/myisam && /usr/bin/i686-linux-gnu-gcc-4.5  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/myisampack.dir/myisampack.c.o   -c /build/buildd/mysql-5.5-5.5.24/storage/myisam/myisampack.c

storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myisampack.dir/myisampack.c.i"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/storage/myisam && /usr/bin/i686-linux-gnu-gcc-4.5  $(C_DEFINES) $(C_FLAGS) -E /build/buildd/mysql-5.5-5.5.24/storage/myisam/myisampack.c > CMakeFiles/myisampack.dir/myisampack.c.i

storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myisampack.dir/myisampack.c.s"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/storage/myisam && /usr/bin/i686-linux-gnu-gcc-4.5  $(C_DEFINES) $(C_FLAGS) -S /build/buildd/mysql-5.5-5.5.24/storage/myisam/myisampack.c -o CMakeFiles/myisampack.dir/myisampack.c.s

storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o.requires:
.PHONY : storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o.requires

storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o.provides: storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o.requires
	$(MAKE) -f storage/myisam/CMakeFiles/myisampack.dir/build.make storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o.provides.build
.PHONY : storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o.provides

storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o.provides.build: storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o

# Object files for target myisampack
myisampack_OBJECTS = \
"CMakeFiles/myisampack.dir/myisampack.c.o"

# External object files for target myisampack
myisampack_EXTERNAL_OBJECTS =

storage/myisam/myisampack: storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o
storage/myisam/myisampack: storage/myisam/libmyisam.a
storage/myisam/myisampack: mysys/libmysys.a
storage/myisam/myisampack: dbug/libdbug.a
storage/myisam/myisampack: mysys/libmysys.a
storage/myisam/myisampack: dbug/libdbug.a
storage/myisam/myisampack: strings/libstrings.a
storage/myisam/myisampack: storage/myisam/CMakeFiles/myisampack.dir/build.make
storage/myisam/myisampack: storage/myisam/CMakeFiles/myisampack.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable myisampack"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/storage/myisam && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/myisampack.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
storage/myisam/CMakeFiles/myisampack.dir/build: storage/myisam/myisampack
.PHONY : storage/myisam/CMakeFiles/myisampack.dir/build

storage/myisam/CMakeFiles/myisampack.dir/requires: storage/myisam/CMakeFiles/myisampack.dir/myisampack.c.o.requires
.PHONY : storage/myisam/CMakeFiles/myisampack.dir/requires

storage/myisam/CMakeFiles/myisampack.dir/clean:
	cd /build/buildd/mysql-5.5-5.5.24/builddir/storage/myisam && $(CMAKE_COMMAND) -P CMakeFiles/myisampack.dir/cmake_clean.cmake
.PHONY : storage/myisam/CMakeFiles/myisampack.dir/clean

storage/myisam/CMakeFiles/myisampack.dir/depend:
	cd /build/buildd/mysql-5.5-5.5.24/builddir && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /build/buildd/mysql-5.5-5.5.24 /build/buildd/mysql-5.5-5.5.24/storage/myisam /build/buildd/mysql-5.5-5.5.24/builddir /build/buildd/mysql-5.5-5.5.24/builddir/storage/myisam /build/buildd/mysql-5.5-5.5.24/builddir/storage/myisam/CMakeFiles/myisampack.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : storage/myisam/CMakeFiles/myisampack.dir/depend

