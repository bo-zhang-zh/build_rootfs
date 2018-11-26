#! /bin/sh

source /opt/Xilinx/SDK/2018.1/settings64.sh
export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm

export CROSS_COMPILE_PREFIX=arm-linux-gnueabihf
export COMPILER_SYSROOT=/opt/Xilinx/SDK/2018.1/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf

current_dir=$(cd `dirname $0`; pwd);

export HOST_INCLUDE_DIR=$current_dir/host_build_include
export INSTALL_ROOTFS_DIR=$current_dir/_rootfs
export INIT_CONFIG_DIR=$current_dir/rootfs_config_file

$current_dir/cp_compiler_lib.sh
$INIT_CONFIG_DIR/cp_file_to_rootfs.sh

cd $current_dir
if [ -d $current_dir/busybox ]; then
    git remote update
else
    git clone https://git.busybox.net/busybox
fi
cd $current_dir/busybox
$current_dir/build_busybox.sh

cd $current_dir
if [ -d $current_dir/dropbear ]; then
    git remote update
else
    git clone https://github.com/mkj/dropbear.git
fi
cd $current_dir/dropbear
$current_dir/build_dropbear.sh

# https://github.com/bo-zhang-zh/boa.git
if [ -d $current_dir/boa ]; then
    cd $current_dir/boa
    $current_dir/build_boa.sh
fi

# https://github.com/bo-zhang-zh/jpeg-lib.git
cd $current_dir/jpeg-9c
$current_dir/build_jpeg.sh

# https://github.com/bo-zhang-zh/mjpg-streamer.git
cd $current_dir/mjpg-streamer
$current_dir/build_mjpg-streamer.sh


cd $current_dir

dd if=/dev/zero of=ramdisk.img bs=1024 count=32768
mke2fs -F ramdisk.img -L "ramdisk" -b 1024 -m 0
tune2fs ramdisk.img -i 0
chmod 777 ramdisk.img
mkdir ramdisk_tmp
mount -o loop ramdisk.img ramdisk_tmp/
cp -R $INSTALL_ROOTFS_DIR/* ramdisk_tmp/
umount ramdisk_tmp/
mkimage -A arm -O linux -T ramdisk -C gzip -a 0x00000000 -n "Linux Ramdisk Filesystem" -d ./ramdisk.img ./uramdisk.img.gz
rm -rf ramdisk.img ramdisk_tmp/
