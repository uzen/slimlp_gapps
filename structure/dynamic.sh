#!/sbin/sh

# Variables
ARCH=$(grep ro.product.cpu.abi= /system/build.prop | cut -d "=" -f 2);

# PrebuiltGmsCore
# COPY 430 (ARM VERSION) TO SYSTEM
cp -af /tmp/PrebuiltGmsCore/430/* /system

# IF 64-BIT ARCHITECTURE, REMOVE 430 AND INSTALL 440
if [ $ARCH == arm64-v8a ]; then
 rm -rf /system/priv-app/PrebuiltGmsCore
 cp -af /tmp/PrebuiltGmsCore/440/* /system
fi
