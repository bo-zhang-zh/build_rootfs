#! /bin/sh

boa_src_dir=$(cd `dirname $0`; pwd)/boa
cd src
#./configure --prefix=/usr/local/boa --host=${CROSS_COMPILE_PREFIX}

#
#  vi Makefile
#  CC=${CROSS_COMPILE}gcc
#  CPP=${CROSS_COMPILE}g++
#
#  vi src/boa.c
#  /*        if (setuid(0) != -1) {
#            DIE("icky Linux kernel bug!");
#        }*/
#
#  vi src/compat.h
#  #define TIMEZONE_OFFSET(foo) foo->tm_gmtoff

make clean
make -j4
${CROSS_COMPILE}strip boa

cd $INSTALL_ROOTFS_DIR
mkdir -p etc/boa var/log/boa var/www/cgi-bin usr/local/boa
cp $boa_src_dir/src/boa $INSTALL_ROOTFS_DIR/usr/local/boa/
touch var/log/boa/error_log var/log/boa/access_log

cd $boa_src_dir
cp $boa_src_dir/boa.conf $INSTALL_ROOTFS_DIR/etc/boa/
cp /etc/mime.types $INSTALL_ROOTFS_DIR/etc/
cp $INIT_CONFIG_DIR/index.html $INSTALL_ROOTFS_DIR/var/www/
