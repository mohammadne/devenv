#!/bin/bash

info() {
  echo -n "setup and install openconnect"
}

run() {
  sudo dnf install openconnect -y
  
  ## create openconnect configuration files
  sudo mkdir -p /etc/openconnect
  
  sudo bash -c 'cat <<EOF > /etc/openconnect/asansaz.conf
# VPN server URL
export openconnect_asansaz_server = https://server.com

# User credentials
export openconnect_asansaz_user = your-username
export openconnect_asansaz_password = your-password

# Additional options
export openconnect_asansaz_servercert = pin-sha256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
EOF'
  
  sudo bash -c 'cat <<EOF > /etc/systemd/system/openconnect-asansaz.service
[Unit]
Description=OpenConnect Asansaz VPN
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c 'source /etc/openconnect/asansaz.conf && echo ''"$openconnect_asansaz_password"'' | /usr/sbin/openconnect --passwd-on-stdin $openconnect_asansaz_server -u $openconnect_asansaz_user -b --servercert $openconnect_asansaz_servercert'
ExecReload=/bin/kill -HUP $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'
  
  sudo systemctl daemon-reload
  sudo systemctl enable openconnect-asansaz.service
  sudo systemctl restart openconnect-asansaz.service
}
