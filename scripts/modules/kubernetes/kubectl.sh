#!/bin/bash

info() {
	echo -n "install kubectl client binary"
}

run() {
    local binary_path="/usr/local/bin/kubectl"
    local version=$(curl -L -s https://dl.k8s.io/release/stable.txt)
    local url="https://dl.k8s.io/release/$version/bin/linux/amd64/kubectl"

    download_versioned_file $1 $binary_path $version "version --client" $url false

    # TODO: install plugins (kubectl-neat, kubectl-ns)
}
