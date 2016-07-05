#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

IF(SWIG_WRAP_BOOST_EXCEPTIONS)
    ADD_DEFINITIONS(-DSWIG_WRAP_BOOST_EXCEPTIONS)
ENDIF(SWIG_WRAP_BOOST_EXCEPTIONS)

INCLUDE_DIRECTORIES(
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${Boost_INCLUDE_DIRS}
)

SET(swigtest_sources
    test_class.cpp
    test_fcns.cpp
)

ADD_LIBRARY(swigtest SHARED ${swigtest_sources})

ADD_SUBDIRECTORY(csharp)
ADD_SUBDIRECTORY(java)
ADD_SUBDIRECTORY(python)
