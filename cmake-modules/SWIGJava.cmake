#
# Copyright (c) 2014-2015 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

########################################################################
# This file creates the macro SWIG_BUILD_JAVA_MODULE. It builds a
# Java SWIG module and installs it in the desired location without the
#
# Macro parameters:
#  * module_name:  The module filename, minus the .i extension.
#  * package_name: The name of this module's Java package.
#  * cplusplus:    TRUE or FALSE, whether or not this is a C++ module.
#
# Assumes the following variables are set:
#  * SWIG_MODULE_DIR:          The source directory that contains the .i
#                              file. This is needed so the .i file can
#                              include other local .i files.
#
#  * SWIG_JAVA_INCLUDE_DIRS: C/C++ include directories needed by the
#                            source files.
#
#  * SWIG_JAVA_LIBRARIES:    C/C++ libraries the Java module should
#                            link against.
#
# Example (mymodule.i):
#  * SWIG_BUILD_JAVA_MODULE(mymodule nc.MyModule TRUE)
#
#  * From Java:
#        import nc.MyModule.*;
#
########################################################################

MACRO(SWIG_BUILD_JAVA_MODULE module_name package_name cplusplus)
    INCLUDE(${SWIG_USE_FILE})

    SET(SWIG_INCLUDE_DIRS
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_BINARY_DIR}
        ${SWIG_MODULE_DIR}
        ${SWIG_JAVA_INCLUDE_DIRS}
        ${JAVA_INCLUDE_PATH}
        ${JNI_INCLUDE_DIRS}
    )
    INCLUDE_DIRECTORIES(${SWIG_INCLUDE_DIRS})

    SET(SWIG_LIBRARIES
        ${SWIG_JAVA_LIBRARIES}
        ${JAVA_AWT_LIBRARY}
        ${JAVA_JVM_LIBRARY}
    )

    # Set flags to pass into SWIG call
    SET(CMAKE_SWIG_FLAGS -module ${module_name} -package ${package_name})
    FOREACH(dir ${SWIG_INCLUDE_DIRS})
        LIST(APPEND CMAKE_SWIG_FLAGS "-I${dir}")
    ENDFOREACH(dir ${SWIG_INCLUDE_DIRS})

    # Allows CMake variables to be placed in SWIG .i files
    CONFIGURE_FILE(
        ${CMAKE_CURRENT_SOURCE_DIR}/${module_name}.i
        ${CMAKE_CURRENT_BINARY_DIR}/${module_name}.i
    @ONLY)

    # Set SWIG's C++ flag if specified by the user
    IF(cplusplus)
        SET_SOURCE_FILES_PROPERTIES(${CMAKE_CURRENT_BINARY_DIR}/${module_name}.i PROPERTIES CPLUSPLUS ON)
    ENDIF(cplusplus)

    # The actual CMake call for SWIG
    SWIG_ADD_MODULE(${module_name} java ${CMAKE_CURRENT_BINARY_DIR}/${module_name}.i)
    SWIG_LINK_LIBRARIES(${module_name} ${SWIG_LIBRARIES})

    # Install files
    IF(WIN32)
        INSTALL(
            TARGETS ${SWIG_MODULE_${swig_source}_REAL_NAME}
            DESTINATION ${RUNTIME_DIR}
            COMPONENT Java
        )
    ELSE()
        INSTALL(
            TARGETS ${SWIG_MODULE_${swig_source}_REAL_NAME}
            DESTINATION ${LIBRARY_DIR}
            COMPONENT Java
        )
    ENDIF(WIN32)

ENDMACRO(SWIG_BUILD_JAVA_MODULE)
