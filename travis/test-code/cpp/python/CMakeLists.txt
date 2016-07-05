#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

INCLUDE(SWIGPython)

IF(SWIG_WRAP_BOOST_EXCEPTIONS)
    SET(SWIG_PYTHON_FLAGS "-DSWIG_WRAP_BOOST_EXCEPTIONS")
ENDIF(SWIG_WRAP_BOOST_EXCEPTIONS)

SET(SWIG_MODULE_DIR
    ${CMAKE_CURRENT_SOURCE_DIR}
)
SET(SWIG_PYTHON_INCLUDE_DIRS
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/../../swig-modules
)
SET(SWIG_PYTHON_LIBRARIES
    swigtest
)

# Generate C# docstrings
SET(SWIG_LANGUAGE "python")
CONFIGURE_FILE(
    ${CMAKE_CURRENT_SOURCE_DIR}/../generate_swig_docstrings.py.in
    ${CMAKE_CURRENT_BINARY_DIR}/generate_python_docstrings.py
@ONLY)
FILE(GLOB_RECURSE header_files ${CMAKE_SOURCE_DIR} "*.h*")
ADD_CUSTOM_COMMAND(
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/../generate_swig_docstrings.py.in
    DEPENDS ${header_files}
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/../../python-scripts
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/swigtest_python_docs.i
    COMMAND ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/generate_python_docstrings.py
    COMMENT "Generating swigtest_python_docs.i"
)
ADD_CUSTOM_TARGET(
    swigtest_python_docs_i ALL
    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/swigtest_python_docs.i
)

# Build SWIG module
SWIG_BUILD_PYTHON_MODULE(swigtest_python swigtest TRUE)
ADD_DEPENDENCIES(${SWIG_MODULE_swigtest_python_REAL_NAME} swigtest_python_docs_i)

# Add unit test
IF(SWIG_WRAP_BOOST_EXCEPTIONS)
    SET(SWIGWRAP 1)
ENDIF(SWIG_WRAP_BOOST_EXCEPTIONS)
SET(TEST_CMD "${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/python_swigtest.py")
CONFIGURE_FILE(
    ${CMAKE_SOURCE_DIR}/cpp/test.sh.in
    ${CMAKE_CURRENT_BINARY_DIR}/python-test.sh
)
ADD_TEST(python_test ${CMAKE_CURRENT_BINARY_DIR}/python-test.sh)
