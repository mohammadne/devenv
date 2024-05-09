#!/bin/bash

info() {
  echo -n "install vagrant for having VMs locally"
}

run() {
  local binary_path="/usr/local/bin/vagrant"
  local version="2.4.1"
  local url="https://releases.hashicorp.com/vagrant/{$version}/vagrant_{$version}_linux_amd64.zip"
  
  if check_versioned_binary $1 $binary_path $version "--version"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo unzip -d $(dirname $binary_path) $result && rm -rf "$result"
  
  sudo dnf install libxcrypt libxcrypt-compat -yq
}
