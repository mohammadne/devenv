#!/bin/bash

info() {
	echo -n "install Alacritty terminal"
}

# TODO: install it via rust
run() {
    sudo dnf install -qy alacritty

    linker $1 "$dotfiles_directory/alacritty/config.yml" "$HOME/.config/alacritty.yml"
}
