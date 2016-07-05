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
                        libpython-dev libpython3-dev python-ply python3-ply \
			python-pip python3-pip
sudo pip2 install CppHeaderParser
sudo pip3 install CppHeaderParser

dpkg --list | grep swig
