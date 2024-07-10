#!/bin/bash

info() {
  echo -n "install k6 loadtester"
}

run() {
  local binary_path="/usr/local/bin/k6"
  local version="v0.52.0"
  local url="https://github.com/grafana/k6/releases/download/${version}/k6-${version}-linux-amd64.tar.gz"
  
  if check_versioned_binary $1 $binary_path $version "-v"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo tar -C $(dirname $binary_path) -xzf $result --strip-components=1 && rm -rf "$result"
}
