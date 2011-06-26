cmake_minimum_required (VERSION 2.8)
project (Blast)

# Put the path to Visual Studio here!
set (VS_PATH '')
# OK, please don't mess with the rest (unless you know what you're doing)

# Setup the libraries
add_subdirectory (libs)

# OpenGL
find_package (OpenGL REQUIRED)

# Boost
find_package (Boost 1.44 REQUIRED)

# Extra fixes
set (EXTRA_LIBS "")
if (APPLE)
  set (EXTRA_LIBS ${EXTRA_LIBS} "-framework Cocoa")
endif()

# Setup the source
add_subdirectory (src)
