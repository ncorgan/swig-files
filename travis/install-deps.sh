#!/bin/bash
#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

sudo apt-get -y update
sudo apt-get -y install build-essential git cmake 'swig*' \
                        gcc g++ doxygen mono-complete default-jre \
                        libpython-dev libboost-dev python-ply \
