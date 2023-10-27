#!/bin/bash

info() {
	echo -n "install VIM and relevant plugins"
}

run() {
    sudo apt install -qy vim curl

    linker $1 "$dotfiles_directory/vim/vimrc" "$HOME/.vimrc"

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim -E +'PlugInstall --sync' +qall > /dev/null || print_error $1 "Something went wrong installing vim plugins."
}
