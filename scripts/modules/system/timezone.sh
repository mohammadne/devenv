#!/bin/bash

function info() {
    echo -n "configure system to use Iran timezone"
}

function run() {
    local TZ=Iran
    sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
    sudo echo $TZ > /etc/timezone
}
