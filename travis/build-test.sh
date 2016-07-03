#!/bin/bash
#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

export TOPLEVEL_DIR=$PWD/travis/test-code
mkdir $TOPLEVEL_DIR/build

cd $TOPLEVEL_DIR/build
cmake ..
make
[ $? -ne 0 ] && exit 1
ctest --verbose
