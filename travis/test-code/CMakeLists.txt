#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

PROJECT(swig-test C CXX)
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../../cmake-modules;${CMAKE_MODULE_PATH}")

FIND_PACKAGE(Boost REQUIRED)
FIND_PACKAGE(CSharp REQUIRED)

INCLUDE_DIRECTORIES(
    ${CMAKE_SOURCE_DIR}
    ${Boost_INCLUDE_DIRS}
)

ADD_LIBRARY(swigtest SHARED test_fcns.cpp)
