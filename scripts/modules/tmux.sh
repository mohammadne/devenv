#!/bin/bash

info() {
  echo -n "install Tmux and relevant plugins"
}

run() {
  sudo dnf install -qy tmux
  # install tmuxp
  
  linker $1 "$dotfiles_directory/tmux" "$HOME/.config/tmux"
  
  # install tmux-plugin-manager
  tpm_path="$HOME/.local/share/tmux/plugins/tpm"
  clone_if_not_exists "https://github.com/tmux-plugins/tpm" "$tpm_path"
  "$tpm_path/bin/install_plugins"
}
