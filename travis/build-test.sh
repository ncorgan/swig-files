#!/bin/bash
#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

export TOPLEVEL_DIR=$PWD/travis/test-code
mkdir $TOPLEVEL_DIR/build $TOPLEVEL_DIR/build-with-boost

cd $TOPLEVEL_DIR/build
cmake ..
make
[ $? -ne 0 ] && exit 1
ctest --verbose
[ $? -ne 0 ] && exit 1

cd $TOPLEVEL_DIR/build-with-boost
cmake -DSWIG_WRAP_BOOST_EXCEPTIONS=ON ..
make
[ $? -ne 0 ] && exit 1
export SWIG_WRAP_BOOST_EXCEPTIONS=1
ctest --verbose
