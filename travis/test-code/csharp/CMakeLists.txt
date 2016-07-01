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
    ${CMAKE_SOURCE_DIR}/../../swig-modules
)
SET(SWIG_CSHARP_LIBRARIES
    swigtest
)

SWIG_CSHARP_INIT()
SWIG_BUILD_CSHARP_MODULE(swigtest_csharp SWIGTestCSharp TRUE)
CSHARP_BUILD_DLL(swigtest-csharp "swigtest_csharp")
