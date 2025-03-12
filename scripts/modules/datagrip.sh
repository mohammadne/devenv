#!/bin/bash

info() {
  echo -n "install Datagrip"
}

run() {
  local applications_path="$HOME/Applications"
  local version="2024.3.5"
  local url="https://download-cdn.jetbrains.com/datagrip/datagrip-${version}.tar.gz"
  
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo tar -C $applications_path -xzf $result && mv DataGrip-${version} DataGrip && rm -rf "$result"
}
