# SDL
message (STATUS "Building SDL 1.3...")

if (WIN32)
  if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/sdl-1.3/VisualC/SDL/Release/SDL.dll)  
    if (MSVC_VERSION EQUAL 1400)
      execute_process (
        COMMAND "${VS_PATH}/msbuild" SDL_VS2005.sln "/p:Configuration=Release"
        WORKING_DIRECTORY "sdl-1.3/VisualC"
        OUTPUT_FILE "build.log"
      )
    elseif (MSVC_VERSION EQUAL 1500)
      execute_process (
        COMMAND "${VS_PATH}/msbuild" SDL_VS2008.sln "/p:Configuration=Release"
        WORKING_DIRECTORY "sdl-1.3/VisualC"
        OUTPUT_FILE "build.log"
      )
    elseif (MSVC_VERSION EQUAL 1600)
      execute_process (
        COMMAND "${VS_PATH}/msbuild" SDL_VS2010.sln "/p:Configuration=Release"
        WORKING_DIRECTORY "sdl-1.3/VisualC"
        OUTPUT_FILE "build.log"
      )
    else()
      message (FATAL_ERROR "SDL has project files for VS 2005, 2008 and 2010 only.")
    endif()
  endif()
elseif (UNIX)
  if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/sdl-1.3/local/lib)
    execute_process (
      COMMAND "${CMAKE_CURRENT_SOURCE_DIR}/sdl-1.3/configure" "--prefix=${CMAKE_CURRENT_SOURCE_DIR}/sdl-1.3/local"
      WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/sdl-1.3"
      OUTPUT_VARIABLE _configure
    )
    execute_process (
      COMMAND make
      WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/sdl-1.3"
      OUTPUT_VARIABLE _make
    )
    execute_process (
      COMMAND make install
      WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/sdl-1.3"
      OUTPUT_VARIABLE _install
    )
  
    file (
      WRITE build.log
      ${_configure}
      ${_make}
      ${_install}
    )
  endif()
endif()

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