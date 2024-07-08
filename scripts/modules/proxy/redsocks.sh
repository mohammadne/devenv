#!/bin/bash

info() {
  echo -n "setup and install redsocks"
}

run() {
  sudo dnf install redsocks -y
  
  
  sudo bash -c 'cat <<EOF > /etc/redsocks.conf
base {
  log_debug = on;
  log_info = on;
  log = "file:/var/log/redsocks.log";

  daemon = on;

  redirector = iptables;
}

redsocks {
  local_ip = 0.0.0.0;
  local_port = 12345;

  ip = 127.0.0.1;
  port = 11809;

  type = http-connect;
}
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
