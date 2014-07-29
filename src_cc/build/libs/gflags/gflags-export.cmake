# Generated by CMake 2.8.9

IF("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   MESSAGE(FATAL_ERROR "CMake >= 2.6.0 required")
ENDIF("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
CMAKE_POLICY(PUSH)
CMAKE_POLICY(VERSION 2.6)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
SET(CMAKE_IMPORT_FILE_VERSION 1)

# Create imported target gflags-static
ADD_LIBRARY(gflags-static STATIC IMPORTED)

# Create imported target gflags_nothreads-static
ADD_LIBRARY(gflags_nothreads-static STATIC IMPORTED)

# Import target "gflags-static" for configuration "Release"
SET_PROPERTY(TARGET gflags-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
SET_TARGET_PROPERTIES(gflags-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "-pthread"
  IMPORTED_LOCATION_RELEASE "/home/tvykruta/src/build/libs/gflags/lib/libgflags.a"
  )

# Import target "gflags_nothreads-static" for configuration "Release"
SET_PROPERTY(TARGET gflags_nothreads-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
SET_TARGET_PROPERTIES(gflags_nothreads-static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "/home/tvykruta/src/build/libs/gflags/lib/libgflags_nothreads.a"
  )

# Commands beyond this point should not need to know the version.
SET(CMAKE_IMPORT_FILE_VERSION)
CMAKE_POLICY(POP)
