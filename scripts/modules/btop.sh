#!/bin/bash

info() {
    echo -n "install btop"
}

run() {
    sudo dnf install -qy btop
    
    linker $1 "$dotfiles_directory/btop" "$HOME/.config/btop"
}
