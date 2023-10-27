#!/bin/bash

info() {
	echo -n "install Alacritty terminal"
}

run() {
    sudo apt install -qy alacritty

    linker $1 "$dotfiles_directory/alacritty/config.yml" "$HOME/.config/alacritty.yml"
}
