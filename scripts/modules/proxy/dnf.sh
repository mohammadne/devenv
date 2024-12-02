#!/bin/bash

info() {
	echo -n "setup dnf proxy environment in systemd config"
}

run() {
    local dnf_config_file="/etc/dnf/dnf.conf"

    if grep -q "^proxy=" "$dnf_config_file"; then
        print_warning $1 "Proxy line already exists in the file. Skipping..."
    else
        sudo echo "proxy=http://127.0.0.1:10808" >> "$dnf_config_file"
    fi
}
