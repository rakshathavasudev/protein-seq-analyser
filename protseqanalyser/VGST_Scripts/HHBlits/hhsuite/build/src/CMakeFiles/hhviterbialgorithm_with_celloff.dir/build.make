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
include src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/flags.make

src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o: src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/flags.make
src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o: ../src/hhviterbialgorithm.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/psa/VGST_Scripts/HHBlits/hhsuite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o -c /home/psa/VGST_Scripts/HHBlits/hhsuite/src/hhviterbialgorithm.cpp

src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.i"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/psa/VGST_Scripts/HHBlits/hhsuite/src/hhviterbialgorithm.cpp > CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.i

src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.s"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/psa/VGST_Scripts/HHBlits/hhsuite/src/hhviterbialgorithm.cpp -o CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.s

src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o.requires:

.PHONY : src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o.requires

src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o.provides: src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/build.make src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o.provides.build
.PHONY : src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o.provides

src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o.provides.build: src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o


hhviterbialgorithm_with_celloff: src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o
hhviterbialgorithm_with_celloff: src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/build.make

.PHONY : hhviterbialgorithm_with_celloff

# Rule to build all files generated by this target.
src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/build: hhviterbialgorithm_with_celloff

.PHONY : src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/build

src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/requires: src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o.requires

.PHONY : src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/requires

src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/clean:
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && $(CMAKE_COMMAND) -P CMakeFiles/hhviterbialgorithm_with_celloff.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/clean

src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/depend:
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/psa/VGST_Scripts/HHBlits/hhsuite /home/psa/VGST_Scripts/HHBlits/hhsuite/src /home/psa/VGST_Scripts/HHBlits/hhsuite/build /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/depend

