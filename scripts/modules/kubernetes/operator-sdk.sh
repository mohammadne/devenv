#!/bin/bash

info() {
  echo -n "install operator-sdk as a k8s conrtoller framework"
}

run() {
  local binary_path="/usr/local/bin/operator-sdk"
  local version="v1.34.1"
  local url="https://github.com/operator-framework/operator-sdk/releases/download/${version}/operator-sdk_linux_amd64"
  
  if check_versioned_binary $1 $binary_path $version "version"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  chmod +x "$result" && sudo mv $result $binary_path
}
