#!/bin/bash

# Get dotfiles directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/dotfiles"

# Install dotfiles
for name in $(ls $DIR); do
  ln -sf $DIR/$name ~/.$name
done

# Vim deps
sudo yum install -y ack

# Install vim-plug
curl -fLso ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +GoInstallBinaries +qall
