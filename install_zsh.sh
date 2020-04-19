#!/bin/bash

WD=$(dirname $(realpath $0))

source $WD/check_user.sh

sudo pacman -S zsh wget

rm -rf $HOME/.oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

