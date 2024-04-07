# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "D:/studying/prog/furie_cpp/furie_cpp/cmake-build-debug/_deps/libsndfile-src"
  "D:/studying/prog/furie_cpp/furie_cpp/cmake-build-debug/_deps/libsndfile-build"
  "D:/studying/prog/furie_cpp/furie_cpp/cmake-build-debug/_deps/libsndfile-subbuild/libsndfile-populate-prefix"
  "D:/studying/prog/furie_cpp/furie_cpp/cmake-build-debug/_deps/libsndfile-subbuild/libsndfile-populate-prefix/tmp"
  "D:/studying/prog/furie_cpp/furie_cpp/cmake-build-debug/_deps/libsndfile-subbuild/libsndfile-populate-prefix/src/libsndfile-populate-stamp"
  "D:/studying/prog/furie_cpp/furie_cpp/cmake-build-debug/_deps/libsndfile-subbuild/libsndfile-populate-prefix/src"
  "D:/studying/prog/furie_cpp/furie_cpp/cmake-build-debug/_deps/libsndfile-subbuild/libsndfile-populate-prefix/src/libsndfile-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/studying/prog/furie_cpp/furie_cpp/cmake-build-debug/_deps/libsndfile-subbuild/libsndfile-populate-prefix/src/libsndfile-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/studying/prog/furie_cpp/furie_cpp/cmake-build-debug/_deps/libsndfile-subbuild/libsndfile-populate-prefix/src/libsndfile-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
