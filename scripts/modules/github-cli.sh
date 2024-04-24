#!/bin/bash

info() {
  echo -n "install GitHub's official command line tool "
}

run() {
  local binary_path="/usr/local/bin/gh"
  local version="2.47.0"
  local url="https://github.com/cli/cli/releases/download/v${version}/gh_${version}_linux_amd64.tar.gz"
  
  if check_versioned_binary $1 $binary_path $version "--version"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo tar -C $(dirname $binary_path) -xzf $result --strip-components=2 "gh_${version}_linux_amd64/bin/gh" && rm -rf "$result"
}
