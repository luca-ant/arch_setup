#!/bin/bash
WD=$(dirname "$(realpath "$0")")
BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID != 0 ] ; then
        echo "${BOLD}You are NOT root! Please, run me as root or with sudo.${NORMAL}"
        exit 1
fi

ESP_PATH="/boot"
echo "[-] Installing systemd-boot..."


cp -r $WD/loader $ESP_PATH
bootctl --path=$ESP_PATH install

echo
blkid
echo

echo "${BOLD}REMEMBER TO CHANGE PARTUUID!${NORMAL}"


echo "[+] Installing systemd-boot... Done!"

