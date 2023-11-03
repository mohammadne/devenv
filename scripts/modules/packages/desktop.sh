#!/bin/bash

info() {
	echo -n "install packages on desktop client"
}

run() {
    local packages=(
        # firefox
        # vscode
        # wireshark
        obs-studio # Open Broadcaster Software
        # packet-tracer
        # postman
        wireshark # dump traffic on a network
    )

    sudo apt install -qy "${packages[@]}"
}
