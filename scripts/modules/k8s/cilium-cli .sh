#!/bin/bash

info() {
  echo -n "install cilium-cli to manage cilium in your cluster"
}

run() {
  local binary_path="/usr/local/bin/cilium"
  local version="v0.16.7"
  local url="https://github.com/cilium/cilium-cli/releases/download/${version}/cilium-linux-amd64.tar.gz"
  
  if check_versioned_binary $1 $binary_path $version "-v"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo tar -C $(dirname $binary_path) -xzf $result "cilium" && rm -rf "$result"
}
