#
# Copyright (c) 2014-2015 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

########################################################################
# This file creates the following macros (example usage at end):
#
# SWIG_BUILD_JAVA_MODULE: Build a Java SWIG module and install it in
#                         the desired location.
#
# Parameters:
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
# JAVA_BUILD_JAR: Build a Java JAR file. Meant to be used after the
#                 previous macro.
#
# Parameters:
#  * jar_name: the name of the JAR to be produced
#  * swig_modules: SWIG modules made with SWIG_BUILD_JAVA_MODULE
#  * package_name: same name passed into SWIG_BUILD_JAVA_MODULE
#  * manifest_txt (optional): path to Manifest.txt
#
# Example (mymodule1.i, mymodule2.i):
#  * In CMake:
#        SWIG_BUILD_JAVA_MODULE(mymodule1 nc.MyModule TRUE)
#        SWIG_BUILD_JAVA_MODULE(mymodule2 nc.MyModule TRUE)
#        JAVA_BUILD_JAR(MyModule.jar "mymodule1;mymodule2" nc.MyModule TRUE)
#
#  * From Java:
#        import nc.MyModule.*;
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

MACRO(JAVA_BUILD_JAR jar_name swig_modules package_name manifest_txt)
    # Derive depending files from SWIG module names
    FOREACH(module ${swig_modules})
        LIST(APPEND java_depends "${CMAKE_CURRENT_BINARY_DIR}/${module}JNI.java")
        LIST(APPEND swig_depends "${SWIG_MODULE_${module}_REAL_NAME}")
    ENDFOREACH(module ${swig_modules})

    # Get info from variables
    GET_FILENAME_COMPONENT(package_dir ${package_name} NAME_WE) # Not a filename, but it works
    STRING(REPLACE "." "_" jar_target ${jar_name})

    # Build JAR
    ADD_CUSTOM_COMMAND(
        OUTPUT ${CMAKE_CURRENT_BINARY_JAR}/${jar_name}
        COMMENT "Creating ${jar_name}"
        COMMAND ${Java_JAVAC_EXECUTABLE} -Xlint:unchecked -d ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_BINARY_DIR}/*.java
        COMMAND ${Java_JAR_EXECUTABLE} cfm ${CMAKE_CURRENT_BINARY_DIR}/${jar_name} ${manifest_txt} -C ${CMAKE_CURRENT_BINARY_DIR} ${package_dir}
        DEPENDS ${java_depends}
        DEPENDS ${swig_depends}
    )
    ADD_CUSTOM_TARGET(
        ${jar_target} ALL
        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${jar_name}
    )

    # Install file
    INSTALL(
        FILES ${CMAKE_CURRENT_BINARY_DIR}/${jar_name}
        DESTINATION share/java
        COMPONENT Java
    )
ENDMACRO(JAVA_BUILD_JAR)
