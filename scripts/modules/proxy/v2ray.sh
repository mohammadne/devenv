#!/bin/bash

info() {
  echo -n "install v2ray-core client to proxy your network traffic"
}

# https://gist.github.com/mahmoud-eskandari/960899f3494a1bffa1a29631dbaf0aee#file-install-bridge-sh-L36

run() {
  local binary_path="/usr/local/v2ray/v2ray"
  local version="v5.14.1"
  local url="https://github.com/v2fly/v2ray-core/releases/download/${version}/v2ray-linux-64.zip"
  
  if check_versioned_binary $1 $binary_path $version "version"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo unzip -d $(dirname $binary_path) $result && rm -rf "$result"
  
  ## create log files
  sudo mkdir -p /var/log/v2ray
  sudo chmod -R 777 /var/log/v2ray/
  
    sudo bash -c 'cat <<EOF > /etc/systemd/system/v2ray.service
[Unit]
Description=V2Ray Service
Documentation=https://www.v2fly.org/
After=network.target nss-lookup.target

[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/v2ray/v2ray run
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
EOF'
  
  sudo systemctl daemon-reload
  sudo systemctl enable v2ray
  sudo systemctl restart v2ray
}
