#! /bin/sh

cd $INSTALL_ROOTFS_DIR
mkdir dev etc etc/dropbear etc/init.d /etc/group mnt opt proc root sys tmp var var/log var/www home test
#cd ../rootfs_config_file
cd $INIT_CONFIG_DIR
cp $INIT_CONFIG_DIR/fstab $INSTALL_ROOTFS_DIR/etc/fstab
cp $INIT_CONFIG_DIR/inittab $INSTALL_ROOTFS_DIR/etc/inittab
cp $INIT_CONFIG_DIR/passwd $INSTALL_ROOTFS_DIR/etc/passwd

cp $INIT_CONFIG_DIR/rcS $INSTALL_ROOTFS_DIR/etc/init.d/rcS
chmod 755 $INSTALL_ROOTFS_DIR/etc/init.d/rcS
sudo chown root:root $INSTALL_ROOTFS_DIR/etc/init.d/rcS
