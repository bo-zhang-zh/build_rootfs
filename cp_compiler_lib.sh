#! /bin/sh

#cd /home/zhangbo/zedboard/git-workspace/mk_rootfs/_rootfs
cd $INSTALL_ROOTFS_DIR
mkdir -p lib sbin usr/bin
#cp /opt/Xilinx/SDK/2018.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/lib/* lib -r
#/opt/Xilinx/SDK/2018.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin/arm-linux-gnueabihf-strip lib/*
#cp /opt/Xilinx/SDK/2018.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/sbin/* sbin/ -r
#cp /opt/Xilinx/SDK/2018.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/bin/* usr/bin/ -r

cp $COMPILER_SYSROOT/libc/lib/* lib -r
${CROSS_COMPILE}strip lib/*
cp $COMPILER_SYSROOT/libc/sbin/* sbin/ -r
cp $COMPILER_SYSROOT/libc/usr/bin/* usr/bin/ -r
