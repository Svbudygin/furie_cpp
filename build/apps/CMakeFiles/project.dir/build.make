# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/sergeybudygin/furie_cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/sergeybudygin/furie_cpp/build

# Include any dependencies generated for this target.
include apps/CMakeFiles/project.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include apps/CMakeFiles/project.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/CMakeFiles/project.dir/progress.make

# Include the compile flags for this target's objects.
include apps/CMakeFiles/project.dir/flags.make

apps/CMakeFiles/project.dir/main.cpp.o: apps/CMakeFiles/project.dir/flags.make
apps/CMakeFiles/project.dir/main.cpp.o: /Users/sergeybudygin/furie_cpp/apps/main.cpp
apps/CMakeFiles/project.dir/main.cpp.o: apps/CMakeFiles/project.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/sergeybudygin/furie_cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object apps/CMakeFiles/project.dir/main.cpp.o"
	cd /Users/sergeybudygin/furie_cpp/build/apps && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT apps/CMakeFiles/project.dir/main.cpp.o -MF CMakeFiles/project.dir/main.cpp.o.d -o CMakeFiles/project.dir/main.cpp.o -c /Users/sergeybudygin/furie_cpp/apps/main.cpp

apps/CMakeFiles/project.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/project.dir/main.cpp.i"
	cd /Users/sergeybudygin/furie_cpp/build/apps && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sergeybudygin/furie_cpp/apps/main.cpp > CMakeFiles/project.dir/main.cpp.i

apps/CMakeFiles/project.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/project.dir/main.cpp.s"
	cd /Users/sergeybudygin/furie_cpp/build/apps && /usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sergeybudygin/furie_cpp/apps/main.cpp -o CMakeFiles/project.dir/main.cpp.s

# Object files for target project
project_OBJECTS = \
"CMakeFiles/project.dir/main.cpp.o"

# External object files for target project
project_EXTERNAL_OBJECTS =

apps/project: apps/CMakeFiles/project.dir/main.cpp.o
apps/project: apps/CMakeFiles/project.dir/build.make
apps/project: src/libfft.a
apps/project: apps/CMakeFiles/project.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/sergeybudygin/furie_cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable project"
	cd /Users/sergeybudygin/furie_cpp/build/apps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/project.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/CMakeFiles/project.dir/build: apps/project
.PHONY : apps/CMakeFiles/project.dir/build

apps/CMakeFiles/project.dir/clean:
	cd /Users/sergeybudygin/furie_cpp/build/apps && $(CMAKE_COMMAND) -P CMakeFiles/project.dir/cmake_clean.cmake
.PHONY : apps/CMakeFiles/project.dir/clean

apps/CMakeFiles/project.dir/depend:
	cd /Users/sergeybudygin/furie_cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sergeybudygin/furie_cpp /Users/sergeybudygin/furie_cpp/apps /Users/sergeybudygin/furie_cpp/build /Users/sergeybudygin/furie_cpp/build/apps /Users/sergeybudygin/furie_cpp/build/apps/CMakeFiles/project.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : apps/CMakeFiles/project.dir/depend

