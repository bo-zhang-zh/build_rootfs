#! /bin/sh

autoconf; autoheader
#./configure --prefix=/home/zhangbo/zedboard/git-workspace/mk_rootfs/_rootfs --disable-zlib --enable-static CC=/opt/Xilinx/SDK/2018.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin/arm-linux-gnueabihf-gcc --host=arm-linux-gnueabihf LDFLAGS="-Wl,--gc-sections" CFLAGS="-ffunction-sections -fdata-sections -Os"
./configure --prefix=$INSTALL_ROOTFS_DIR --disable-zlib --enable-static CC=${CROSS_COMPILE_PREFIX}-gcc --host=${CROSS_COMPILE_PREFIX} LDFLAGS="-Wl,--gc-sections" CFLAGS="-ffunction-sections -fdata-sections -Os"
make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp"
make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" install
