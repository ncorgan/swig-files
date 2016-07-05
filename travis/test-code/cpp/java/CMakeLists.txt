#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

INCLUDE(SWIGJava)

IF(SWIG_WRAP_BOOST_EXCEPTIONS)
    SET(SWIG_JAVA_FLAGS "-DSWIG_WRAP_BOOST_EXCEPTIONS")
ENDIF(SWIG_WRAP_BOOST_EXCEPTIONS)

SET(SWIG_MODULE_DIR
    ${CMAKE_CURRENT_SOURCE_DIR}
)
SET(SWIG_JAVA_INCLUDE_DIRS
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_SOURCE_DIR}/../../swig-modules
)
SET(SWIG_JAVA_LIBRARIES
    swigtest-cpp
)

# Generate C# docstrings
SET(SWIG_LANGUAGE "java")
CONFIGURE_FILE(
    ${CMAKE_CURRENT_SOURCE_DIR}/../generate_swig_docstrings.py.in
    ${CMAKE_CURRENT_BINARY_DIR}/generate_java_docstrings.py
@ONLY)
FILE(GLOB_RECURSE header_files ${CMAKE_SOURCE_DIR} "*.h*")
ADD_CUSTOM_COMMAND(
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/../generate_swig_docstrings.py.in
    DEPENDS ${header_files}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/../../python-scripts
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/swigtest_java_docs.i
    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/generate_java_docstrings.py
    COMMENT "Generating swigtest_java_docs.i"
)
ADD_CUSTOM_TARGET(
    swigtest_java_docs_i ALL
    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/swigtest_java_docs.i
)

# Build SWIG module and Java JAR
SWIG_BUILD_JAVA_MODULE(swigtest_java SWIGTestJava TRUE)
ADD_DEPENDENCIES(${SWIG_MODULE_swigtest_java_REAL_NAME} swigtest_java_docs_i)
JAVA_BUILD_JAR(SWIGTest.jar "swigtest_java" SWIGTestJava "")

# Build test
JAVA_BUILD_PROGRAM(JavaSWIGTestCpp SWIGTest.jar)

# Add unit test
IF(SWIG_WRAP_BOOST_EXCEPTIONS)
    SET(SWIGWRAP 1)
ENDIF(SWIG_WRAP_BOOST_EXCEPTIONS)
SET(TEST_CMD "${Java_JAVA_EXECUTABLE} JavaSWIGTestCpp")
CONFIGURE_FILE(
    ${CMAKE_SOURCE_DIR}/cpp/test.sh.in
    ${CMAKE_CURRENT_BINARY_DIR}/java-test.sh
)
ADD_TEST(java_cpp_test ${CMAKE_CURRENT_BINARY_DIR}/java-test.sh)
