#!/bin/bash

info() {
	echo -n "install kubectl client binary"
}

run() {
    local binary_path="/usr/local/bin/kubectl"
    local version=$(curl -L -s https://dl.k8s.io/release/stable.txt)
    local url="https://dl.k8s.io/release/$version/bin/linux/amd64/kubectl"

    if check_versioned_binary $1 $binary_path $version "version --client"; then return; fi
    if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
    chmod +x "$result" && sudo mv $result $binary_path

    # TODO: install plugins (kubectl-neat, kubectl-ns)
}
