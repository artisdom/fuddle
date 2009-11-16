#!/bin/sh

cp .bash_aliases $HOME
cp .vimrc $HOME
mkdir $HOME/.vim
tar zxvf vimball.tar.gz -C $HOME/.vim

