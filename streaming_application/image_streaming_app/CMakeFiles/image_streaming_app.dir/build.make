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
CMAKE_SOURCE_DIR = /home/korbi/coredla_work/runtime/streaming/image_streaming_app

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/korbi/coredla_work/runtime/streaming/image_streaming_app

# Include any dependencies generated for this target.
include CMakeFiles/image_streaming_app.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/image_streaming_app.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/image_streaming_app.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/image_streaming_app.dir/flags.make

CMakeFiles/image_streaming_app.dir/command_line.o: CMakeFiles/image_streaming_app.dir/flags.make
CMakeFiles/image_streaming_app.dir/command_line.o: command_line.cpp
CMakeFiles/image_streaming_app.dir/command_line.o: CMakeFiles/image_streaming_app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/korbi/coredla_work/runtime/streaming/image_streaming_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/image_streaming_app.dir/command_line.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/image_streaming_app.dir/command_line.o -MF CMakeFiles/image_streaming_app.dir/command_line.o.d -o CMakeFiles/image_streaming_app.dir/command_line.o -c /home/korbi/coredla_work/runtime/streaming/image_streaming_app/command_line.cpp

CMakeFiles/image_streaming_app.dir/command_line.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image_streaming_app.dir/command_line.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/korbi/coredla_work/runtime/streaming/image_streaming_app/command_line.cpp > CMakeFiles/image_streaming_app.dir/command_line.i

CMakeFiles/image_streaming_app.dir/command_line.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image_streaming_app.dir/command_line.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/korbi/coredla_work/runtime/streaming/image_streaming_app/command_line.cpp -o CMakeFiles/image_streaming_app.dir/command_line.s

CMakeFiles/image_streaming_app.dir/image_streaming_app.o: CMakeFiles/image_streaming_app.dir/flags.make
CMakeFiles/image_streaming_app.dir/image_streaming_app.o: image_streaming_app.cpp
CMakeFiles/image_streaming_app.dir/image_streaming_app.o: CMakeFiles/image_streaming_app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/korbi/coredla_work/runtime/streaming/image_streaming_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/image_streaming_app.dir/image_streaming_app.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/image_streaming_app.dir/image_streaming_app.o -MF CMakeFiles/image_streaming_app.dir/image_streaming_app.o.d -o CMakeFiles/image_streaming_app.dir/image_streaming_app.o -c /home/korbi/coredla_work/runtime/streaming/image_streaming_app/image_streaming_app.cpp

CMakeFiles/image_streaming_app.dir/image_streaming_app.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image_streaming_app.dir/image_streaming_app.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/korbi/coredla_work/runtime/streaming/image_streaming_app/image_streaming_app.cpp > CMakeFiles/image_streaming_app.dir/image_streaming_app.i

CMakeFiles/image_streaming_app.dir/image_streaming_app.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image_streaming_app.dir/image_streaming_app.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/korbi/coredla_work/runtime/streaming/image_streaming_app/image_streaming_app.cpp -o CMakeFiles/image_streaming_app.dir/image_streaming_app.s

CMakeFiles/image_streaming_app.dir/raw_image.o: CMakeFiles/image_streaming_app.dir/flags.make
CMakeFiles/image_streaming_app.dir/raw_image.o: raw_image.cpp
CMakeFiles/image_streaming_app.dir/raw_image.o: CMakeFiles/image_streaming_app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/korbi/coredla_work/runtime/streaming/image_streaming_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/image_streaming_app.dir/raw_image.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/image_streaming_app.dir/raw_image.o -MF CMakeFiles/image_streaming_app.dir/raw_image.o.d -o CMakeFiles/image_streaming_app.dir/raw_image.o -c /home/korbi/coredla_work/runtime/streaming/image_streaming_app/raw_image.cpp

CMakeFiles/image_streaming_app.dir/raw_image.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image_streaming_app.dir/raw_image.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/korbi/coredla_work/runtime/streaming/image_streaming_app/raw_image.cpp > CMakeFiles/image_streaming_app.dir/raw_image.i

CMakeFiles/image_streaming_app.dir/raw_image.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image_streaming_app.dir/raw_image.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/korbi/coredla_work/runtime/streaming/image_streaming_app/raw_image.cpp -o CMakeFiles/image_streaming_app.dir/raw_image.s

CMakeFiles/image_streaming_app.dir/bmp_file.o: CMakeFiles/image_streaming_app.dir/flags.make
CMakeFiles/image_streaming_app.dir/bmp_file.o: bmp_file.cpp
CMakeFiles/image_streaming_app.dir/bmp_file.o: CMakeFiles/image_streaming_app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/korbi/coredla_work/runtime/streaming/image_streaming_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/image_streaming_app.dir/bmp_file.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/image_streaming_app.dir/bmp_file.o -MF CMakeFiles/image_streaming_app.dir/bmp_file.o.d -o CMakeFiles/image_streaming_app.dir/bmp_file.o -c /home/korbi/coredla_work/runtime/streaming/image_streaming_app/bmp_file.cpp

CMakeFiles/image_streaming_app.dir/bmp_file.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/image_streaming_app.dir/bmp_file.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/korbi/coredla_work/runtime/streaming/image_streaming_app/bmp_file.cpp > CMakeFiles/image_streaming_app.dir/bmp_file.i

CMakeFiles/image_streaming_app.dir/bmp_file.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/image_streaming_app.dir/bmp_file.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/korbi/coredla_work/runtime/streaming/image_streaming_app/bmp_file.cpp -o CMakeFiles/image_streaming_app.dir/bmp_file.s

# Object files for target image_streaming_app
image_streaming_app_OBJECTS = \
"CMakeFiles/image_streaming_app.dir/command_line.o" \
"CMakeFiles/image_streaming_app.dir/image_streaming_app.o" \
"CMakeFiles/image_streaming_app.dir/raw_image.o" \
"CMakeFiles/image_streaming_app.dir/bmp_file.o"

# External object files for target image_streaming_app
image_streaming_app_EXTERNAL_OBJECTS =

image_streaming_app: CMakeFiles/image_streaming_app.dir/command_line.o
image_streaming_app: CMakeFiles/image_streaming_app.dir/image_streaming_app.o
image_streaming_app: CMakeFiles/image_streaming_app.dir/raw_image.o
image_streaming_app: CMakeFiles/image_streaming_app.dir/bmp_file.o
image_streaming_app: CMakeFiles/image_streaming_app.dir/build.make
image_streaming_app: layout_transform/liblayout_transform.a
image_streaming_app: uio/libuio.a
image_streaming_app: CMakeFiles/image_streaming_app.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/korbi/coredla_work/runtime/streaming/image_streaming_app/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable image_streaming_app"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/image_streaming_app.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/image_streaming_app.dir/build: image_streaming_app
.PHONY : CMakeFiles/image_streaming_app.dir/build

CMakeFiles/image_streaming_app.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/image_streaming_app.dir/cmake_clean.cmake
.PHONY : CMakeFiles/image_streaming_app.dir/clean

CMakeFiles/image_streaming_app.dir/depend:
	cd /home/korbi/coredla_work/runtime/streaming/image_streaming_app && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/korbi/coredla_work/runtime/streaming/image_streaming_app /home/korbi/coredla_work/runtime/streaming/image_streaming_app /home/korbi/coredla_work/runtime/streaming/image_streaming_app /home/korbi/coredla_work/runtime/streaming/image_streaming_app /home/korbi/coredla_work/runtime/streaming/image_streaming_app/CMakeFiles/image_streaming_app.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/image_streaming_app.dir/depend

