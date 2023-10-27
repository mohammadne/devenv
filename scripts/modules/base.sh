#!/bin/bash

info() {
	echo -n "install base packages"
}



run() {
    local packages=(
        git

        # ------------------------------------------------ editors

        bat # cat alternative
        exa # modern replacement for ls
        clipman # clipboard
        jq yq jless
        yamllint # linter for YAML files 
        glow # render markdown
        fzf # fuzzy finder 

        # ------------------------------------------------ system

        htop # process viewer
        dua-cli # Disk Usage Analyzer
        cpupower # processor power managment
        reflector # retrieve the latest mirror list from the Arch
        usbutils # USB utilities

        # ------------------------------------------------ networking

        curl # network data transfer utility
        mtr inetutils websocat fuse2
        aria2 # download manager
        bandwhich # bandwidth utilization tool
        speedtest-cli # speedtest cli
        openbsd-netcat
        telnet
        tcpdump
        ss
        tshark
        wireshark

        # ------------------------------------------------ utilities

        fd # new find
        jwt-cli # work with JSON Web Tokens
        tokei # statistics about your code
        pastel # generate, analyze, convert and manipulate colors
        man-pages man-db # manual page managment
    )
    
    message "base" "Installs base packages for having a working system"

	message "installing ${packages[*]}"
	require_dnf "${packages[@]}"
}
