#!/bin/bash

# install packages non-interactively
export DEBIAN_FRONTEND=noninteractive

# configure system timezone
function _configure_timezone() {
    local TZ=Iran
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
    echo $TZ > /etc/timezone
}
_configure_timezone

# install base packages for having a working system
function _base_packages() {
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
_base_packages
