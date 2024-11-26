#!/bin/bash

info() {
  echo -n "install git"
}

run() {
  linker $1 "$dotfiles_directory/git" "$HOME/.config/git"
}
