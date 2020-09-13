#!/bin/bash
WD=$(dirname "$(realpath "$0")")
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID != 0 ] ; then
        echo "${BOLD}You are NOT root! Please, run me as root or with sudo.${NORMAL}"
        exit 1
fi


echo -e "[-] Installing grub..."
echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

pacman -S grub

echo -e "Run:\n\tgrub-install --target=i386-pc /dev/sdX"

echo -e "\tgrub-mkconfig -o /boot/grub/grub.cfg"

echo

echo -e "[+] Installing grub... Done!\n"

echo -e "FINISH! Bye!"

