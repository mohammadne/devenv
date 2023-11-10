#!/bin/bash

if [ -f "/etc/timezone" ]; then
    local TZ=Iran
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
    echo $TZ > /etc/timezone
fi
