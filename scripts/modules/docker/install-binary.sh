#!/bin/bash

info() {
	echo -n "install docker client binary"
}

# TODO: implement with download_versioned_file
run() {
    local version="docker-24.0.4"
    local architecture=$(system_architecture)
    local destination="/tmp/$version.tgz"

    curl_if_not_exists "https://download.docker.com/linux/static/stable/$architecture/$version.tgz" "$destination" -SL
    cd /tmp && tar zxf "$destination"
    sudo mv "/tmp/docker/docker" "/usr/local/bin"
    sudo chmod +x /usr/local/bin/docker
    rm -rf "$destination" "/tmp/docker"
}
