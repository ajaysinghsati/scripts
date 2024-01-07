#!/bin/bash
echo
echo "--------------------------------------"
echo "    Project elixir 14 14.0 Buildbot          "
echo "                  by                  "
echo "            ajaysinghsati             "
echo "--------------------------------------"
echo
rm -rf .repo
rm -rf *
repo init --depth=1 -u https://github.com/Project-Elixir/manifest -b UNO
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
#Remove local manifest
rm -rf .repo/local_manifests
#Clone trees local manifest
git clone https://github.com/ajaysinghsati/local_manifest.git --depth 1 -b elixer .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
#remove rm -rf hardware/google/pixel/kernel_headers
rm -rf hardware/google/pixel/kernel_headers
#!/bin/bash
#envsetup
source build/envsetup.sh
# lunch command 
lunch derp_oscar-user
export TZ=Asia/Dhaka
#make command
mka derp

