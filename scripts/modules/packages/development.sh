#!/bin/bash

info() {
  echo -n "install packages required for development"
}

run() {
  local packages=(
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm
    
    # ------------------------------------------------ editors
    
    bat # cat alternative
    exa # modern replacement for ls
    clipman # clipboard
    jq # json files utilities
    fzf # fuzzy finder
    
    # ------------------------------------------------ system
    
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
    tcpdump # dump traffic on a network
    conntrack # track the connections
    
    # ------------------------------------------------ Multimedia
    
    gstreamer1-plugin-openh264
    mozilla-openh264
    ffmpeg
    
    # ------------------------------------------------ miscellaneous
    
    man-db # manual page managment
    libssl-dev
    ansible
    # firefox
    # vscode
    # wireshark
    obs-studio # Open Broadcaster Software
    # packet-tracer
    # postman
    tshark wireshark # dump traffic on a network
  )
  
  sudo dnf config-manager --set-enabled fedora-cisco-openh264
  
  sudo dnf install -qy "${packages[@]}"
}
