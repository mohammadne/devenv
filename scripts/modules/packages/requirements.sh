#!/bin/bash

function info() {
    echo -n "install required packages for having a working system"
}

function run() {
    local packages=(
        git
        ca-certificates
        openssh-client
        tzdata # timezone
    )
    
    if command -v sudo &> /dev/null; then
        sudo dnf install -qy "${packages[@]}"
        return
    fi
    
    print_warning $1 "sudo has been missed, trying to install it"
    dnf install -qy "sudo" "${packages[@]}"
}
