#!/bin/sh

make distclean

#export PATH=$PATH:/home/mlyle/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
export CROSS_COMPILE="ccache arm-linux-gnueabihf-"
export KERNEL=kernel7
export ARCH=arm
export KDEB_CHANGELOG_DIST=unstable

make bcm2709_defconfig

echo 'CONFIG_PREEMPT_RT_FULL=y' >confmerge

scripts/kconfig/merge_config.sh .config confmerge

make bindeb-pkg -j6
