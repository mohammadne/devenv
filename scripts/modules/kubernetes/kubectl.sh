#!/bin/bash

info() {
	echo -n "install kubectl client binary"
}

run() {
    local latest_version=$(curl -L -s https://dl.k8s.io/release/stable.txt)
    local url="https://dl.k8s.io/release/$latest_version/bin/linux/amd64/kubectl"
    curl -LO --output-dir /tmp $url
    sudo mv /tmp/kubectl /usr/local/bin && chmod +x /usr/local/bin/kubectl
}
