# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/hnu/gz_robot/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hnu/gz_robot/build

# Utility rule file for _run_tests_amcl_rostest_test_global_localization_stage.xml.

# Include the progress variables for this target.
include navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml.dir/progress.make

navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml:
	cd /home/hnu/gz_robot/build/navigation/amcl && ../../catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/catkin/cmake/test/run_tests.py /home/hnu/gz_robot/build/test_results/amcl/rostest-test_global_localization_stage.xml "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/hnu/gz_robot/src/navigation/amcl --package=amcl --results-filename test_global_localization_stage.xml --results-base-dir \"/home/hnu/gz_robot/build/test_results\" /home/hnu/gz_robot/src/navigation/amcl/test/global_localization_stage.xml "

_run_tests_amcl_rostest_test_global_localization_stage.xml: navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml
_run_tests_amcl_rostest_test_global_localization_stage.xml: navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml.dir/build.make

.PHONY : _run_tests_amcl_rostest_test_global_localization_stage.xml

# Rule to build all files generated by this target.
navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml.dir/build: _run_tests_amcl_rostest_test_global_localization_stage.xml

.PHONY : navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml.dir/build

navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml.dir/clean:
	cd /home/hnu/gz_robot/build/navigation/amcl && $(CMAKE_COMMAND) -P CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml.dir/cmake_clean.cmake
.PHONY : navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml.dir/clean

navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml.dir/depend:
	cd /home/hnu/gz_robot/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hnu/gz_robot/src /home/hnu/gz_robot/src/navigation/amcl /home/hnu/gz_robot/build /home/hnu/gz_robot/build/navigation/amcl /home/hnu/gz_robot/build/navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : navigation/amcl/CMakeFiles/_run_tests_amcl_rostest_test_global_localization_stage.xml.dir/depend

