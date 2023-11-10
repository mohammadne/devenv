#!/bin/bash

# install packages non-interactively
export DEBIAN_FRONTEND=noninteractive

function _check_timezne() {
    local TZ=Iran
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
    echo $TZ > /etc/timezone
}
_check_timezne()
