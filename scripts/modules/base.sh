#!/bin/bash

info() {
	echo -n "install base packages and tools for having a working system"
}

run() {
	if ! command -v sudo &> /dev/null; then
		print_warning $1 "sudo has been missed, trying to install it"
        if ! apt update && apt install -qy sudo; then
            print_error $1 "installing sudo has been failed"
            return 1
        fi
	fi

    local packages=(
        git
        ca-certificates
        openssh-client

        # ------------------------------------------------ editors

        bat # cat alternative
        exa # modern replacement for ls
        clipman # clipboard
        # jq jless # json files utilities
        # yq yamllint # YAML files utilities 
        # glow # render markdown
        fzf # fuzzy finder 

        # ------------------------------------------------ system

        htop # process viewer
        # cpupower # processor power managment
        usbutils # USB utilities

        # ------------------------------------------------ networking

        iproute2 # installs ip, ss (netstat replacement)
        curl # network data transfer utility
        mtr # network diagnostic tool
        aria2 # download manager
        speedtest-cli # speedtest cli
        nmap-ncat # ncat from nmap (not Open-BSD)
        telnet # interactive communication with another host
        tcpdump tshark wireshark # dump traffic on a network

        # ------------------------------------------------ utilities

        man-db # manual page managment
    )

    sudo apt install -qy "${packages[@]}"
}
