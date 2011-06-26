file (GLOB SOURCES "*.cpp")
file (GLOB HEADERS "*.h")

# Directories
include_directories (
  .
  ${SDL_FOLDER}/include
)

# Add the target
add_library (blast SHARED
  ${SOURCES}
  ${HEADERS}
)
target_link_libraries (
  blast
  ${OPENGL_LIBRARIES}
  ${SDL_LIBRARY}
  ${SDLMAIN_LIBRARY}
  ${EXTRA_LIBS}
)