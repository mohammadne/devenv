#!/bin/bash

info() {
	echo -n "install kind for having local k8s cluster"
}

run() {
    local binary_path="/usr/local/bin/kind"
    local version="v0.20.0"
    local url="https://kind.sigs.k8s.io/dl/$version/kind-linux-amd64"

    download_versioned_file $1 $binary_path $version "version" $url false
}
