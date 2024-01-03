#!/bin/bash
#envsetup
source build/envsetup.sh
# lunch command 
lunch rising_oscar-user
export TZ=Asia/Dhaka
#make command
make updatepackage
