#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

INCLUDE(UseCSharp)
INCLUDE(SWIGCSharp)

IF(SWIG_WRAP_BOOST_EXCEPTIONS)
    SET(SWIG_CSHARP_FLAGS "-DSWIG_WRAP_BOOST_EXCEPTIONS")
ENDIF(SWIG_WRAP_BOOST_EXCEPTIONS)

SET(SWIG_MODULE_DIR
    ${CMAKE_CURRENT_SOURCE_DIR}
)
SET(SWIG_CSHARP_INCLUDE_DIRS
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_SOURCE_DIR}/../../swig-modules
)
SET(SWIG_CSHARP_LIBRARIES
    swigtest-cpp
)

# Generate C# docstrings
SET(SWIG_LANGUAGE "csharp")
CONFIGURE_FILE(
    ${CMAKE_CURRENT_SOURCE_DIR}/../generate_swig_docstrings.py.in
    ${CMAKE_CURRENT_BINARY_DIR}/generate_csharp_docstrings.py
@ONLY)
FILE(GLOB_RECURSE header_files ${CMAKE_CURRENT_SOURCE_DIR}/.. "*.h*")
ADD_CUSTOM_COMMAND(
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/../generate_swig_docstrings.py.in
    DEPENDS ${header_files}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/../../python-scripts
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/swigtest_csharp_docs.i
    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/generate_csharp_docstrings.py
    COMMENT "Generating swigtest_csharp_docs.i"
)
ADD_CUSTOM_TARGET(
    csharp_swigtest_cpp_docs ALL
    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/swigtest_csharp_docs.i
)

# Build SWIG module and C# DLL
SWIG_CSHARP_INIT()
SWIG_BUILD_CSHARP_MODULE(csharp_swigtest_cpp CppSWIGTestCSharp TRUE)
ADD_DEPENDENCIES(${SWIG_MODULE_csharp_swigtest_cpp_REAL_NAME} csharp_swigtest_cpp_docs)
CSHARP_BUILD_DLL(csharp-swigtest-cpp "csharp_swigtest_cpp")

# Build test
SET(CSHARP_SOURCE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
CSHARP_BUILD_EXE(CSharpSWIGTestCpp csharp-swigtest-cpp)

# Add unit test
IF(SWIG_WRAP_BOOST_EXCEPTIONS)
    SET(SWIGWRAP 1)
ENDIF(SWIG_WRAP_BOOST_EXCEPTIONS)
IF(WIN32)
    SET(TEST_CMD "${CMAKE_CURRENT_BINARY_DIR}/CSharpSWIGTestCpp.exe")
ELSE()
    SET(TEST_CMD "${CSHARP_INTERPRETER} ${CMAKE_CURRENT_BINARY_DIR}/CSharpSWIGTestCpp.exe")
ENDIF(WIN32)
CONFIGURE_FILE(
    ${CMAKE_SOURCE_DIR}/cpp/test.sh.in
    ${CMAKE_CURRENT_BINARY_DIR}/csharp-test.sh
)
ADD_TEST(csharp_cpp_test ${CMAKE_CURRENT_BINARY_DIR}/csharp-test.sh)
