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
include libmysqld/examples/CMakeFiles/mysql_embedded.dir/depend.make

# Include the progress variables for this target.
include libmysqld/examples/CMakeFiles/mysql_embedded.dir/progress.make

# Include the compile flags for this target's objects.
include libmysqld/examples/CMakeFiles/mysql_embedded.dir/flags.make

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o: libmysqld/examples/CMakeFiles/mysql_embedded.dir/flags.make
libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o: ../client/completion_hash.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /build/buildd/mysql-5.5-5.5.24/builddir/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && /usr/bin/i686-linux-gnu-g++-4.5   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o -c /build/buildd/mysql-5.5-5.5.24/client/completion_hash.cc

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.i"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && /usr/bin/i686-linux-gnu-g++-4.5  $(CXX_DEFINES) $(CXX_FLAGS) -E /build/buildd/mysql-5.5-5.5.24/client/completion_hash.cc > CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.i

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.s"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && /usr/bin/i686-linux-gnu-g++-4.5  $(CXX_DEFINES) $(CXX_FLAGS) -S /build/buildd/mysql-5.5-5.5.24/client/completion_hash.cc -o CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.s

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o.requires:
.PHONY : libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o.requires

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o.provides: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o.requires
	$(MAKE) -f libmysqld/examples/CMakeFiles/mysql_embedded.dir/build.make libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o.provides.build
.PHONY : libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o.provides

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o.provides.build: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o: libmysqld/examples/CMakeFiles/mysql_embedded.dir/flags.make
libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o: ../client/mysql.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /build/buildd/mysql-5.5-5.5.24/builddir/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && /usr/bin/i686-linux-gnu-g++-4.5   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o -c /build/buildd/mysql-5.5-5.5.24/client/mysql.cc

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.i"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && /usr/bin/i686-linux-gnu-g++-4.5  $(CXX_DEFINES) $(CXX_FLAGS) -E /build/buildd/mysql-5.5-5.5.24/client/mysql.cc > CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.i

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.s"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && /usr/bin/i686-linux-gnu-g++-4.5  $(CXX_DEFINES) $(CXX_FLAGS) -S /build/buildd/mysql-5.5-5.5.24/client/mysql.cc -o CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.s

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o.requires:
.PHONY : libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o.requires

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o.provides: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o.requires
	$(MAKE) -f libmysqld/examples/CMakeFiles/mysql_embedded.dir/build.make libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o.provides.build
.PHONY : libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o.provides

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o.provides.build: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o: libmysqld/examples/CMakeFiles/mysql_embedded.dir/flags.make
libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o: ../client/readline.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /build/buildd/mysql-5.5-5.5.24/builddir/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && /usr/bin/i686-linux-gnu-g++-4.5   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o -c /build/buildd/mysql-5.5-5.5.24/client/readline.cc

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.i"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && /usr/bin/i686-linux-gnu-g++-4.5  $(CXX_DEFINES) $(CXX_FLAGS) -E /build/buildd/mysql-5.5-5.5.24/client/readline.cc > CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.i

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.s"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && /usr/bin/i686-linux-gnu-g++-4.5  $(CXX_DEFINES) $(CXX_FLAGS) -S /build/buildd/mysql-5.5-5.5.24/client/readline.cc -o CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.s

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o.requires:
.PHONY : libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o.requires

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o.provides: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o.requires
	$(MAKE) -f libmysqld/examples/CMakeFiles/mysql_embedded.dir/build.make libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o.provides.build
.PHONY : libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o.provides

libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o.provides.build: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o

# Object files for target mysql_embedded
mysql_embedded_OBJECTS = \
"CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o" \
"CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o" \
"CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o"

# External object files for target mysql_embedded
mysql_embedded_EXTERNAL_OBJECTS =

libmysqld/examples/mysql_embedded: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o
libmysqld/examples/mysql_embedded: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o
libmysqld/examples/mysql_embedded: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o
libmysqld/examples/mysql_embedded: libmysqld/libmysqld.a
libmysqld/examples/mysql_embedded: /usr/lib/i386-linux-gnu/libreadline.so
libmysqld/examples/mysql_embedded: libmysqld/examples/CMakeFiles/mysql_embedded.dir/build.make
libmysqld/examples/mysql_embedded: libmysqld/examples/CMakeFiles/mysql_embedded.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable mysql_embedded"
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mysql_embedded.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libmysqld/examples/CMakeFiles/mysql_embedded.dir/build: libmysqld/examples/mysql_embedded
.PHONY : libmysqld/examples/CMakeFiles/mysql_embedded.dir/build

libmysqld/examples/CMakeFiles/mysql_embedded.dir/requires: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/completion_hash.cc.o.requires
libmysqld/examples/CMakeFiles/mysql_embedded.dir/requires: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/mysql.cc.o.requires
libmysqld/examples/CMakeFiles/mysql_embedded.dir/requires: libmysqld/examples/CMakeFiles/mysql_embedded.dir/__/__/client/readline.cc.o.requires
.PHONY : libmysqld/examples/CMakeFiles/mysql_embedded.dir/requires

libmysqld/examples/CMakeFiles/mysql_embedded.dir/clean:
	cd /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples && $(CMAKE_COMMAND) -P CMakeFiles/mysql_embedded.dir/cmake_clean.cmake
.PHONY : libmysqld/examples/CMakeFiles/mysql_embedded.dir/clean

libmysqld/examples/CMakeFiles/mysql_embedded.dir/depend:
	cd /build/buildd/mysql-5.5-5.5.24/builddir && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /build/buildd/mysql-5.5-5.5.24 /build/buildd/mysql-5.5-5.5.24/libmysqld/examples /build/buildd/mysql-5.5-5.5.24/builddir /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples /build/buildd/mysql-5.5-5.5.24/builddir/libmysqld/examples/CMakeFiles/mysql_embedded.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libmysqld/examples/CMakeFiles/mysql_embedded.dir/depend

