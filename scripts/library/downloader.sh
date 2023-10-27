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

    curl "$1" -o "$2" "${@:3}" --silent
}
