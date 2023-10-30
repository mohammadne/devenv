#!/bin/bash

info() {
	echo -n "install telepresence client"
}

run() {
    local binary_path="/usr/local/bin/telepresence"
    local version="v2.15.1"
    local url="https://app.getambassador.io/download/tel2oss/releases/download/$version/telepresence-linux-amd64"

    download_versioned_file $1 $binary_path $version "version" $url false
}
