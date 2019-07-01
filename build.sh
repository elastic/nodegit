#!/bin/bash

source scl_source enable devtoolset-3
export CC="gcc -fPIC -Wno-deprecated-declarations -Wno-missing-field-initializers"
export CXX=g++

cd /build
source ~/.bashrc
npm install
npm run rebuild