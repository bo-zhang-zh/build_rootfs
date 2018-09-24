#! /bin/sh

cd ../_rootfs
mkdir dev etc etc/dropbear etc/init.d /etc/group mnt opt proc root sys tmp var var/log var/www
cd ../rootfs_config_file
cp fstab ../_rootfs/etc/fstab
cp inittab ../_rootfs/etc/inittab
cp passwd ../_rootfs/etc/passwd

cp rcS ../_rootfs/etc/init.d/rcS
chmod 755 ../_rootfs/etc/init.d/rcS
sudo chown root:root ../_rootfs/etc/init.d/rcS
