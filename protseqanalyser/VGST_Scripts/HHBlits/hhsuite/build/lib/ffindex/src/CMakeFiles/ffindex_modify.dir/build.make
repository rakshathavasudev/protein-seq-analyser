# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/psa/VGST_Scripts/HHBlits/hhsuite

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/psa/VGST_Scripts/HHBlits/hhsuite/build

# Include any dependencies generated for this target.
include lib/ffindex/src/CMakeFiles/ffindex_modify.dir/depend.make

# Include the progress variables for this target.
include lib/ffindex/src/CMakeFiles/ffindex_modify.dir/progress.make

# Include the compile flags for this target's objects.
include lib/ffindex/src/CMakeFiles/ffindex_modify.dir/flags.make

lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o: lib/ffindex/src/CMakeFiles/ffindex_modify.dir/flags.make
lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o: ../lib/ffindex/src/ffindex_modify.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/psa/VGST_Scripts/HHBlits/hhsuite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/lib/ffindex/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o   -c /home/psa/VGST_Scripts/HHBlits/hhsuite/lib/ffindex/src/ffindex_modify.c

lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/ffindex_modify.dir/ffindex_modify.c.i"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/lib/ffindex/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/psa/VGST_Scripts/HHBlits/hhsuite/lib/ffindex/src/ffindex_modify.c > CMakeFiles/ffindex_modify.dir/ffindex_modify.c.i

lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/ffindex_modify.dir/ffindex_modify.c.s"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/lib/ffindex/src && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/psa/VGST_Scripts/HHBlits/hhsuite/lib/ffindex/src/ffindex_modify.c -o CMakeFiles/ffindex_modify.dir/ffindex_modify.c.s

lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o.requires:

.PHONY : lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o.requires

lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o.provides: lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o.requires
	$(MAKE) -f lib/ffindex/src/CMakeFiles/ffindex_modify.dir/build.make lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o.provides.build
.PHONY : lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o.provides

lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o.provides.build: lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o


# Object files for target ffindex_modify
ffindex_modify_OBJECTS = \
"CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o"

# External object files for target ffindex_modify
ffindex_modify_EXTERNAL_OBJECTS =

lib/ffindex/src/ffindex_modify: lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o
lib/ffindex/src/ffindex_modify: lib/ffindex/src/CMakeFiles/ffindex_modify.dir/build.make
lib/ffindex/src/ffindex_modify: lib/ffindex/src/libffindex.a
lib/ffindex/src/ffindex_modify: lib/ffindex/src/CMakeFiles/ffindex_modify.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/psa/VGST_Scripts/HHBlits/hhsuite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ffindex_modify"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/lib/ffindex/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ffindex_modify.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/ffindex/src/CMakeFiles/ffindex_modify.dir/build: lib/ffindex/src/ffindex_modify

.PHONY : lib/ffindex/src/CMakeFiles/ffindex_modify.dir/build

lib/ffindex/src/CMakeFiles/ffindex_modify.dir/requires: lib/ffindex/src/CMakeFiles/ffindex_modify.dir/ffindex_modify.c.o.requires

.PHONY : lib/ffindex/src/CMakeFiles/ffindex_modify.dir/requires

lib/ffindex/src/CMakeFiles/ffindex_modify.dir/clean:
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/lib/ffindex/src && $(CMAKE_COMMAND) -P CMakeFiles/ffindex_modify.dir/cmake_clean.cmake
.PHONY : lib/ffindex/src/CMakeFiles/ffindex_modify.dir/clean

lib/ffindex/src/CMakeFiles/ffindex_modify.dir/depend:
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/psa/VGST_Scripts/HHBlits/hhsuite /home/psa/VGST_Scripts/HHBlits/hhsuite/lib/ffindex/src /home/psa/VGST_Scripts/HHBlits/hhsuite/build /home/psa/VGST_Scripts/HHBlits/hhsuite/build/lib/ffindex/src /home/psa/VGST_Scripts/HHBlits/hhsuite/build/lib/ffindex/src/CMakeFiles/ffindex_modify.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/ffindex/src/CMakeFiles/ffindex_modify.dir/depend

