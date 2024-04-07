#set(FURIE_HEADER "${project_SOURCE_DIR}/include/fft/furie.h")
## set(FURIE_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/include/fft/furie.h")
#
#
#add_library(fft fft/furie.cpp ${FURIE_HEADER})
#
##target_include_directories(fft PUBLIC ../include)
#target_include_directories(fft PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
#
## target_include_directories(fft PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
#
#
#include(FetchContent)
#FetchContent_Declare(fft_lib GIT_REPOSITORY https://github.com/LibraryOfCongress/ADCTest.git)
#FetchContent_MakeAvailable(fft_lib)
#
##target_link_libraries(fft PUBLIC sndfile)
#target_link_libraries(fft PUBLIC fft_lib) #связываем investing и fmt
#cmake_minimum_required(VERSION 3.10)
#project(fft)
#
#set(CMAKE_CXX_STANDARD 11)
#
## Путь к заголовочному файлу furie.h
#set(FURIE_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/../include/fft/furie.h")
#
## Добавляем библиотеку fft
#add_library(fft fft/furie.cpp ${FURIE_HEADER})
#
## Указываем публичный путь включения для вашей библиотеки
#target_include_directories(fft PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
#
## Включаем библиотеку fft из репозитория ADCTest
#include(FetchContent)
#FetchContent_Declare(fft_lib GIT_REPOSITORY https://github.com/libsndfile/libsndfile.git)
#FetchContent_MakeAvailable(fft_lib)
#
## Связываем вашу библиотеку с библиотекой fft_lib
#target_link_libraries(fft PUBLIC fft_lib)
#



set(FURIE_HEADER "${project_SOURCE_DIR}/include/fft/furie.h")

# Добавляем библиотеку fft
add_library(fft fft/furie.cpp ${FURIE_HEADER})

# Указываем публичный путь включения для вашей библиотеки
target_include_directories(fft PUBLIC ../include)

# Включаем библиотеку libsndfile из GitHub
include(FetchContent)
FetchContent_Declare(
        libsndfile
        GIT_REPOSITORY https://github.com/libsndfile/libsndfile.git
        GIT_TAG master # или конкретный тег или ветка, если требуется
)
FetchContent_MakeAvailable(libsndfile)

# Связываем вашу библиотеку с библиотекой libsndfile
target_link_libraries(fft PUBLIC sndfile)

# target_include_directories(fft PUBLIC ../lib-src/libsndfile/include)
# # https://github.com/LibraryOfCongress/ADCTest/blob/master/lib-src/libsndfile/include/sndfile.h
# # https://github.com/fmtlib/fmt/blob/master/include/fmt/format.h
 
# include(FetchContent)
# FetchContent_Declare(fft GIT_REPOSITORY https://github.com/LibraryOfCongress/ADCTest.git)
# FetchContent_MakeAvailable(fft)
# target_link_libraries(fft PUBLIC fft::sndfile)
