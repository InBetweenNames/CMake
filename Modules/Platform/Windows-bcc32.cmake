SET(CMAKE_LIBRARY_PATH_FLAG "-L")
SET(CMAKE_LINK_LIBRARY_FLAG "")

# create a shared C++ library
SET(CMAKE_CXX_CREATE_SHARED_LIBRARY 
 "<CMAKE_CXX_COMPILER>  @&&|\n-e<TARGET>  -tWD <OBJECTS> <LINK_LIBRARIES>\n|"
 "implib @&&|\n-w <TARGET_BASE>.lib <TARGET_BASE>.dll\n|"
)

SET(CMAKE_CXX_CREATE_SHARED_MODULE ${CMAKE_CXX_CREATE_SHARED_LIBRARY})

# create a C shared library
SET(CMAKE_C_CREATE_SHARED_LIBRARY 
 "<CMAKE_CXX_COMPILER> @&&|\n-e<TARGET> -tWD  <OBJECTS> <LINK_LIBRARIES>\n|"
 "implib @&&|\n-w <TARGET_BASE>.lib <TARGET_BASE>.dll\n|"
)

# create a C shared module just copy the shared library rule
SET(CMAKE_C_CREATE_SHARED_MODULE ${CMAKE_C_CREATE_SHARED_LIBRARY})


# create a C++ static library
SET(CMAKE_CXX_CREATE_STATIC_LIBRARY  "tlib @&&|\n/p512  /a <TARGET> <OBJECTS_QUOTED>\n|")

# create a C static library
SET(CMAKE_C_CREATE_STATIC_LIBRARY ${CMAKE_CXX_CREATE_STATIC_LIBRARY})

# compile a C++ file into an object file
SET(CMAKE_CXX_COMPILE_OBJECT
    "<CMAKE_CXX_COMPILER>  @&&|\n-DWIN32 -o<OBJECT> <FLAGS> -c <SOURCE>\n|")

# compile a C file into an object file
SET(CMAKE_C_COMPILE_OBJECT
    "<CMAKE_C_COMPILER> @&&|\n-DWIN32 -o<OBJECT>  <FLAGS> -c <SOURCE>\n|")


SET(CMAKE_C_LINK_EXECUTABLE
    "<CMAKE_C_COMPILER> @&&|\n-e<TARGET> <FLAGS> <CMAKE_C_LINK_FLAGS> <LINK_LIBRARIES> <OBJECTS> \n|")


SET(CMAKE_CXX_LINK_EXECUTABLE
    "<CMAKE_CXX_COMPILER> @&&|\n -e<TARGET> <FLAGS> <CMAKE_CXX_LINK_FLAGS> <LINK_LIBRARIES> <OBJECTS> \n|")

SET (CMAKE_BUILD_TYPE Debug CACHE STRING 
     "Choose the type of build, options are: Debug Release RelWithDebInfo MinSizeRel.")

# extra flags for a win32 exe
SET(CMAKE_CREATE_WIN32_EXE -tW -tWM )
# extra flags for a console app
SET(CMAKE_CREATE_CONSOLE_EXE -tWC )

SET (CMAKE_CXX_FLAGS_INIT "-w- -whid -waus -wpar -tWM -P")
SET (CMAKE_CXX_FLAGS_DEBUG_INIT "-Od -v")
SET (CMAKE_CXX_FLAGS_MINSIZEREL_INIT "-O1")
SET (CMAKE_CXX_FLAGS_RELEASE_INIT "-O2")
SET (CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-Od")
SET (CMAKE_C_FLAGS_INIT "-w- -whid -waus -tWM")


SET (CMAKE_STANDARD_LIBRARIES "import32.lib" CACHE STRING 
     "Libraries linked by defalut with all applications.")

FIND_PROGRAM(CMAKE_MAKE_PROGRAM NAMES make )
SET(CMAKE_BUILD_TOOL ${CMAKE_MAKE_PROGRAM} CACHE INTERNAL 
     "What is the target build tool cmake is generating for.")
MARK_AS_ADVANCED(CMAKE_STANDARD_LIBRARIES CMAKE_MAKE_PROGRAM)

