#!/bin/bash

RP=$(realpath $0)
CURRENT_DIR=$(dirname $RP)
source $CURRENT_DIR/check_user.sh

git config --global user.email "luca.ant96@libero.it"
git config --global user.name "Luca"

