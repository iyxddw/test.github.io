#!/bin/bash
export ARCH=arm64
export SUBARCH=arm64
CLANG="~/kernelsu/tools/clang"
MPATH="$CLANG/bin/:$PATH"
make O=out psyche_defconfig
PATH="$MPATH" make -j6 O=out \
    NM=~/kernelsu/tools/clang/bin/llvm-nm \
    OBJCOPY=~/kernelsu/tools/clang/bin/llvm-objcopy \
    LD=~/kernelsu/tools/clang/bin/ld.lld \
    CROSS_COMPILE=~/kernelsu/tools/aarch64/bin/aarch64-buildroot-linux-gnu- \
    CROSS_COMPILE_ARM32=~/kernelsu/tools/arm/bin/arm-linux-androideabi- \
    CC=~/kernelsu/tools/clang/bin/clang \
    AR=~/kernelsu/tools/clang/bin/llvm-ar \
    OBJDUMP=~/kernelsu/tools/clang/bin/llvm-objdump \
    STRIP=~/kernelsu/tools/clang/bin/llvm-strip \
    2>&1 | tee error.log
