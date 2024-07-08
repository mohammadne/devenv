#!/bin/bash

info() {
  echo -n "install xray-core (v2ray alternative) client to proxy your network traffic"
}

# https://gist.github.com/mahmoud-eskandari/960899f3494a1bffa1a29631dbaf0aee#file-install-bridge-sh-L36

run() {
  local binary_path="/usr/local/xray/xray"
  local version="v1.8.10"
  local url="https://github.com/XTLS/Xray-core/releases/download/${version}/Xray-linux-64.zip"
  
  if check_versioned_binary $1 $binary_path $version "version"; then return; fi
  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  sudo unzip -d $(dirname $binary_path) $result && rm -rf "$result"
  
  ## create log files
  sudo mkdir -p /var/log/xray
  sudo chmod -R 777 /var/log/xray/
  
    sudo bash -c 'cat <<EOF > /etc/systemd/system/xray.service
[Unit]
Description=Xray Service
Documentation=https://www.v2fly.org/
After=network.target nss-lookup.target

[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/xray/xray run -c /usr/local/xray/config.json
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
EOF'
  
  sudo systemctl daemon-reload
  sudo systemctl enable xray
  sudo systemctl restart xray
}
