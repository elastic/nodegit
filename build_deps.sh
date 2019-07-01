#!/bin/bash

source scl_source enable devtoolset-3
export CC="gcc -fPIC -Wno-deprecated-declarations -Wno-missing-field-initializers"
export CXX=g++
mkdir -p /src
cd /src

curl https://www.openssl.org/source/openssl-1.0.2o.tar.gz -o openssl-1.0.2o.tar.gz
tar xfz openssl-1.0.2o.tar.gz
cd openssl-1.0.2o
./config
TARGET_ARCH="" make
make install

cd /src
curl https://curl.haxx.se/download/curl-7.63.0.tar.gz -o curl-7.63.0.tar.gz
tar xfz curl-7.63.0.tar.gz
cd curl-7.63.0
LIBS="-ldl -lpthread" ./configure --disable-shared --with-ssl=/usr/local/ssl/
make
make install

