#!/bin/bash
RP=$(realpath $0)
CURRENT_DIR=$(dirname $RP)

source $CURRENT_DIR/check_user.sh

cd $HOME
rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm -rf yay
