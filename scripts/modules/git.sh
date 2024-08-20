#!/bin/bash

info() {
  echo -n "install git"
}

run() {
  linker $1 "$dotfiles_directory/git" "$HOME/.config/git"
  
  # allow storing username/password securely and avoid typing password for https mode
  sudo dnf install -qy git-credential-libsecret
  git config --global credential.helper /usr/libexec/git-core/git-credential-libsecret
}
