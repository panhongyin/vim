#!/bin/bash

if test $UID -ne 0; then
    echo "Sorry, I need root, piggy !!!"
    exit 1
fi

os_name=$(grep -w "NAME" /etc/os-release | awk -F '=' '{print $2}')
case $os_name in
    '"Ubuntu"'):
        apt install -y vim python-flake8
        cp -f ./vimrc /etc/vim/vimrc
        ;;
    '"CentOS"'):
        yum install -y vim python-flake8
        /usr/bin/cp -f ./vimrc /etc/vimrc
        ;;
    *):
        echo "I don't know the OS is what ghost"
        exit 1
        ;;
esac

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
