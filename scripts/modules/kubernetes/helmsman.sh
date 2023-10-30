#!/bin/bash

info() {
	echo -n "install helmsman to manage your deployment"
}

run() {
    local binary_path="/usr/local/bin/helmsman"
    local version="3.16.1"
    local url="https://github.com/Praqma/helmsman/releases/download/v${version}/helmsman_${version}_linux_amd64.tar.gz"

    download_versioned_file $1 $binary_path $version "-v" $url true
    sudo rm -rf /usr/local/bin/LICENSE /usr/local/bin/README.md
}
