#!/bin/bash

# Get dotfiles directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/dotfiles"

for name in $(ls $DIR); do
  ln -sf $DIR/$name ~/.$name
done

curl -fLso ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
