"Vundle"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'
call vundle#end()
filetype plugin indent on

set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab autoindent smartindent
set backupdir=$TEMP,. directory=$TEMP,.
set backspace=indent,eol,start
set number
syntax on
