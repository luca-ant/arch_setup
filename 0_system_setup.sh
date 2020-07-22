#!/bin/bash

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID != 0 ] ; then
        echo "${BOLD}You are NOT root! Please, run me as root or with sudo.${NORMAL}"
        exit 1
fi

echo -e "\n[-] Setting Time Zone..."

echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
hwclock --systohc

echo -e "[+] Setting Time Zone... Done!\n"

echo -e "[-] Select your locale..."

echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

vim /etc/locale.gen

echo -e "[+] Select your locale... Done!\n"

echo -e "[-] Generating locale..."

echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

locale-gen

echo -e "[+] Generating locale... Done!\n"

echo -e "[-] Setting LANG variable..."

echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

echo "LANG=it_IT.UTF-8" | tee /etc/locale.conf

echo -e "[+] Setting LANG variable... Done!\n"

echo -e "[-] Setting KEYMAP variable..."

echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

echo "KEYMAP=us" | tee /etc/vconsole.conf

echo -e "[+] Setting KEYMAP variable... Done!\n"

echo -e "[-] Setting HOSTNAME..."

echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

echo "swift" | tee /etc/hostname
echo -e "127.0.0.1\tlocalhost" | tee -a /etc/hosts
echo -e "::1\t\tlocalhost" | tee -a /etc/hosts
echo -e "127.0.0.1\tswift" | tee -a /etc/hosts

echo -e "[+] Setting HOSTNAME... Done!\n"

echo -e "[-] Generating INITRAMFS..."

echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

mkinitcpio -P

echo -e "[+] Generating INITRAMFS... Done!\n"

echo -e "[-] Setting ROOT password..."

echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

passwd

echo -e "[+] Setting ROOT password... Done!\n"

echo -e "FINISH! Bye!"


