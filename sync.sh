#!/bin/bash

echo
echo "--------------------------------------"
echo "    RisingOSSTech 14 14.0 Buildbot    "
echo "                  by                  "
echo "            ajaysinghsati             "
echo "--------------------------------------"
echo
#Remove local manifest
rm -rf .repo/local_manifests
rm -rf device/oneplus/sm6375-common
rm -rf vendor/aosp
#git clone https://github.com/ajaysinghsati/android_vendor_rising.git vendor/rising
#Clone trees local manifest
git clone https://github.com/ajaysinghsati/local_manifest.git --depth 1 -b risingos-14 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
#remove rm -rf hardware/google/pixel/kernel_headers
rm -rf hardware/google/pixel/kernel_headers
# Run build script 
chmod u+x scripts/build.sh
./scripts/build.sh

