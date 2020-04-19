#!/bin/bash

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID != 0 ] ; then
        echo "${BOLD}You are NOT root! Please, run me as root or with sudo.${NORMAL}"
        exit 1
fi

U=luca
useradd -m -G sudo -s /bin/bash $U

echo "[-] Creating password for user $U..."

passwd $U

echo "[+] Creating password for user $U... Done!"

pacman -S vi sudo

groupadd sudo

echo "[-] Uncomment sudo group privilege..."

visudo

echo "[+] Uncomment sudo group privilege... Done!"
