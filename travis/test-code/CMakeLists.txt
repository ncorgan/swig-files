#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

PROJECT(swig-test C CXX)
CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
ENABLE_TESTING()

SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/../../cmake-modules;${CMAKE_MODULE_PATH}")

FIND_PACKAGE(Boost REQUIRED)
FIND_PACKAGE(SWIG REQUIRED)
FIND_PACKAGE(CSharp REQUIRED)
FIND_PACKAGE(Java REQUIRED)
FIND_PACKAGE(JNI REQUIRED)
FIND_PACKAGE(PythonLibs 2 REQUIRED)
FIND_PACKAGE(PythonInterp 2 REQUIRED)

ADD_SUBDIRECTORY(c)
ADD_SUBDIRECTORY(cpp)
