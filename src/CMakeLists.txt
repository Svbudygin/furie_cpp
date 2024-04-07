cmake_minimum_required(VERSION 3.0)
project(MyProject)

# Указываем исходные файлы
set(FURIE_HEADER "${project_SOURCE_DIR}/include/fft/furie.h")

# Добавляем библиотеку fft
add_library(fft fft/furie.cpp ${FURIE_HEADER})
target_include_directories(fft PUBLIC ../include)

# Указываем путь к заголовочным файлам
include_directories(../include)

# Создаем директорию сборки для подключения внешней библиотеки
set(AUDIOFILE_BINARY_DIR "${CMAKE_BINARY_DIR}/libs/AudioFile")
file(MAKE_DIRECTORY ${AUDIOFILE_BINARY_DIR})

# Добавляем библиотеку AudioFile извне
add_subdirectory(../libs/AudioFile ${AUDIOFILE_BINARY_DIR})

# Линкуем библиотеку AudioFile с нашим проектом
target_link_libraries(fft PRIVATE AudioFile)
