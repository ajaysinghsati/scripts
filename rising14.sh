#!/bin/bash

rm -rf .repo
rm -rf *
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)

#Remove local manifest
rm -rf .repo/local_manifests
#rm -rf device/oneplus/sm6375-common
#rm -rf vendor/aosp
rm -rf vendor/rising
git clone https://github.com/ajaysinghsati/android_vendor_rising.git vendor/rising
#Clone trees local manifest
git clone https://github.com/ajaysinghsati/local_manifest.git --depth 1 -b risingos-14 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
#remove rm -rf hardware/google/pixel/kernel_headers
rm -rf hardware/google/pixel/kernel_headers

#envsetup
source build/envsetup.sh
# lunch command 
lunch rising_oscar-user
export TZ=Asia/Dhaka
#make command
make updatepackage
