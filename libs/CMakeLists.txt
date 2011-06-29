# SDL
set (
  SDL_FOLDER ${CMAKE_CURRENT_SOURCE_DIR}/sdl-1.3
  CACHE STRING "Path to SDL 1.3"
)

find_library (SDL_LIBRARY
  NAMES SDL-1.3.0 SDL
  PATHS ${SDL_FOLDER}
  PATH_SUFFIXES win32 darwin
  NO_DEFAULT_PATH
)
find_library (SDLMAIN_LIBRARY
  NAMES SDLmain
  PATHS ${SDL_FOLDER}
  PATH_SUFFIXES win32 darwin
  NO_DEFAULT_PATH
)

# GLEW
set (
  GLEW_INCLUDE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/glew/include
  CACHE STRING "Path to GLEW"
)
	
if (WIN32)
	find_library (GLEW_LIBRARY
    NAMES glew32 glew32s
    PATHS ${CMAKE_CURRENT_SOURCE_DIR}/glew/win32
  )
else()
  find_library (GLEW_LIBRARY
    NAMES GLEW glew
    PATHS
      /usr/lib64
      /usr/lib
      /usr/local/lib64
      /usr/local/lib
      /sw/lib
      /opt/local/lib
  )
endif()