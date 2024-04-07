# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-src"
  "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-build"
  "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix"
  "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/tmp"
  "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp"
  "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src"
  "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/sergeybudygin/furie_cpp/build/_deps/fft_lib-subbuild/fft_lib-populate-prefix/src/fft_lib-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
