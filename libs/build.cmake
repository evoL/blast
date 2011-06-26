if (WIN32)
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
elseif (UNIX)
  execute_process (
    COMMAND make
    WORKING_DIRECTORY "sdl-1.3"
    OUTPUT_VARIABLE _make
  )
  execute_process (
    COMMAND make install
    WORKING_DIRECTORY "sdl-1.3"
    OUTPUT_VARIABLE _install
  )
  file (
    WRITE build.log
    ${_make}
    ${_install}
  )
endif()