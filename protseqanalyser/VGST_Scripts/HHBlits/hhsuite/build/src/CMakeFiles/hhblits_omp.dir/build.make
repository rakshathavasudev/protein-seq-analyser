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
include src/CMakeFiles/hhblits_omp.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/hhblits_omp.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/hhblits_omp.dir/flags.make

src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o: src/CMakeFiles/hhblits_omp.dir/flags.make
src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o: ../src/hhblits_omp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/psa/VGST_Scripts/HHBlits/hhsuite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o -c /home/psa/VGST_Scripts/HHBlits/hhsuite/src/hhblits_omp.cpp

src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.i"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/psa/VGST_Scripts/HHBlits/hhsuite/src/hhblits_omp.cpp > CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.i

src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.s"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/psa/VGST_Scripts/HHBlits/hhsuite/src/hhblits_omp.cpp -o CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.s

src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o.requires:

.PHONY : src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o.requires

src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o.provides: src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/hhblits_omp.dir/build.make src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o.provides.build
.PHONY : src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o.provides

src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o.provides.build: src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o


# Object files for target hhblits_omp
hhblits_omp_OBJECTS = \
"CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o"

# External object files for target hhblits_omp
hhblits_omp_EXTERNAL_OBJECTS = \
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

src/hhblits_omp: src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o
src/hhblits_omp: src/CMakeFiles/CS_OBJECTS.dir/cs/aa.cc.o
src/hhblits_omp: src/CMakeFiles/CS_OBJECTS.dir/cs/as.cc.o
src/hhblits_omp: src/CMakeFiles/CS_OBJECTS.dir/cs/assert_helpers.cc.o
src/hhblits_omp: src/CMakeFiles/CS_OBJECTS.dir/cs/blosum_matrix.cc.o
src/hhblits_omp: src/CMakeFiles/CS_OBJECTS.dir/cs/getopt_pp.cc.o
src/hhblits_omp: src/CMakeFiles/CS_OBJECTS.dir/cs/log.cc.o
src/hhblits_omp: src/CMakeFiles/CS_OBJECTS.dir/cs/application.cc.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhblits.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhdecl.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhhit.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhmatrices.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhsearch.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhalign.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhhitlist.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhposteriordecoder.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhutil.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/util.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhalignment.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhforwardalgorithm.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhhmm.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhposteriordecoderrunner.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhviterbialgorithm.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhfullalignment.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhhmmsimd.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhposteriormatrix.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhviterbi.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhbacktracemac.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhmacalgorithm.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhprefilter.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhviterbimatrix.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhbackwardalgorithm.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhdatabase.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhhalfalignment.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhviterbirunner.cpp.o
src/hhblits_omp: src/CMakeFiles/HH_OBJECTS.dir/hhfunc.cpp.o
src/hhblits_omp: src/CMakeFiles/hhviterbialgorithm_with_celloff.dir/hhviterbialgorithm.cpp.o
src/hhblits_omp: src/CMakeFiles/hhviterbialgorithm_and_ss.dir/hhviterbialgorithm.cpp.o
src/hhblits_omp: src/CMakeFiles/hhviterbialgorithm_with_celloff_and_ss.dir/hhviterbialgorithm.cpp.o
src/hhblits_omp: src/CMakeFiles/hhblits_omp.dir/build.make
src/hhblits_omp: lib/ffindex/src/libffindex.a
src/hhblits_omp: src/CMakeFiles/hhblits_omp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/psa/VGST_Scripts/HHBlits/hhsuite/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable hhblits_omp"
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hhblits_omp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/hhblits_omp.dir/build: src/hhblits_omp

.PHONY : src/CMakeFiles/hhblits_omp.dir/build

src/CMakeFiles/hhblits_omp.dir/requires: src/CMakeFiles/hhblits_omp.dir/hhblits_omp.cpp.o.requires

.PHONY : src/CMakeFiles/hhblits_omp.dir/requires

src/CMakeFiles/hhblits_omp.dir/clean:
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src && $(CMAKE_COMMAND) -P CMakeFiles/hhblits_omp.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/hhblits_omp.dir/clean

src/CMakeFiles/hhblits_omp.dir/depend:
	cd /home/psa/VGST_Scripts/HHBlits/hhsuite/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/psa/VGST_Scripts/HHBlits/hhsuite /home/psa/VGST_Scripts/HHBlits/hhsuite/src /home/psa/VGST_Scripts/HHBlits/hhsuite/build /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src /home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/CMakeFiles/hhblits_omp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/hhblits_omp.dir/depend

