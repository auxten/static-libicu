# static-libicu
Static libicu 64.2 originally for static building of SQLite 3.28.0 FTS unicode tokenizer

Tested on Linux 4.15.0-34-generic, and should work on other Linux or MacOS. Just change the first arg of `runConfigureICU`.

Most Code are original icu4c 64.2. with some fix:

1. Fix dos format line feed
1. Fix missing dirs

## Start
```bash
#Just run, everything will be installed into ./libicu
./build.sh 
```

```bash
# The `-lxxx` order is important!
LDFLAGS: -licui18n -licuuc -licudata -lm -lstdc++
# Must have this defined
CFLAGS: -DU_STATIC_IMPLEMENTATION
```

## How

The `build.sh`
```bash
cd source && \
CFLAGS="-fPIC" CXXFLAGS="-fPIC" ./runConfigureICU Linux --enable-static --enable-shared --prefix=`pwd`/../libicu && \
make -j16 && \
make install
```
