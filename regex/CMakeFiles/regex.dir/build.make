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
include regex/CMakeFiles/regex.dir/depend.make

# Include the progress variables for this target.
include regex/CMakeFiles/regex.dir/progress.make

# Include the compile flags for this target's objects.
include regex/CMakeFiles/regex.dir/flags.make

regex/CMakeFiles/regex.dir/regcomp.c.o: regex/CMakeFiles/regex.dir/flags.make
regex/CMakeFiles/regex.dir/regcomp.c.o: regex/regcomp.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object regex/CMakeFiles/regex.dir/regcomp.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -o CMakeFiles/regex.dir/regcomp.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regcomp.c

regex/CMakeFiles/regex.dir/regcomp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regex.dir/regcomp.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regcomp.c > CMakeFiles/regex.dir/regcomp.c.i

regex/CMakeFiles/regex.dir/regcomp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regex.dir/regcomp.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regcomp.c -o CMakeFiles/regex.dir/regcomp.c.s

regex/CMakeFiles/regex.dir/regcomp.c.o.requires:
.PHONY : regex/CMakeFiles/regex.dir/regcomp.c.o.requires

regex/CMakeFiles/regex.dir/regcomp.c.o.provides: regex/CMakeFiles/regex.dir/regcomp.c.o.requires
	$(MAKE) -f regex/CMakeFiles/regex.dir/build.make regex/CMakeFiles/regex.dir/regcomp.c.o.provides.build
.PHONY : regex/CMakeFiles/regex.dir/regcomp.c.o.provides

regex/CMakeFiles/regex.dir/regcomp.c.o.provides.build: regex/CMakeFiles/regex.dir/regcomp.c.o

regex/CMakeFiles/regex.dir/regerror.c.o: regex/CMakeFiles/regex.dir/flags.make
regex/CMakeFiles/regex.dir/regerror.c.o: regex/regerror.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object regex/CMakeFiles/regex.dir/regerror.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -o CMakeFiles/regex.dir/regerror.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regerror.c

regex/CMakeFiles/regex.dir/regerror.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regex.dir/regerror.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regerror.c > CMakeFiles/regex.dir/regerror.c.i

regex/CMakeFiles/regex.dir/regerror.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regex.dir/regerror.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regerror.c -o CMakeFiles/regex.dir/regerror.c.s

regex/CMakeFiles/regex.dir/regerror.c.o.requires:
.PHONY : regex/CMakeFiles/regex.dir/regerror.c.o.requires

regex/CMakeFiles/regex.dir/regerror.c.o.provides: regex/CMakeFiles/regex.dir/regerror.c.o.requires
	$(MAKE) -f regex/CMakeFiles/regex.dir/build.make regex/CMakeFiles/regex.dir/regerror.c.o.provides.build
.PHONY : regex/CMakeFiles/regex.dir/regerror.c.o.provides

regex/CMakeFiles/regex.dir/regerror.c.o.provides.build: regex/CMakeFiles/regex.dir/regerror.c.o

regex/CMakeFiles/regex.dir/regexec.c.o: regex/CMakeFiles/regex.dir/flags.make
regex/CMakeFiles/regex.dir/regexec.c.o: regex/regexec.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object regex/CMakeFiles/regex.dir/regexec.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -o CMakeFiles/regex.dir/regexec.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regexec.c

regex/CMakeFiles/regex.dir/regexec.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regex.dir/regexec.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regexec.c > CMakeFiles/regex.dir/regexec.c.i

regex/CMakeFiles/regex.dir/regexec.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regex.dir/regexec.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regexec.c -o CMakeFiles/regex.dir/regexec.c.s

regex/CMakeFiles/regex.dir/regexec.c.o.requires:
.PHONY : regex/CMakeFiles/regex.dir/regexec.c.o.requires

regex/CMakeFiles/regex.dir/regexec.c.o.provides: regex/CMakeFiles/regex.dir/regexec.c.o.requires
	$(MAKE) -f regex/CMakeFiles/regex.dir/build.make regex/CMakeFiles/regex.dir/regexec.c.o.provides.build
.PHONY : regex/CMakeFiles/regex.dir/regexec.c.o.provides

regex/CMakeFiles/regex.dir/regexec.c.o.provides.build: regex/CMakeFiles/regex.dir/regexec.c.o

regex/CMakeFiles/regex.dir/regfree.c.o: regex/CMakeFiles/regex.dir/flags.make
regex/CMakeFiles/regex.dir/regfree.c.o: regex/regfree.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object regex/CMakeFiles/regex.dir/regfree.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -o CMakeFiles/regex.dir/regfree.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regfree.c

regex/CMakeFiles/regex.dir/regfree.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regex.dir/regfree.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regfree.c > CMakeFiles/regex.dir/regfree.c.i

regex/CMakeFiles/regex.dir/regfree.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regex.dir/regfree.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/regfree.c -o CMakeFiles/regex.dir/regfree.c.s

regex/CMakeFiles/regex.dir/regfree.c.o.requires:
.PHONY : regex/CMakeFiles/regex.dir/regfree.c.o.requires

regex/CMakeFiles/regex.dir/regfree.c.o.provides: regex/CMakeFiles/regex.dir/regfree.c.o.requires
	$(MAKE) -f regex/CMakeFiles/regex.dir/build.make regex/CMakeFiles/regex.dir/regfree.c.o.provides.build
.PHONY : regex/CMakeFiles/regex.dir/regfree.c.o.provides

regex/CMakeFiles/regex.dir/regfree.c.o.provides.build: regex/CMakeFiles/regex.dir/regfree.c.o

regex/CMakeFiles/regex.dir/reginit.c.o: regex/CMakeFiles/regex.dir/flags.make
regex/CMakeFiles/regex.dir/reginit.c.o: regex/reginit.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/sravang/Projects_New/mysql_rep/mysql_query_plan/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object regex/CMakeFiles/regex.dir/reginit.c.o"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -o CMakeFiles/regex.dir/reginit.c.o   -c /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/reginit.c

regex/CMakeFiles/regex.dir/reginit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/regex.dir/reginit.c.i"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -E /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/reginit.c > CMakeFiles/regex.dir/reginit.c.i

regex/CMakeFiles/regex.dir/reginit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/regex.dir/reginit.c.s"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -fPIC -S /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/reginit.c -o CMakeFiles/regex.dir/reginit.c.s

regex/CMakeFiles/regex.dir/reginit.c.o.requires:
.PHONY : regex/CMakeFiles/regex.dir/reginit.c.o.requires

regex/CMakeFiles/regex.dir/reginit.c.o.provides: regex/CMakeFiles/regex.dir/reginit.c.o.requires
	$(MAKE) -f regex/CMakeFiles/regex.dir/build.make regex/CMakeFiles/regex.dir/reginit.c.o.provides.build
.PHONY : regex/CMakeFiles/regex.dir/reginit.c.o.provides

regex/CMakeFiles/regex.dir/reginit.c.o.provides.build: regex/CMakeFiles/regex.dir/reginit.c.o

# Object files for target regex
regex_OBJECTS = \
"CMakeFiles/regex.dir/regcomp.c.o" \
"CMakeFiles/regex.dir/regerror.c.o" \
"CMakeFiles/regex.dir/regexec.c.o" \
"CMakeFiles/regex.dir/regfree.c.o" \
"CMakeFiles/regex.dir/reginit.c.o"

# External object files for target regex
regex_EXTERNAL_OBJECTS =

regex/libregex.a: regex/CMakeFiles/regex.dir/regcomp.c.o
regex/libregex.a: regex/CMakeFiles/regex.dir/regerror.c.o
regex/libregex.a: regex/CMakeFiles/regex.dir/regexec.c.o
regex/libregex.a: regex/CMakeFiles/regex.dir/regfree.c.o
regex/libregex.a: regex/CMakeFiles/regex.dir/reginit.c.o
regex/libregex.a: regex/CMakeFiles/regex.dir/build.make
regex/libregex.a: regex/CMakeFiles/regex.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libregex.a"
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && $(CMAKE_COMMAND) -P CMakeFiles/regex.dir/cmake_clean_target.cmake
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/regex.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
regex/CMakeFiles/regex.dir/build: regex/libregex.a
.PHONY : regex/CMakeFiles/regex.dir/build

regex/CMakeFiles/regex.dir/requires: regex/CMakeFiles/regex.dir/regcomp.c.o.requires
regex/CMakeFiles/regex.dir/requires: regex/CMakeFiles/regex.dir/regerror.c.o.requires
regex/CMakeFiles/regex.dir/requires: regex/CMakeFiles/regex.dir/regexec.c.o.requires
regex/CMakeFiles/regex.dir/requires: regex/CMakeFiles/regex.dir/regfree.c.o.requires
regex/CMakeFiles/regex.dir/requires: regex/CMakeFiles/regex.dir/reginit.c.o.requires
.PHONY : regex/CMakeFiles/regex.dir/requires

regex/CMakeFiles/regex.dir/clean:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex && $(CMAKE_COMMAND) -P CMakeFiles/regex.dir/cmake_clean.cmake
.PHONY : regex/CMakeFiles/regex.dir/clean

regex/CMakeFiles/regex.dir/depend:
	cd /home/sravang/Projects_New/mysql_rep/mysql_query_plan && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex /home/sravang/Projects_New/mysql_rep/mysql_query_plan /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex /home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/CMakeFiles/regex.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : regex/CMakeFiles/regex.dir/depend

