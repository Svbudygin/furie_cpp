add_executable(project main.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../include)

target_link_libraries(project PUBLIC fft)