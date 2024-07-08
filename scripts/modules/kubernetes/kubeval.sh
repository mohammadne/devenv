#!/bin/bash

info() {
  echo -n "install helm as a k8s package manager solution"
}

run() {
  local binary_path="/usr/local/bin/kubeval"
  local version="v0.16.1"
  local url="https://github.com/instrumenta/kubeval/releases/download/$version/kubeval-darwin-amd64.tar.gz"
  
  if check_versioned_binary $1 $binary_path $version "version"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo tar -C $(dirname $binary_path) -xzf $result "kubeval" && rm -rf "$result"
}
