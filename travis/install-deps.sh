#!/bin/bash
#
# Copyright (c) 2016 Nicholas Corgan (n.corgan@gmail.com)
#
# Distributed under the MIT License (MIT) (See accompanying file LICENSE.txt
# or copy at http://opensource.org/licenses/MIT)
#

sudo apt-get -y update
sudo apt-get -y install build-essential git cmake swig2.0 swig3.0 \
                        gcc g++ clang doxygen mono-complete \
                        libpython-dev libpython3-dev default-jre \
                        libboost-dev python-ply python3-ply
