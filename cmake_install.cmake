# Install script for directory: /home/sravang/Projects_New/mysql_rep/mysql_query_plan

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE FILE OPTIONAL FILES "/home/sravang/Projects_New/mysql_rep/mysql_query_plan/Docs/mysql.info")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Info")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE OPTIONAL FILES
    "/home/sravang/Projects_New/mysql_rep/mysql_query_plan/COPYING"
    "/home/sravang/Projects_New/mysql_rep/mysql_query_plan/LICENSE.mysql"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES "/home/sravang/Projects_New/mysql_rep/mysql_query_plan/README")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE FILE FILES
    "/home/sravang/Projects_New/mysql_rep/mysql_query_plan/Docs/INFO_SRC"
    "/home/sravang/Projects_New/mysql_rep/mysql_query_plan/Docs/INFO_BIN"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE FILE FILES "/home/sravang/Projects_New/mysql_rep/mysql_query_plan/Docs/INSTALL-BINARY")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Readme")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Documentation")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/docs" TYPE DIRECTORY FILES "/home/sravang/Projects_New/mysql_rep/mysql_query_plan/Docs/" REGEX "/INSTALL\\-BINARY$" EXCLUDE REGEX "/Makefile\\.[^/]*$" EXCLUDE REGEX "/glibc[^/]*$" EXCLUDE REGEX "/linuxthreads\\.txt$" EXCLUDE REGEX "/myisam\\.txt$" EXCLUDE REGEX "/mysql\\.info$" EXCLUDE REGEX "/sp\\-imp\\-spec\\.txt$" EXCLUDE)
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Documentation")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/cmd-line-utils/libedit/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/myisammrg/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/innobase/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/example/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/archive/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/myisam/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/foo/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/heap/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/blackhole/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/perfschema/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/csv/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/storage/federated/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/plugin/auth/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/plugin/audit_null/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/plugin/fulltext/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/plugin/semisync/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/plugin/daemon_example/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/include/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/dbug/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/strings/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/vio/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/regex/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysys/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/libmysql/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mytap/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/unittest/mysys/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/extra/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/tests/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/client/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/sql/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/sql/share/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/libservices/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/mysql-test/lib/My/SafeProcess/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/support-files/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/scripts/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/sql-bench/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/man/cmake_install.cmake")
  INCLUDE("/home/sravang/Projects_New/mysql_rep/mysql_query_plan/packaging/WiX/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home/sravang/Projects_New/mysql_rep/mysql_query_plan/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home/sravang/Projects_New/mysql_rep/mysql_query_plan/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
