#!/bin/bash

info() {
	echo -n "install kubectl client binary"
}

run() {
    local destination="/usr/local/bin"

    if [ -f "$destination/kubectl" ]; then
        print_warning $1 "kubectl is already exists"
        return
    fi

    local latest_version=$(curl -L -s https://dl.k8s.io/release/stable.txt)
    curl_if_not_exists "https://dl.k8s.io/release/$latest_version/bin/linux/amd64/kubectl" "/tmp" -LO
    sudo mv /tmp/kubectl "$destination" && chmod +x "$destination/kubectl"

    # TODO: install plugins (kubectl-neat, kubectl-ns)
}
