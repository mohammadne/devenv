#!/bin/bash

function _check_timezne() {
    local TZ=Iran
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
    echo $TZ > /etc/timezone
}
_check_timezne()
