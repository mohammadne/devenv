#!/bin/bash

info() {
  echo -n "install xray-core (v2ray alternative) client to proxy your network traffic"
}

# https://gist.github.com/mahmoud-eskandari/960899f3494a1bffa1a29631dbaf0aee#file-install-bridge-sh-L36

run() {
  # podman is required for the installation

  destination="$HOME/.config/xray"

  copier $1 "$dotfiles_directory/xray/" "$destination"

  # sudo systemctl enable podman-restart.service

  _pull_alpine $1 "$destination"
  
  export $(gopass show proxy/xray | sed 's/: /=/g')

  _replace_notls_credentials $1 "$destination/notls-config.json"
  _replace_reality_credentials $1 "$destination/reality-config.json"

  podman build -t "xray" "$destination" -f "$destination/Dockerfile"

  podman run --restart=always -d --name "xray-notls" -p $notls_local_port:$notls_local_port -v "./notls.json:/usr/local/xray/config.json:z" "xray" run -c config.json
  podman run --restart=always -d --name "xray-reality" -p $reality_local_port:$reality_local_port -v "./reality.json:/usr/local/xray/config.json:z" "xray" run -c config.json
}

_pull_alpine() {
  alpine_image="alpine:$(cat $2/Dockerfile| grep alpine | awk -F':' '{print $2}')"
  podman pull "docker.arvancloud.ir/$alpine_image" &&
    podman image tag "docker.arvancloud.ir/$alpine_image" "$alpine_image" &&
    podman image rm "docker.arvancloud.ir/$alpine_image" 
}

_replace_notls_credentials() {
  sed -i "s/{{local_port}}/${notls_local_port}/g" "$2"
  sed -i "s/{{remote_host}}/${notls_remote_host}/g" "$2"
  sed -i "s/{{remote_port}}/${notls_remote_port}/g" "$2"
  sed -i "s/{{user_id}}/${notls_user_id}/g" "$2"
}

_replace_reality_credentials() {
  sed -i "s/{{local_port}}/${reality_local_port}/g" "$2"
  sed -i "s/{{remote_host}}/${reality_remote_host}/g" "$2"
  sed -i "s/{{remote_port}}/${reality_remote_port}/g" "$2"
  sed -i "s/{{user_id}}/${reality_user_id}/g" "$2"
  sed -i "s/{{public_key}}/${reality_public_key}/g" "$2"
}
