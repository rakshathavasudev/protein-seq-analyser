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
include src/CMakeFiles/hhmake.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/hhmake.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/hhmake.dir/flags.make

src/CMakeFiles/hhmake.dir/hhmake.cpp.o: src/CMakeFiles/hhmake.dir/flags.make
src/CMakeFiles/hhmake.dir/hhmake.cpp.o: ../src/hhmake.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/psa/VGST_Scripts/HHBlits/hhsuite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/hhmake.dir/hhmake.cpp.o"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hhmake.dir/hhmake.cpp.o -c /home/psa/VGST_Scripts/HHBlits/hhsuite/src/hhmake.cpp

src/CMakeFiles/hhmake.dir/hhmake.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hhmake.dir/hhmake.cpp.i"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/psa/VGST_Scripts/HHBlits/hhsuite/src/hhmake.cpp > CMakeFiles/hhmake.dir/hhmake.cpp.i

src/CMakeFiles/hhmake.dir/hhmake.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hhmake.dir/hhmake.cpp.s"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/psa/VGST_Scripts/HHBlits/hhsuite/src/hhmake.cpp -o CMakeFiles/hhmake.dir/hhmake.cpp.s

src/CMakeFiles/hhmake.dir/hhmake.cpp.o.requires:

.PHONY : src/CMakeFiles/hhmake.dir/hhmake.cpp.o.requires

src/CMakeFiles/hhmake.dir/hhmake.cpp.o.provides: src/CMakeFiles/hhmake.dir/hhmake.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/hhmake.dir/build.make src/CMakeFiles/hhmake.dir/hhmake.cpp.o.provides.build
.PHONY : src/CMakeFiles/hhmake.dir/hhmake.cpp.o.provides

src/CMakeFiles/hhmake.dir/hhmake.cpp.o.provides.build: src/CMakeFiles/hhmake.dir/hhmake.cpp.o


# Object files for target hhmake
hhmake_OBJECTS = \
"CMakeFiles/hhmake.dir/hhmake.cpp.o"

# External object files for target hhmake
hhmake_EXTERNAL_OBJECTS = \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/CS_OBJECTS.dir/cs/aa.cc.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/CS_OBJECTS.dir/cs/as.cc.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/CS_OBJECTS.dir/cs/assert_helpers.cc.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/CS_OBJECTS.dir/cs/blosum_matrix.cc.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/CS_OBJECTS.dir/cs/getopt_pp.cc.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/CS_OBJECTS.dir/cs/log.cc.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/CS_OBJECTS.dir/cs/application.cc.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhblits.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhdecl.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhhit.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhmatrices.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhsearch.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhalign.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhhitlist.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhposteriordecoder.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhutil.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/util.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhalignment.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhforwardalgorithm.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhhmm.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhposteriordecoderrunner.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhviterbialgorithm.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhfullalignment.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhhmmsimd.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhposteriormatrix.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhviterbi.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhbacktracemac.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhmacalgorithm.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhprefilter.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhviterbimatrix.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhbackwardalgorithm.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhdatabase.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhhalfalignment.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhviterbirunner.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/HH_OBJECTS.dir/hhfunc.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/hhviterbialgorithm_and_ss.dir/hhviterbialgorithm.cpp.o" \
"/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/hhviterbialgorithm_with_celloff_and_ss.dir/hhviterbialgorithm.cpp.o"

src/hhmake: src/CMakeFiles/hhmake.dir/hhmake.cpp.o
src/hhmake: src/CMakeFiles/CS_OBJECTS.dir/cs/aa.cc.o
src/hhmake: src/CMakeFiles/CS_OBJECTS.dir/cs/as.cc.o
src/hhmake: src/CMakeFiles/CS_OBJECTS.dir/cs/assert_helpers.cc.o
src/hhmake: src/CMakeFiles/CS_OBJECTS.dir/cs/blosum_matrix.cc.o
src/hhmake: src/CMakeFiles/CS_OBJECTS.dir/cs/getopt_pp.cc.o
src/hhmake: src/CMakeFiles/CS_OBJECTS.dir/cs/log.cc.o
src/hhmake: src/CMakeFiles/CS_OBJECTS.dir/cs/application.cc.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhblits.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhdecl.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhhit.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhmatrices.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhsearch.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhalign.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhhitlist.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhposteriordecoder.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhutil.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/util.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhalignment.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhforwardalgorithm.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhhmm.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhposteriordecoderrunner.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhviterbialgorithm.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhfullalignment.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhhmmsimd.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhposteriormatrix.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhviterbi.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhbacktracemac.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhmacalgorithm.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhprefilter.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhviterbimatrix.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhbackwardalgorithm.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhdatabase.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhhalfalignment.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhviterbirunner.cpp.o
src/hhmake: src/CMakeFiles/HH_OBJECTS.dir/hhfunc.cpp.o
src/hhmake: src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o
src/hhmake: src/CMakeFiles/hhviterbialgorithm_and_ss.dir/hhviterbialgorithm.cpp.o
src/hhmake: src/CMakeFiles/hhviterbialgorithm_with_celloff_and_ss.dir/hhviterbialgorithm.cpp.o
src/hhmake: src/CMakeFiles/hhmake.dir/build.make
src/hhmake: lib/ffindex/src/libffindex.a
src/hhmake: src/CMakeFiles/hhmake.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/psa/VGST_Scripts/HHBlits/hhsuite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable hhmake"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hhmake.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/hhmake.dir/build: src/hhmake

.PHONY : src/CMakeFiles/hhmake.dir/build

src/CMakeFiles/hhmake.dir/requires: src/CMakeFiles/hhmake.dir/hhmake.cpp.o.requires

.PHONY : src/CMakeFiles/hhmake.dir/requires

src/CMakeFiles/hhmake.dir/clean:
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && $(CMAKE_COMMAND) -P CMakeFiles/hhmake.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/hhmake.dir/clean

src/CMakeFiles/hhmake.dir/depend:
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/psa/VGST_Scripts/HHBlits/hhsuite /home/psa/VGST_Scripts/HHBlits/hhsuite/src /home/psa/VGST_Scripts/HHBlits/hhsuite/build /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/hhmake.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/hhmake.dir/depend

