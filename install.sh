#!/bin/bash

# refer https://github.com/wklken/k-vim/blob/master/install.sh
BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

echo "Start to EQUIP your VIM with Vundle!"

echo "Step 1: Back Up Your Current Vim Config"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -L $i ] && unlink $i ; done

echo "Step 2: Setting Up Symlinks"
lnif $CURRENT_DIR/vimrc $HOME/.vimrc
lnif $CURRENT_DIR/vimrc.bundles $HOME/.vimrc.bundles
lnif "$CURRENT_DIR" "$HOME/.vim"

echo "Step 3: Install/Upgrade Vundle (Genius Creation)"
if [ ! -e $CURRENT_DIR/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git $CURRENT_DIR/bundle/vundle
else
    cd "$HOME/.vim/bundle/vundle" && git pull origin master
fi

echo "Step 4: Install/Clean Plugins using Vundle"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $HOME/.vimrc.bundles +BundleInstall! +BundleClean +qall
export SHELL=$system_shell

echo "Step 5: Compile YouCompleteMe (The Most Powerful Auto-Complete Plugin Ever)"
echo "This takes quite a long time, be patient!"
echo "cd $CURRENT_DIR/bundle/YouCompleteMe/ && bash -x install.sh --clang-completer"
cd $CURRENT_DIR/bundle/YouCompleteMe/
bash -x install.sh --clang-completer

echo "EQUIP Done, have FUN!"
