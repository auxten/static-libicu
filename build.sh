#!/bin/sh

cd source && \
CFLAGS="-fPIC" CXXFLAGS="-fPIC" ./runConfigureICU Linux --enable-static --enable-shared --prefix=`pwd`/../libicu && \
make -j16 && \
make install

cd .. && cp ./libicu/lib/*.a ~/Codes/go/src/github.com/CovenantSQL/CovenantSQL/libicu/lib && cp -r ./libicu/include/* ~/Codes/go/src/github.com/CovenantSQL/CovenantSQL/libicu/include

