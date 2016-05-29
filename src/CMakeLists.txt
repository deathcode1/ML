cmake_minimum_required(2.6)

project(Machine_Learning)

add_subdirectory(ASM)
add_subdirectory(C)
add_subdirectory(Cpp)
add_subdirectory(Fortran)
add_subdirectory(OpenCL)

enable_language(Fortran)

set(VERSION predev0.0.1)
if (Fortran_COMPILER_NAME MATCHEs "gfortran.*")

    set(CMAKE_Fortran_FLAGS_RELEASE "")
    set(CMAKE_Fortran_FLAGS_DEBUG "")
elseif (Fortran_COMPILER_NAME MATCHES "ifort.*")
    set(CMAKE_Fortran_FLAGS_RELEASE "")
    set(CMAKE_Fortran_FLAGS_DEBUG "")
elseif (Fortran_COMPILER_NAME MATCHES "g77")
  set (CMAKE_Fortran_FLAGS_RELEASE "2")
  set (CMAKE_Fortran_FLAGS_DEBUG   "")
else (Fortran_COMPILER_NAME MATCHES "gfortran.*")
  message ("CMAKE_Fortran_COMPILER full path: " ${CMAKE_Fortran_COMPILER})
  message ("Fortran compiler: " ${Fortran_COMPILER_NAME})
  message ("No optimized Fortran compiler flags are known")
  set (CMAKE_Fortran_FLAGS_RELEASE "-O2")
  set (CMAKE_Fortran_FLAGS_DEBUG   "-O0 -g")
endif (Fortran_COMPILER_NAME MATCHES "gfortran.*")
    
    