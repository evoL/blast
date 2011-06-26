# SDL
if (UNIX)
  message (STATUS "* Configuring SDL 1.3...")
  
  execute_process (
    COMMAND "configure" "--prefix=${CMAKE_CURRENT_SOURCE_DIR}/sdl-1.3/local"
    WORKING_DIRECTORY "sdl-1.3"
    OUTPUT_QUIET
  )
endif()

add_custom_command (
  OUTPUT build.log
  COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/build.cmake
)

set (
  SDL_FOLDER ${CMAKE_CURRENT_SOURCE_DIR}/sdl-1.3
  CACHE STRING "Path to SDL 1.3"
)

find_library (SDL_LIBRARY
  NAMES SDL-1.3.0 SDL
  PATHS ${SDL_FOLDER}
  PATH_SUFFIXES local/lib VisualC/SDL/Release
  NO_DEFAULT_PATH
)
find_library (SDLMAIN_LIBRARY
  NAMES SDLmain
  PATHS ${SDL_FOLDER}
  PATH_SUFFIXES local/lib VisualC/SDL/Release
  NO_DEFAULT_PATH
)