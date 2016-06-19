#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

PROJECT(swig-test C CXX)
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

INCLUDE_DIRECTORIES(
    ${CMAKE_SOURCE_DIR}
)

ADD_LIBRARY(swigtest SHARED test_fcns.cpp)
