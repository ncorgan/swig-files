#!/bin/bash
#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

export TOPLEVEL_DIR=$PWD/travis/test-code
mkdir $TOPLEVEL_DIR/build-swig2 $TOPLEVEL_DIR/build-swig3

cd $TOPLEVEL_DIR/build-swig2
cmake -DSWIG_EXECUTABLE=/usr/bin/swig2.0 ..
make
[ $? -ne 0 ] && exit 1
ctest --verbose
[ $? -ne 0 ] && exit 1

cd ../build-swig3
cmake -DSWIG_EXECUTABLE=/usr/bin/swig3.0 ..
make
[ $? -ne 0 ] && exit 1
ctest --verbose
[ $? -ne 0 ] && exit 1
