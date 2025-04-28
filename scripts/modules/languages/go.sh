#!/bin/bash

info() {
  echo -n "install and config Go language"
}

run() {
  sudo dnf install -qy gcc

  local go_root="/usr/local/go"
  
  _install_go $1 $go_root
  _config_go $1 $go_root
  _install_go_dependencies $1 $go_root
}

_install_go() {
  # we have to set http_proxy env before downloading the go binary

  local version="1.24.2"
  local url="https://go.dev/dl/go${version}.linux-amd64.tar.gz"
  
  if check_versioned_binary $1 "$2/bin/go" $version "version"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo rm -rf $2 && sudo tar -C $(dirname $2) -xzf $result && rm -rf "$result"
}

_config_go() {
  local go_binary="$2/bin/go"
  
  print_message $1 "set go environments"
  $go_binary env -w GOPATH="$HOME/.go"
  $go_binary env -w GOPROXY="https://goproxy.cn,direct"
  $go_binary env -w GONOSUMDB="gitlab.tasn.ir"
  $go_binary env -w GOPRIVATE="gitlab.tasn.ir"
  $go_binary env -w CGO_ENABLED="1"
}

_install_go_dependencies() {
  local go_binary="$2/bin/go"
  
  print_message $1 "install required go dependencies"
  $go_binary install golang.org/x/tools/gopls@latest # Language server from google
  $go_binary install github.com/cweill/gotests/gotests@v1.6.0 # Generate unit tests
  $go_binary install github.com/fatih/gomodifytags@v1.17.0 # Modify tags on structs
  $go_binary install github.com/josharian/impl@v1.4.0 # Stubs for interfaces
  $go_binary install github.com/haya14busa/goplay # The Go playground
  $go_binary install github.com/go-delve/delve/cmd/dlv@latest # Go debugger (Delve)
  $go_binary install honnef.co/go/tools/cmd/staticcheck@latest # Linter
  
  print_message $1 "install useful go dependencies"
  # $go_binary install github.com/mikefarah/yq/v4@latest
  # $go_binary install github.com/haya14busa/goplay/cmd/goplay@v1.0.0 # The Go playground
  # $go_binary install honnef.co/go/tools/cmd/staticcheck@latest
  # $go_binary install mvdan.cc/gofumpt
  # $go_binary install golang.org/x/tools/cmd/goimports
  # $go_binary install golang.org/dl/gotip
  # $go_binary install github.com/onsi/ginkgo/v2/ginkgo@v2.11.0
  # $go_binary install github.com/charmbracelet/glow@latest # render markdown
}
