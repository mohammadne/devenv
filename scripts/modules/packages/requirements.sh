#!/bin/bash

function info() {
  echo -n "install required packages for having a working system"
}

function run() {
  local packages=(
    # repositories
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm
    
    # packages
    git
    ca-certificates
    openssh
    wget
    curl
    gcc cmake
    unzip
    ffmpeg
  )
  
  if command -v sudo &> /dev/null; then
    sudo dnf install -qy "${packages[@]}"
    sudo dnf groupinstall -qy "Development Tools"
    return
  fi
  
  print_warning $1 "sudo has been missed, trying to install it"
  dnf install -qy "sudo" "${packages[@]}"
  dnf groupinstall -qy "Development Tools"
}
