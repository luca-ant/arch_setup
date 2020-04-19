#!/bin/bash

source $WD/check_user.sh

T=$(mktemp)
cd $T

rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
