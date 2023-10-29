#!/bin/bash

info() {
	echo -n "install docker client binary"
}

run() {
    local version="docker-17.06.2-ce"
    local architecture=$(system_architecture)
    local destination="/tmp/$version.tgz"

    curl_if_not_exists "https://download.docker.com/linux/static/stable/$architecture/$version.tgz" "$destination" -sSL -O
    cd /tmp && tar zxf "$destination"
    sudo mv "/tmp/docker/docker" "/usr/local/bin"
    sudo chmod +x /usr/local/bin/docker
    rm -rf "$destination" "/tmp/docker"
}
