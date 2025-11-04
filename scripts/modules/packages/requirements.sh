#!/bin/bash

function info() {
    echo -n "install required packages for having a working system"
}

function run() {
    local packages=(
        git
        ca-certificates
        wget
        curl
        gcc cmake
        unzip
    )
    
    if command -v sudo &> /dev/null; then
        sudo dnf install -qy "${packages[@]}"
        sudo dnf groupinstall -qy "Development Tools"
        return
    fi
    
    print_warning $1 "sudo has been missed, trying to install it"
    dnf install -qy "sudo" "${packages[@]}"
    dnf groupinstall -qy "Development Tools"
    
    # add rpm-fusion free repository
    # sudo dnf install \
    #   https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-41.noarch.rpm \
    #   https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-41.noarch.rpm
    
    # deeplearning.ai streaming issue
    # sudo dnf swap ffmpeg-free ffmpeg --allowerasing
    # sudo dnf install ffmpeg gstreamer1-plugins-ugly gstreamer1-libav --allowerasing
}
