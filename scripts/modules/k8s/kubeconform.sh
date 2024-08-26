#!/bin/bash

info() {
  echo -n "install kubeconform as a k8s package manager solution"
}

run() {
  local binary_path="/usr/local/bin/kubeconform"
  local version="v0.6.6"
  local url="https://github.com/yannh/kubeconform/releases/download/$version/kubeconform-linux-amd64.tar.gz"
  
  if check_versioned_binary $1 $binary_path $version "version"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo tar -C $(dirname $binary_path) -xzf $result "kubeconform" && rm -rf "$result"
}
