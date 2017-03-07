#!/bin/bash

if test $UID -ne 0; then
    echo "Sorry, I need root, piggy !!!"
    exit 1
fi

source /etc/os-release

process_on_ubuntu()
{
    packages="vim python-flake8"

    for pkg in $packages; do
        apt install -y $pkg
        if test $? -ne 0; then
            echo "Install $pkg fail"
            exit 1
        fi
    done

    /bin/cp -f ./vimrc /etc/vim/vimrc
}

process_on_centos()
{
    packages="vim python-flake8"

    for pkg in $packages; do
        yum install -y $pkg
        if test $? -ne 0; then
            echo "Install $pkg fail"
            exit 1
        fi
    done

    /usr/bin/cp -f ./vimrc /etc/vimrc
}

case $ID in
    'ubuntu'):
        process_on_ubuntu
        ;;
    'centos'):
        process_on_centos
        ;;
    *):
        echo "I don't know the OS is what ghost"
        exit 1
        ;;
esac

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
