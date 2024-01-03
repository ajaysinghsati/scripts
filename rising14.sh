#!/bin/bash

rm -rf .repo
rm -rf *
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)
chmod u+x scripts/sync.sh
./scripts/sync.sh
