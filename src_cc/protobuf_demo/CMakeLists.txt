cmake_minimum_required (VERSION 2.8)
project (protobuf_demo)

add_executable (protobuf_demo main.cc generated/client.pb.cc)

#target_link_libraries(protobuf_demo ~/src/libs/gflags/build/lib/libgflags.a -pthread)
