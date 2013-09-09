#!/bin/bash
# This assumes you have the PalmPDK installed in /opt/PalmPDK.
cp configure.ac ..
cd ..
./autogen.sh
export CFLAGS=-I/opt/PalmPDK/include/
export LDFLAGS=-L/opt/PalmPDK/device/lib/
export CXX=/opt/PalmPDK/arm-gcc-bin/arm-none-linux-gnueabi-g++
export CC=/opt/PalmPDK/arm-gcc/bin/arm-none-linux-gnueabi-gcc
./configure --host=arm && make
