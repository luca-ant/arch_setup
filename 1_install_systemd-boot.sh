#!/bin/bash
WD=$(dirname "$(realpath "$0")")
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID != 0 ] ; then
        echo "${BOLD}You are NOT root! Please, run me as root or with sudo.${NORMAL}"
        exit 1
fi

pacman -S intel-ucode

echo -e "[-] Installing systemd-boot..."
echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi


ESP_PATH="/boot"

bootctl --path=$ESP_PATH install

cp -r $WD/systemd-boot/loader/loader.conf $ESP_PATH/loader/loader.conf
cp -r $WD/systemd-boot/loader/entries/arch.conf $ESP_PATH/loader/entries/arch.conf

echo -e "[+] Installing systemd-boot... Done!\n"

echo -e "[-] Changing PARTUUID"
echo Continue? [y/N] ; read A ; if [ -z $A ] || [ $A != 'y' ] ; then echo Bye! ; exit 0 ; fi

echo | tee -a $ESP_PATH/loader/entries/arch.conf
blkid | tee -a $ESP_PATH/loader/entries/arch.conf
vim $ESP_PATH/loader/entries/arch.conf

echo -e "[+] Changing PARTUUID... Done!\n"


echo -e "${BOLD}REMEMBER TO CHANGE PARTUUID!${NORMAL}\n"

echo -e "FINISH! Bye!"
