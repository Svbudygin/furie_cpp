# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

if(EXISTS "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp/fft_lib-populate-gitclone-lastrun.txt" AND EXISTS "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp/fft_lib-populate-gitinfo.txt" AND
  "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp/fft_lib-populate-gitclone-lastrun.txt" IS_NEWER_THAN "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp/fft_lib-populate-gitinfo.txt")
  message(STATUS
    "Avoiding repeated git clone, stamp file is up to date: "
    "'/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp/fft_lib-populate-gitclone-lastrun.txt'"
  )
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"
            clone --no-checkout --config "advice.detachedHead=false" "https://github.com/LibraryOfCongress/ADCTest" "fft_lib-src"
    WORKING_DIRECTORY "/Users/sergeybudygin/furie_cpp/build/_deps"
    RESULT_VARIABLE error_code
  )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once: ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/LibraryOfCongress/ADCTest'")
endif()

execute_process(
  COMMAND "/usr/bin/git"
          checkout "master" --
  WORKING_DIRECTORY "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'master'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git" 
            submodule update --recursive --init 
    WORKING_DIRECTORY "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-src"
    RESULT_VARIABLE error_code
  )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp/fft_lib-populate-gitinfo.txt" "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp/fft_lib-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp/fft_lib-populate-gitclone-lastrun.txt'")
endif()
