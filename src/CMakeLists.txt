set(FURIE_HEADER "${project_SOURCE_DIR}/include/fft/furie.h")


add_library(fft fft/furie.cpp ${FURIE_HEADER})

# target_include_directories(fft PUBLIC ../lib-src/libsndfile/include)
# # https://github.com/LibraryOfCongress/ADCTest/blob/master/lib-src/libsndfile/include/sndfile.h
# # https://github.com/fmtlib/fmt/blob/master/include/fmt/format.h
 
# include(FetchContent)
# FetchContent_Declare(fft GIT_REPOSITORY https://github.com/LibraryOfCongress/ADCTest.git)
# FetchContent_MakeAvailable(fft)
# target_link_libraries(fft PUBLIC fft::sndfile)
