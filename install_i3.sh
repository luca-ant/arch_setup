#!/bin/bash

RP=$(realpath $0)
CURRENT_DIR=$(dirname $RP)

source $CURRENT_DIR/check_user.sh


sudo pacman -S i3 xorg-xinit xorg-server dmenu xterm scrot rofi xautolock nitrogen xorg-xinput

