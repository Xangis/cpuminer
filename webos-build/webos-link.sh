#!/bin/bash
cd ..
/opt/PalmPDK/arm-gcc/bin/arm-none-linux-gnueabi-gcc -std=gnu99  -g -O2 -pthread -Wl,--allow-shlib-undefined -L/opt/PalmPDK/device/lib/ -o minerd minerd-cpu-miner.o minerd-util.o minerd-sha2.o minerd-sha2-arm.o minerd-sha2-x86.o minerd-sha2-x64.o minerd-scrypt.o minerd-scrypt-arm.o minerd-scrypt-x86.o minerd-scrypt-x64.o -lcurl compat/jansson/libjansson.a -lpthread -lcrypto -lssl -lz
