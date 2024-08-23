#!/bin/bash

info() {
  echo -n "install gopass"
}

run() {
  # check go is installed
  # check age is not installed (with specified version)
  
  local version="v1.15.13"
  go install github.com/gopasspw/gopass@$version
  go install github.com/gopasspw/gopass-jsonapi@$version
  
  sudo dnf install -qy xclip
  
  # gopass clone --path $HOME/Workspace/personal/credentials git@github.com:mohammadne/credentials.git
  # gopass-jsonapi configure --browser firefox
}
