# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /home/hkim/liblightnvm

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hkim/liblightnvm/build

# Include any dependencies generated for this target.
include CMakeFiles/lightnvm_a.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lightnvm_a.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lightnvm_a.dir/flags.make

CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o: ../src/nvm_spec.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o   -c /home/hkim/liblightnvm/src/nvm_spec.c

CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_spec.c > CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_spec.c -o CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o: ../src/nvm_be.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o   -c /home/hkim/liblightnvm/src/nvm_be.c

CMakeFiles/lightnvm_a.dir/src/nvm_be.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_be.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_be.c > CMakeFiles/lightnvm_a.dir/src/nvm_be.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_be.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_be.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_be.c -o CMakeFiles/lightnvm_a.dir/src/nvm_be.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o: ../src/nvm_be_ioctl.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o   -c /home/hkim/liblightnvm/src/nvm_be_ioctl.c

CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_be_ioctl.c > CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_be_ioctl.c -o CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o: ../src/nvm_be_sysfs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o   -c /home/hkim/liblightnvm/src/nvm_be_sysfs.c

CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_be_sysfs.c > CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_be_sysfs.c -o CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o: ../src/nvm_be_lba.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o   -c /home/hkim/liblightnvm/src/nvm_be_lba.c

CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_be_lba.c > CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_be_lba.c -o CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o: ../src/nvm_dev.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o   -c /home/hkim/liblightnvm/src/nvm_dev.c

CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_dev.c > CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_dev.c -o CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o: ../src/nvm_buf.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o   -c /home/hkim/liblightnvm/src/nvm_buf.c

CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_buf.c > CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_buf.c -o CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o: ../src/nvm_bbt.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o   -c /home/hkim/liblightnvm/src/nvm_bbt.c

CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_bbt.c > CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_bbt.c -o CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o: ../src/nvm_geo.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o   -c /home/hkim/liblightnvm/src/nvm_geo.c

CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_geo.c > CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_geo.c -o CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o: ../src/nvm_ver.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o   -c /home/hkim/liblightnvm/src/nvm_ver.c

CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_ver.c > CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_ver.c -o CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o: ../src/nvm_cmd.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o   -c /home/hkim/liblightnvm/src/nvm_cmd.c

CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_cmd.c > CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_cmd.c -o CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o: ../src/nvm_addr.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o   -c /home/hkim/liblightnvm/src/nvm_addr.c

CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_addr.c > CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_addr.c -o CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o: ../src/nvm_vblk.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o   -c /home/hkim/liblightnvm/src/nvm_vblk.c

CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_vblk.c > CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_vblk.c -o CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o


CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o: CMakeFiles/lightnvm_a.dir/flags.make
CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o: ../src/nvm_bounds.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o   -c /home/hkim/liblightnvm/src/nvm_bounds.c

CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hkim/liblightnvm/src/nvm_bounds.c > CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.i

CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hkim/liblightnvm/src/nvm_bounds.c -o CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.s

CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o.requires:

.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o.requires

CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o.provides: CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o.requires
	$(MAKE) -f CMakeFiles/lightnvm_a.dir/build.make CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o.provides.build
.PHONY : CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o.provides

CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o.provides.build: CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o


# Object files for target lightnvm_a
lightnvm_a_OBJECTS = \
"CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o" \
"CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o"

# External object files for target lightnvm_a
lightnvm_a_EXTERNAL_OBJECTS =

liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o
liblightnvm.a: CMakeFiles/lightnvm_a.dir/build.make
liblightnvm.a: CMakeFiles/lightnvm_a.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hkim/liblightnvm/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Linking C static library liblightnvm.a"
	$(CMAKE_COMMAND) -P CMakeFiles/lightnvm_a.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lightnvm_a.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lightnvm_a.dir/build: liblightnvm.a

.PHONY : CMakeFiles/lightnvm_a.dir/build

CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_spec.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_be.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_be_ioctl.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_be_sysfs.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_be_lba.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_dev.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_buf.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_bbt.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_geo.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_ver.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_cmd.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_addr.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_vblk.c.o.requires
CMakeFiles/lightnvm_a.dir/requires: CMakeFiles/lightnvm_a.dir/src/nvm_bounds.c.o.requires

.PHONY : CMakeFiles/lightnvm_a.dir/requires

CMakeFiles/lightnvm_a.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lightnvm_a.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lightnvm_a.dir/clean

CMakeFiles/lightnvm_a.dir/depend:
	cd /home/hkim/liblightnvm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hkim/liblightnvm /home/hkim/liblightnvm /home/hkim/liblightnvm/build /home/hkim/liblightnvm/build /home/hkim/liblightnvm/build/CMakeFiles/lightnvm_a.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lightnvm_a.dir/depend
