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
export PYTHONPATH=/usr/lib/python2.7/dist-packages:/usr/lib/python2.7/site-packages:/usr/local/lib/python2.7/dist-packages:/usr/local/lib/python2.7/site-packages
python -c "import ply"
[ $? -ne 0 ] && exit 1
python -c "import ply.lex"
[ $? -ne 0 ] && exit 1
python -c "import CppHeaderParser"
