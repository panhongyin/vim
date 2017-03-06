#!/bin/bash

if test $UID -ne 0; then
    echo "Sorry, I need root, piggy !!!"
    exit 1
fi

case $(crudini --get /etc/os-release  DEFAULT ID) in
    'ubuntu'):
        apt install -y vim python-flake8
        cp -f ./vimrc /etc/vim/vimrc
        ;;
    '"centos"'):
        yum install -y vim python-flake8
        /usr/bin/cp -f ./vimrc /etc/vimrc
        ;;
    *):
        echo "I don't know the OS is what ghost"
        ;;
esac

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
