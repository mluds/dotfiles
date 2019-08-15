#!/bin/bash

# install dotfiles
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

# get linux distro id
. /etc/os-release

# OS packages
if [ $ID == "centos" ]; then
    curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash -
    sudo yum install -y \
        epel-release \
        http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm
    sudo yum install -y \
        ack cowsay tmux zsh git xorg-x11-server-utils \
        automake gcc gcc-c++ kernel-devel cmake \
        python-devel python3-devel \
        nodejs
elif [ $ID == "ubuntu" ]; then
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    sudo apt update && sudo apt install -y \
        ack cowsay tmux zsh git x11-xserver-utils \
        automake gcc g++ linux-headers-generic cmake \
        python-dev python-pip python3-dev \
        nodejs
fi

# pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# install vim-plug and plugins
curl -fLso ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +GoInstallBinaries +qall

# install YCM
~/.vim/plugged/youcompleteme/install.py \
    --clang-completer \
    --js-completer

sudo python -m pip install flake8
