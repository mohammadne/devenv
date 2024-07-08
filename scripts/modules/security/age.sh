#!/bin/bash

info() {
  echo -n "install age"
}

run() {
  # check go is installed
  # check age is not installed (with specified version)
  
  go install filippo.io/age/cmd/...@v1.1.1
}

_install_go() {
  local version="1.22.1"
  local url="https://go.dev/dl/go${version}.linux-amd64.tar.gz"
  
  if check_versioned_binary $1 "$2/bin/go" $version "version"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo rm -rf $2 && sudo tar -C $(dirname $2) -xzf $result && rm -rf "$result"
}


