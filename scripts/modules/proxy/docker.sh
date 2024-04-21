#!/bin/bash

info() {
	echo -n "setup dockerd proxy environment in systemd config"
}

run() {
    sudo bash -c 'cat <<EOF > /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:10809"
Environment="HTTPS_PROXY=http://127.0.0.1:10809"
EOF'

    sudo systemctl daemon-reload
    sudo systemctl restart docker
}
