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
