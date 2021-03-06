cmake_minimum_required (VERSION 2.8)
project (Blast)

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
set (LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR})

file (GLOB HEADERS "include/*.h")
file (GLOB RANDOMHEADERS "src/*.h")
file (GLOB SOURCES "src/*.cpp")


# Directories
include_directories (
  ${PROJECT_SOURCE_DIR}/include
  ${SDL_FOLDER}/include
  ${GLEW_INCLUDE_PATH}
)

# Add the target
add_library (blast STATIC #SHARED
  ${SOURCES}
  ${RANDOMHEADERS}
  ${HEADERS}
)
add_executable (demo demo.cpp)

target_link_libraries (
  blast
  ${OPENGL_LIBRARIES}
  ${GLEW_LIBRARY}
  ${SDL_LIBRARY}
  ${SDLMAIN_LIBRARY}
  ${EXTRA_LIBS}
)
target_link_libraries (
  demo
  ${OPENGL_LIBRARIES}
  ${GLEW_LIBRARY}
  ${SDL_LIBRARY}
  ${SDLMAIN_LIBRARY}
  ${EXTRA_LIBS}
)
