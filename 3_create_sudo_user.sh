#!/bin/bash

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID != 0 ] ; then
        echo "${BOLD}You are NOT root! Please, run me as root or with sudo.${NORMAL}"
        exit 1
fi

pacman -S vi sudo

U=luca

echo

echo -e "[-] Creating user $U..."
echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

useradd -m -G sudo -s /bin/bash $U
groupadd sudo

echo -e "[+] Creating user $U... Done!\n"

echo -e "[-] Creating password for user $U..."
echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

passwd $U

echo -e "[+] Creating password for user $U... Done!\n"


echo -e "[-] Uncomment sudo group privilege..."
echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

visudo

echo -e "[+] Uncomment sudo group privilege... Done!\n"

echo -e "FINISH! Bye!"
