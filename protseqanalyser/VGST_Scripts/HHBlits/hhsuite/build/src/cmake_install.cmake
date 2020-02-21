# Install script for directory: /home/psa/VGST_Scripts/HHBlits/hhsuite/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/psa/VGST_Scripts/HHBlits/hhsuite")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "RelWithDebInfo")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/hhblits_omp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/hhblits"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/hhmake"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/hhfilter"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/hhsearch"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/hhalign"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/hhconsensus"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/a3m_extract"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/a3m_database_reduce"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/a3m_database_extract"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/a3m_database_filter"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/cstranslate"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/hhblits_omp")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/psa/VGST_Scripts/HHBlits/hhsuite/build/src/cs/cmake_install.cmake")

endif()

