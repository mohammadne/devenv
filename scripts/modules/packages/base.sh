#!/bin/bash

info() {
    echo -n "install base packages for having a working system"
}

run() {
    local packages=(
        git
        ca-certificates
        openssh-client
        build-essential
        tzdata # timezone
    )
    
    if command -v sudo &> /dev/null; then
        sudo apt update && sudo apt install -qy "${packages[@]}"
        return
    fi
    
    print_warning $1 "sudo has been missed, trying to install it"
    apt update && apt install -qy "sudo" "${packages[@]}"
}
