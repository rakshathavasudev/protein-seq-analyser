# Install script for directory: /home/psa/VGST_Scripts/HHBlits/hhsuite/scripts

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/scripts" TYPE PROGRAM PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/Align.pm"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/HHPaths.pm"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/scripts" TYPE PROGRAM FILES
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/addss.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/create_profile_from_hhm.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/hhmakemodel.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/hhsuitedb.py"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/mergeali.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/multithread.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/pdbfilter.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/renumberpdb.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/create_profile_from_hmmer.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/pdb2fasta.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/reformat.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/splitfasta.pl"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/check_a3m.py"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/ffindex.py"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/a3m.py"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/get_a3m_size.py"
    "/home/psa/VGST_Scripts/HHBlits/hhsuite/scripts/is_huge_a3m.py"
    )
endif()

