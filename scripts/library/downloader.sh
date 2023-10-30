#!/bin/bash

# parameter 1: url - string
# parameter 2: destination directory - string
# parameter 3: clone options
function clone_if_not_exists() {
    if [ -d "$2" ] ; then
        return
    fi

    git clone "$1" "$2" "${@:3}" -q
}

# parameter 1: url - string
# parameter 2: destination directory - string
# parameter 3: clone options
function curl_if_not_exists() {
    if [ -d "$2" ] ; then
        return
    fi

    curl "$1" -o "$2" "${@:3}" # --silent
}

# parameter 1: module - string
# parameter 2: binary path - string
# parameter 3: version - string
# parameter 4: version check command - string
# parameter 5: url - string
# parameter 6: is tar file - bool
function download_versioned_file() {
    local module="${1##*/}"
    local binary_path="$2"
    local version="$3"
    local version_check_command="$4"
    local url="$5"
    local is_tar_file="$6"

	if [ -f "$binary_path" ]; then
		if echo $($binary_path $version_check_command) | grep -q $version; then
			print_success $module "module with version $version is already installed"
			return
		else
			print_warning $module "uninstalling old version of module"
			sudo rm -rf $binary_path
		fi
	fi

    local download_path="/tmp/${module,,}_${version}"
    curl "$url" -o "$download_path" -SL

    if [ "$is_tar_file" = true ] || [ "$is_tar_file" = 1 ]; then
        sudo tar -C $(dirname $binary_path) -xzf $download_path
    else
        chmod +x "$download_path" && sudo mv $download_path $binary_path
    fi

    rm -rf $download_path
}
