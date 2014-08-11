cmake_minimum_required (VERSION 2.8)
project (gflags_demo)

find_package (gflags REQUIRED)
include_directories (${gflags_INCLUDE_DIR})

add_executable (gflags_demo main.cc)

#target_link_libraries (gflags_demo gflags -L~/src_cc/libs/gflags/build/lib/)
target_link_libraries(gflags_demo ~/gce_test/src/cc/test_projects/libs/gflags/build/lib/libgflags.a -pthread)
