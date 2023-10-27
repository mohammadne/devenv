#!/bin/bash

info() {
	echo -n "install git"
}

run() {
    sudo apt install -qy git

    linker $1 "$dotfiles_directory/git" "$HOME/.config/git"
}
