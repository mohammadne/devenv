#!/bin/bash

info() {
  echo -n "install gopass"
}

run() {
  local version="1.15.15"
  _install_gopass $1 $version
  _install_gopass_jsonapi $1 $version

  linker $1 "$dotfiles_directory/gopass/config" "$HOME/.config/gopass/config"
  gopass-jsonapi configure --browser firefox
}

_install_gopass() {
  local binary_path="/usr/local/bin/gopass"
  local url="https://github.com/gopasspw/gopass/releases/download/v${version}/gopass-${version}-linux-amd64.tar.gz"
  
  if check_versioned_binary $1 $binary_path $2 "-v"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo tar -C $(dirname $binary_path) -xzf $result "gopass" && rm -rf "$result"
}

_install_gopass_jsonapi() {
  local binary_path="/usr/local/bin/gopass-jsonapi"
  local url="https://github.com/gopasspw/gopass-jsonapi/releases/download/v${version}/gopass-jsonapi-${version}-linux-amd64.tar.gz"
  
  if check_versioned_binary $1 $binary_path $2 "-v"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo tar -C $(dirname $binary_path) -xzf $result "gopass-jsonapi" && rm -rf "$result"
}
