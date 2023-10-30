#!/bin/bash

info() {
	echo -n "install docker client binary"
}

# TODO: implement with download_versioned_file
run() {
    # local version="docker-24.0.4"
    # local architecture=$(system_architecture)
    # local destination="/tmp/$version.tgz"

    # curl_if_not_exists "https://download.docker.com/linux/static/stable/$architecture/$version.tgz" "$destination" -SL
    # cd /tmp && tar zxf "$destination"
    # sudo mv "/tmp/docker/docker" "/usr/local/bin"
    local binary_path="/usr/local/bin/docker"
    local version="24.0.4"
    local url="https://download.docker.com/linux/static/stable/$architecture/docker-$version.tgz"

    if check_versioned_binary $1 $binary_path $version "version"; then return; fi
    if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
    sudo tar -C $(dirname $binary_path) -xzf $result "docker"
    # sudo chmod +x /usr/local/bin/docker
    # rm -rf "$result"
}
