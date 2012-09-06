# Install script for directory: /home/sravang/Projects_New/mysql-5.5_New/include

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/sravang/Projects_New/mysql-5.5_New/include/mysql.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/mysql_com.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/mysql_time.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_list.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_alloc.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/typelib.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/mysql/plugin.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/mysql/plugin_audit.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/mysql/plugin_ftparser.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_dbug.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/m_string.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_sys.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_xml.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/mysql_embed.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_pthread.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/decimal.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/errmsg.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_global.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_net.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_getopt.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/sslopt-longopts.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_dir.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/sslopt-vars.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/sslopt-case.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/sql_common.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/keycache.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/m_ctype.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_attribute.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_compiler.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/mysql_version.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/my_config.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/mysqld_ername.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/mysqld_error.h"
    "/home/sravang/Projects_New/mysql-5.5_New/include/sql_state.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mysql" TYPE DIRECTORY FILES "/home/sravang/Projects_New/mysql-5.5_New/include/mysql/" FILES_MATCHING REGEX "/[^/]*\\.h$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

