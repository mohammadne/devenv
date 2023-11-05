#!/bin/bash

info() {
	echo -n "install packages required for development"
}

run() {
    local packages=(
        # ------------------------------------------------ editors

        bat # cat alternative
        exa # modern replacement for ls
        clipman # clipboard
        jq # json files utilities
        fzf # fuzzy finder 

        # ------------------------------------------------ system

        htop # process viewer
        usbutils # USB utilities
        htop # A monitor of resources 

        # ------------------------------------------------ networking

        iproute2 # installs ip, ss (netstat replacement) and etc
        curl # network data transfer utility
        mtr # network diagnostic tool
        aria2 # download manager
        speedtest-cli # speedtest cli
        ncat # ncat from nmap (not Open-BSD)
        telnet # interactive communication with another host
        tcpdump tshark # dump traffic on a network

        # ------------------------------------------------ miscellaneous

        man-db # manual page managment
        libssl-dev
        ansible
    )

    sudo apt install -qy "${packages[@]}"
}
