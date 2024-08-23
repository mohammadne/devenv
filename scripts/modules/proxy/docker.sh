#!/bin/bash

info() {
  echo -n "setup dockerd proxy environment in systemd config"
}

# https://www.arvancloud.ir/fa/dev/docker
run() {
  mkdir -p /etc/systemd/system/docker.service.d
  sudo bash -c 'cat <<EOF > /etc/systemd/system/docker.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:10808"
Environment="HTTPS_PROXY=http://127.0.0.1:10808"
EOF'
  
  sudo systemctl daemon-reload
  sudo systemctl restart docker
}
