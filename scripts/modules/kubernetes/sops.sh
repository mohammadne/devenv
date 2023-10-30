#!/bin/bash

info() {
	echo -n "install sops"
}

run() {
    local binary_path="/usr/local/bin/sops"
    local version="3.7.3"
    local url="https://github.com/mozilla/sops/releases/download/v${version}/sops-v${version}.linux"

    if check_versioned_binary $1 $binary_path $version "--version"; then return; fi
    if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
    chmod +x "$result" && sudo mv $result $binary_path
}
