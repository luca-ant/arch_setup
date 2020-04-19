#!/bin/bash

WD=$(dirname $(realpath $0))
source $WD/check_user.sh


sudo pacman -S i3 xorg-xinit xorg-server dmenu xterm scrot rofi xautolock nitrogen xorg-xinput

