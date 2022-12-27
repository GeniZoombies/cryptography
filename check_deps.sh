#!/bin/bash

echo "Check BoringSSL"
mkdir -p deps
cd deps
if [ ! -d boringssl/.git ];then
  git clone https://github.com/google/boringssl.git
fi
echo "Enter BoringSSL"
cd boringssl
src_dir=$PWD
if [ ! -d "$src_dir"/build ]; then
  mkdir -p "$src_dir"/build
fi
if [ ! -d "$src_dir"/build/Makefile ]; then
   cd "$src_dir"/build
   cmake -DCMAKE_POSITION_INDEPENDENT_CODE=ON ..
fi
if [ ! -e "$src_dir"/install/bin/bssl ]; then
  echo "Prepare build BoringSSL"
  cd "$src_dir"/build && make install
fi