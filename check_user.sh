#!/bin/bash

WD=$(dirname $(realpath $0))

BOLD=$(tput bold)
NORMAL=$(tput sgr0)

if [ $EUID == 0 ] ; then
    echo "${BOLD}You are root! Please, run me as a normal user.${NORMAL}"
    exit 1
else
    echo "${BOLD}Hi, $USER${NORMAL}"
fi
