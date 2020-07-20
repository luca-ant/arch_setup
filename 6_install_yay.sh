#!/bin/bash


BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID != 0 ] ; then
        echo "${BOLD}You are root! Please, run me as unprivileged user.${NORMAL}"
        exit 1
fi


echo "[-] Installing yay..."

sudo pacman --noconfirm -S fakeroot

TEMP_DIR=$(mktemp -d)

cd "$TEMP_DIR"

git clone https://aur.archlinux.org/yay.git

cd "$TEMP_DIR/yay/"

makepkg -si



echo "[+] Installing yay... Done!"
