#!/bin/sh

make clean

export PATH=$PATH:/home/mlyle/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
export CROSS_COMPILE="arm-linux-gnueabihf-"
export KERNEL=kernel7

make ARCH=arm bcm2709_defconfig

DEB_HOST_ARCH=armhf make-kpkg --rootcmd fakeroot --arch arm --cross-compile "$CROSS_COMPILE" --revision=1.0 --jobs 6 kernel_image kernel_headers
