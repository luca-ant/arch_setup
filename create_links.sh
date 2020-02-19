#!/bin/bash

RP=$(realpath $0)
CURRENT_DIR=$(dirname $RP)

source $CURRENT_DIR/check_user.sh

rm -r ~/.zshrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
rm -r ~/.zprofile
ln -s ~/dotfiles/zsh/zprofile ~/.zprofile
