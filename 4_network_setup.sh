#!/bin/bash

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID != 0 ] ; then
        echo "${BOLD}You are NOT root! Please, run me as root or with sudo.${NORMAL}"
        exit 1
fi

echo -e "[-] Setup network..."
echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

pacman -S networkmanager dhcpcd

ip link set eth0 up

systemctl start dhcpcd.service
systemctl enable dhcpcd.service

echo -e "[+] Setup network... Done!\n"

echo -e "FINISH! Bye!"

