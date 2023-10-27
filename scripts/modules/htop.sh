#!/bin/bash

info() {
	echo -n "install htop"
}

run() {
    sudo apt install -qy htop

    linker $1 "$dotfiles_directory/htop" "$HOME/.config/htop"
}
