#!/bin/bash
WD=$(dirname $(realpath $0))
source $WD/check_user.sh

echo "[-] Configuring git..."

git config --global user.email "luca.ant96@libero.it"
git config --global user.name "Luca"

echo "[+] Configuring git... Done!"
