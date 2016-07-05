#!/bin/bash
#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

sudo apt-get -y update
sudo apt-get -y install build-essential git cmake swig gcc g++ \
                        libboost-dev doxygen mono-complete default-jre \
                        libpython-dev python-ply python-pip
sudo pip install CppHeaderParser

# Test imports
python -c "import ply"
[ $? -ne 0 ] && exit 1
python -c "import ply.lex"
[ $? -ne 0 ] && exit 1
export PYTHONPATH=/usr/local/lib/python2.7/dist-packages:$PYTHONPATH
python -c "import CppHeaderParser"
