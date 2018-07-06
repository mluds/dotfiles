#!/bin/bash

# Install dotfiles
OLDIFS=$IFS
IFS=','
for path in \
    bash,.bashrc \
    fish,.config/fish/config.fish \
    git,.gitconfig \
    gvim,.gvimrc \
    tmux,.tmux.conf \
    vim,.vimrc \
    zsh,.zshrc \
    i3,.i3/config \
    Xresources,.Xresources \
; do
    set -- $path
    target=$HOME/$2
    mkdir -p $(dirname $target)
    ln -sf "$(pwd)/$1" "$target"
done
IFS=$OLDIFS

sudo yum install -y epel-release http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm
sudo yum install -y ack cowsay tmux zsh git xorg-x11-server-utils

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Install vim-plug
curl -fLso ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +GoInstallBinaries +qall
