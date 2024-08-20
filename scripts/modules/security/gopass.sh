#!/bin/bash

info() {
  echo -n "install gopass"
}

run() {
  # check go is installed
  # check age is not installed (with specified version)
  
  local version="v1.15.14"
  go install github.com/gopasspw/gopass@$version
  
  sudo dnf install -qy xclip
  
  local jsonapi_version="v1.15.13"
  go install github.com/gopasspw/gopass-jsonapi@$jsonapi_version
  gopass-jsonapi configure --browser firefox
}
