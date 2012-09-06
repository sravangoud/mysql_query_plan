# Install script for directory: /home/sravang/Projects_New/mysql-5.5_New

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local/mysql")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Debug")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Info")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE FILE OPTIONAL FILES "/home/sravang/Projects_New/mysql-5.5_New/Docs/mysql.info")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Info")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE OPTIONAL FILES
    "/home/sravang/Projects_New/mysql-5.5_New/COPYING"
    "/home/sravang/Projects_New/mysql-5.5_New/LICENSE.mysql"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES "/home/sravang/Projects_New/mysql-5.5_New/README")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE FILE FILES
    "/home/sravang/Projects_New/mysql-5.5_New/Docs/INFO_SRC"
    "/home/sravang/Projects_New/mysql-5.5_New/Docs/INFO_BIN"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES "/home/sravang/Projects_New/mysql-5.5_New/Docs/INSTALL-BINARY")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Documentation")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE DIRECTORY FILES "/home/sravang/Projects_New/mysql-5.5_New/Docs/" REGEX "/INSTALL\\-BINARY$" EXCLUDE REGEX "/Makefile\\.[^/]*$" EXCLUDE REGEX "/glibc[^/]*$" EXCLUDE REGEX "/linuxthreads\\.txt$" EXCLUDE REGEX "/myisam\\.txt$" EXCLUDE REGEX "/mysql\\.info$" EXCLUDE REGEX "/sp\\-imp\\-spec\\.txt$" EXCLUDE)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Documentation")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/cmd-line-utils/libedit/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/myisammrg/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/innobase/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/example/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/archive/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/myisam/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/foo/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/heap/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/blackhole/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/perfschema/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/csv/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/storage/federated/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/plugin/auth/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/plugin/audit_null/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/plugin/fulltext/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/plugin/semisync/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/plugin/daemon_example/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/include/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/dbug/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/strings/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/vio/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/regex/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/mysys/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/libmysql/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/unittest/mytap/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/unittest/mysys/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/extra/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/tests/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/client/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/sql/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/sql/share/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/libservices/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/mysql-test/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/mysql-test/lib/My/SafeProcess/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/support-files/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/scripts/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/sql-bench/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/man/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql-5.5_New/packaging/WiX/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/sravang/Projects_New/mysql-5.5_New/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/sravang/Projects_New/mysql-5.5_New/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
