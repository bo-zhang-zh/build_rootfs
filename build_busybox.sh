#! /bin/sh

make clean
#make menuconfig
make defconfig
make -j4

#make CONFIG_PREFIX=~/zedboard/git-workspace/mk_rootfs/_rootfs install
make CONFIG_PREFIX=$INSTALL_ROOTFS_DIR install
