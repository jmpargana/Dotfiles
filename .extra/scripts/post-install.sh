#!/bin/bash

: '
    Arch Linux Install Script: Part 3

    Author: jmpargana aka icm
    Email: jmpargana@gmail.com

    This should be run after the main installation
    after logging in with the new user.
'



AUR_PACKAGES="
    neovim-git
    mongodb-compass
    postman-bin
    netextender
    nvm"


echo "### Setting up yay"
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd


echo "### Installing AUR packages"
yes | yay -S $AUR_PACKAGES


echo "### Load Config files"
cd /home/icm
export HOME=/home/icm
git init --base ~/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config remote add origin https://github.com/jmpargana/dotfiles.git
config pull
