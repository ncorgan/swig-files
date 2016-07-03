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
    ${CMAKE_SOURCE_DIR}/../../swig-modules
)
SET(SWIG_JAVA_LIBRARIES
    swigtest
)

# Build SWIG module and Java JAR
SWIG_BUILD_JAVA_MODULE(swigtest_java SWIGTestJava TRUE)
JAVA_BUILD_JAR(SWIGTest.jar "swigtest_java" SWIGTestJava "")

# Build test
JAVA_BUILD_PROGRAM(JavaSWIGTest SWIGTest.jar)

# Add unit test
IF(SWIG_WRAP_BOOST_EXCEPTIONS)
    SET(SWIGWRAP 1)
ENDIF(SWIG_WRAP_BOOST_EXCEPTIONS)
SET(TEST_CMD "${Java_JAVA_EXECUTABLE} JavaSWIGTest")
CONFIGURE_FILE(
    ${CMAKE_SOURCE_DIR}/test.sh.in
    ${CMAKE_CURRENT_BINARY_DIR}/java-test.sh
)
ADD_TEST(java_test ${CMAKE_CURRENT_BINARY_DIR}/java-test.sh)
