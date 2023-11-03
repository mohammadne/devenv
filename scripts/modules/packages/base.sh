#!/bin/bash

info() {
	echo -n "install base packages for having a working system"
}

run() {
	if ! command -v sudo &> /dev/null; then
		print_warning $1 "sudo has been missed, trying to install it"
        if ! apt update && apt install -qy sudo; then
            print_error $1 "installing sudo has been failed"
            return 1
        fi
        apt update -q # update cache of the package list
	fi

    local packages=(
        git
        ca-certificates
        openssh-client
        build-essential
    )

    sudo apt install -qy "${packages[@]}"
}
