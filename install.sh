#!/bin/bash

wdir=$(pwd)
cd ~
echo "Start to EQUIP your VIM with Vundle!"

if [[ -e .vimrc || -e .vim ]]; then
    dt=$(date +%Y%m%d)
    echo "Vim config already exists, do you want to continue(yes/no)?"
    read cont
    if [[ $cont != "yes" && $cont != "y" ]]; then
        echo "Goodbye, See you!"
        exit 0
    fi
    echo "Backup your existing vim config to vimbackup-$dt.tar.bz2"
    mkdir vimbackup-$dt
    [[ -e .vimrc ]] && mv .vimrc vimbackup-$dt/vimrc
    [[ -e .vim ]] && mv .vim vimbackup-$dt/vim
    tar cjf vimbackup-$dt.tar.bz2 vimbackup-$dt
    rm -rf vimbackup-$dt
fi

cp $wdir/vimrc .vimrc
mkdir -p .vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

echo "EQUIT Done, have FUN!"
