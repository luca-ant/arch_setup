#!/bin/bash

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID != 0 ] ; then
        echo "${BOLD}You are NOT root! Please, run me as root or with sudo.${NORMAL}"
        exit 1
fi

U=luca

groupadd sudo

useradd -m -G sudo -s /bin/bash $U

echo "[-] Create password for user $U"

passwd $U

echo "[+] Create password for user $U. Done!"

echo "[-] Uncomment sudo group privilege"

pacman -S vi
visudo

echo "[+] Uncomment sudo group privilege. Done!"
