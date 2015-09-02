#!/sbin/sh

# Variables
ARCH=$(grep ro.product.cpu.abi= /system/build.prop | cut -d "=" -f 2);

# PrebuiltGmsCore
# COPY 230 (ARM VERSION) TO SYSTEM
cp -af /tmp/PrebuiltGmsCore/230/* /system

# IF 64-BIT ARCHITECTURE, REMOVE 230 AND INSTALL 240
if [ $ARCH == arm64-v8a ]; then
 rm -rf /system/priv-app/PrebuiltGmsCore
 cp -af /tmp/PrebuiltGmsCore/240/* /system
fi
