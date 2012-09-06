# Install script for directory: /build/buildd/mysql-5.5-5.5.24/include

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mysql" TYPE FILE FILES
    "/build/buildd/mysql-5.5-5.5.24/include/mysql.h"
    "/build/buildd/mysql-5.5-5.5.24/include/mysql_com.h"
    "/build/buildd/mysql-5.5-5.5.24/include/mysql_time.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_list.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_alloc.h"
    "/build/buildd/mysql-5.5-5.5.24/include/typelib.h"
    "/build/buildd/mysql-5.5-5.5.24/include/mysql/plugin.h"
    "/build/buildd/mysql-5.5-5.5.24/include/mysql/plugin_audit.h"
    "/build/buildd/mysql-5.5-5.5.24/include/mysql/plugin_ftparser.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_dbug.h"
    "/build/buildd/mysql-5.5-5.5.24/include/m_string.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_sys.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_xml.h"
    "/build/buildd/mysql-5.5-5.5.24/include/mysql_embed.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_pthread.h"
    "/build/buildd/mysql-5.5-5.5.24/include/decimal.h"
    "/build/buildd/mysql-5.5-5.5.24/include/errmsg.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_global.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_net.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_getopt.h"
    "/build/buildd/mysql-5.5-5.5.24/include/sslopt-longopts.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_dir.h"
    "/build/buildd/mysql-5.5-5.5.24/include/sslopt-vars.h"
    "/build/buildd/mysql-5.5-5.5.24/include/sslopt-case.h"
    "/build/buildd/mysql-5.5-5.5.24/include/sql_common.h"
    "/build/buildd/mysql-5.5-5.5.24/include/keycache.h"
    "/build/buildd/mysql-5.5-5.5.24/include/m_ctype.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_attribute.h"
    "/build/buildd/mysql-5.5-5.5.24/include/my_compiler.h"
    "/build/buildd/mysql-5.5-5.5.24/builddir/include/mysql_version.h"
    "/build/buildd/mysql-5.5-5.5.24/builddir/include/my_config.h"
    "/build/buildd/mysql-5.5-5.5.24/builddir/include/mysqld_ername.h"
    "/build/buildd/mysql-5.5-5.5.24/builddir/include/mysqld_error.h"
    "/build/buildd/mysql-5.5-5.5.24/builddir/include/sql_state.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mysql/mysql" TYPE DIRECTORY FILES "/build/buildd/mysql-5.5-5.5.24/include/mysql/" FILES_MATCHING REGEX "/[^/]*\\.h$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Development")

