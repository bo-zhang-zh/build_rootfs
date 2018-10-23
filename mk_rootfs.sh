#! /bin/sh

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
