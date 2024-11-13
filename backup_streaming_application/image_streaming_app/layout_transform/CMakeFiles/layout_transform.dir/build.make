# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/korbi/coredla_work/runtime/streaming/streaming_app

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/korbi/coredla_work/runtime/streaming/streaming_app

# Include any dependencies generated for this target.
include layout_transform/CMakeFiles/layout_transform.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include layout_transform/CMakeFiles/layout_transform.dir/compiler_depend.make

# Include the progress variables for this target.
include layout_transform/CMakeFiles/layout_transform.dir/progress.make

# Include the compile flags for this target's objects.
include layout_transform/CMakeFiles/layout_transform.dir/flags.make

layout_transform/CMakeFiles/layout_transform.dir/source/LayoutTransform.o: layout_transform/CMakeFiles/layout_transform.dir/flags.make
layout_transform/CMakeFiles/layout_transform.dir/source/LayoutTransform.o: layout_transform/source/LayoutTransform.cpp
layout_transform/CMakeFiles/layout_transform.dir/source/LayoutTransform.o: layout_transform/CMakeFiles/layout_transform.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/korbi/coredla_work/runtime/streaming/streaming_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object layout_transform/CMakeFiles/layout_transform.dir/source/LayoutTransform.o"
	cd /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT layout_transform/CMakeFiles/layout_transform.dir/source/LayoutTransform.o -MF CMakeFiles/layout_transform.dir/source/LayoutTransform.o.d -o CMakeFiles/layout_transform.dir/source/LayoutTransform.o -c /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform/source/LayoutTransform.cpp

layout_transform/CMakeFiles/layout_transform.dir/source/LayoutTransform.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/layout_transform.dir/source/LayoutTransform.i"
	cd /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform/source/LayoutTransform.cpp > CMakeFiles/layout_transform.dir/source/LayoutTransform.i

layout_transform/CMakeFiles/layout_transform.dir/source/LayoutTransform.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/layout_transform.dir/source/LayoutTransform.s"
	cd /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform/source/LayoutTransform.cpp -o CMakeFiles/layout_transform.dir/source/LayoutTransform.s

# Object files for target layout_transform
layout_transform_OBJECTS = \
"CMakeFiles/layout_transform.dir/source/LayoutTransform.o"

# External object files for target layout_transform
layout_transform_EXTERNAL_OBJECTS =

layout_transform/liblayout_transform.a: layout_transform/CMakeFiles/layout_transform.dir/source/LayoutTransform.o
layout_transform/liblayout_transform.a: layout_transform/CMakeFiles/layout_transform.dir/build.make
layout_transform/liblayout_transform.a: layout_transform/CMakeFiles/layout_transform.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/korbi/coredla_work/runtime/streaming/streaming_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library liblayout_transform.a"
	cd /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform && $(CMAKE_COMMAND) -P CMakeFiles/layout_transform.dir/cmake_clean_target.cmake
	cd /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/layout_transform.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
layout_transform/CMakeFiles/layout_transform.dir/build: layout_transform/liblayout_transform.a
.PHONY : layout_transform/CMakeFiles/layout_transform.dir/build

layout_transform/CMakeFiles/layout_transform.dir/clean:
	cd /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform && $(CMAKE_COMMAND) -P CMakeFiles/layout_transform.dir/cmake_clean.cmake
.PHONY : layout_transform/CMakeFiles/layout_transform.dir/clean

layout_transform/CMakeFiles/layout_transform.dir/depend:
	cd /home/korbi/coredla_work/runtime/streaming/streaming_app && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/korbi/coredla_work/runtime/streaming/streaming_app /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform /home/korbi/coredla_work/runtime/streaming/streaming_app /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform /home/korbi/coredla_work/runtime/streaming/streaming_app/layout_transform/CMakeFiles/layout_transform.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : layout_transform/CMakeFiles/layout_transform.dir/depend

