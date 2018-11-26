#! /bin/sh

./configure CC=${CROSS_COMPILE}gcc --host=$CROSS_COMPILE_PREFIX --prefix=$HOST_INCLUDE_DIR --exec-prefix=$INSTALL_ROOTFS_DIR
make clean
make -j4
make install
