#!/bin/bash

# install packages non-interactively
export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

function _configure_timezone() {
    local TZ=Iran
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
    echo $TZ > /etc/timezone
}
_configure_timezone()
