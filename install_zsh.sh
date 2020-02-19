#!/bin/bash

RP=$(realpath $0)
CURRENT_DIR=$(dirname $RP)

source $CURRENT_DIR/check_user.sh


sudo pacman -S zsh wget

rm -rf $HOME/.oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

