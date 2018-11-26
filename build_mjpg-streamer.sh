#! /bin/sh

#sudo apt-get install cmake libjpeg8-dev

# insert below setting to source dir iCMakeList.txt
# include_directories(${HOST_INCLUDE_DIR}/include)
# include_directories(${INSTALL_ROOTFS_DIR}/lib)


cd mjpg-streamer-experimental
cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_ROOTFS_DIR} -DCMAKE_C_COMPILER=${CROSS_COMPILE}gcc -DHOST_INCLUDE_DIR=${HOST_INCLUDE_DIR} -DINSTALL_ROOTFS_DIR=${INSTALL_ROOTFS_DIR} .
make clean
make CC=${CROSS_COMPILE}gcc
make install
cp start.sh $INSTALL_ROOTFS_DIR/test/
