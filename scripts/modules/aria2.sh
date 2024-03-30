#!/bin/bash

info() {
  echo -n "install aria2 download manager"
}

run() {
  sudo dnf install aria2 -qy
  linker $1 "$dotfiles_directory/aria2" "$HOME/.aria2"
}
