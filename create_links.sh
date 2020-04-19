#!/bin/bash

WD=$(dirname $(realpath $0))
source $WD/check_user.sh

rm -r ~/.zshrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
rm -r ~/.zprofile
ln -s ~/dotfiles/zsh/zprofile ~/.zprofile
