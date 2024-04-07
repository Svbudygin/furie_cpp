set(FURIE_HEADER "${project_SOURCE_DIR}/include/fft/furie.h")
# set(FURIE_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/include/fft/furie.h")


add_library(fft fft/furie.cpp ${FURIE_HEADER})

target_include_directories(fft PUBLIC ../include) 
# target_include_directories(fft PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

 
include(FetchContent)
FetchContent_Declare(fft_lib GIT_REPOSITORY https://github.com/LibraryOfCongress/ADCTest.git)
FetchContent_MakeAvailable(fft_lib)
target_link_libraries(fft PUBLIC sndfile)
