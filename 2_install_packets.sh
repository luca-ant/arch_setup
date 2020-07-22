#!/bin/bash

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID != 0 ] ; then
        echo "${BOLD}You are NOT root! Please, run me as root or with sudo.${NORMAL}"
        exit 1
fi

WD=$(dirname "$WD")

echo -e "[-] Installing packets..."

cat "$WD/packets" | while read P ; do
    pacman --noconfirm -S $P
done


echo -e "[+] Installing packets... Done!\n"

echo -e "FINISH! Bye!"
