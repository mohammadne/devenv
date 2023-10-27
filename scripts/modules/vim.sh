#!/bin/bash

info() {
	echo -n "install VIM and relevant plugins"
}

run() {
    sudo apt install -qy vim curl

    linker $1 "$dotfiles_directory/vim/vimrc" "$HOME/.vimrc"

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qa || echo "Something went wrong installing vim plugins."
}
