#!/bin/bash

info() {
	echo -n "install sops"
}

run() {
    local binary_path="/usr/local/bin/sops"
    local version="v3.7.3"
    local url="https://github.com/mozilla/sops/releases/download/${version}/sops-${version}.linux"

    download_versioned_file $1 $binary_path $version "--version" $url false
}
