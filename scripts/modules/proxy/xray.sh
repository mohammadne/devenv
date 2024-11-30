#!/bin/bash

info() {
  echo -n "install xray-core (v2ray alternative) client to proxy your network traffic"
}

# https://gist.github.com/mahmoud-eskandari/960899f3494a1bffa1a29631dbaf0aee#file-install-bridge-sh-L36

run() {
  # podman is required for the installation

  copier $1 "$dotfiles_directory/xray/" "$HOME/.config/xray"

  # sudo systemctl enable podman-restart.service

  # image="alpine:3.20.2" &&
  #   podman pull "docker.arvancloud.ir/$image" &&
  #   podman image tag "docker.arvancloud.ir/$image" "$image" &&
  #   podman image rm "docker.arvancloud.ir/$image"
  
  proxy_info=$(gopass show proxy/xray)
  _replace_notls_credentials $1 $proxy_info "$HOME/.config/xray/notls-config.json"
  _replace_reality_credentials $1 $proxy_info "$HOME/.config/xray/reality-config.json"


  podman build -t xray-notls "$directory" -f "$(dirname $directory)/Dockerfile"
  podman run --restart=always -d -p $notls_local_port:$notls_local_port xray-notls
  # todo: add appropriate command ./xray run -c notls-config.json
}

_replace_notls_credentials() {
  local directory="$HOME/.config/xray/notls"

  local notls_local_port=$( echo "$2" | grep 'notls_local_port: ' | awk -F ': ' '{print $2}' )
  local notls_remote_host=$( echo "$2" | grep 'notls_remote_host: ' | awk -F ': ' '{print $2}' )
  local notls_remote_port=$( echo "$2" | grep 'notls_remote_port: ' | awk -F ': ' '{print $2}' )
  local notls_user_id=$( echo "$2" | grep 'notls_user_id: ' | awk -F ': ' '{print $2}' )
  
  sed -i "s/{{local_port}}/${notls_local_port}/g" "$3"
  sed -i "s/{{remote_host}}/${notls_remote_host}/g" "$3"
  sed -i "s/{{remote_port}}/${notls_remote_port}/g" "$3"
  sed -i "s/{{user_id}}/${notls_user_id}/g" "$3"
}

_replace_reality_credentials() {
  local reality_local_port=$( echo "$2" | grep 'reality_local_port: ' | awk -F ': ' '{print $2}' )
  local reality_remote_host=$( echo "$2" | grep 'reality_remote_host: ' | awk -F ': ' '{print $2}' )
  local reality_remote_port=$( echo "$2" | grep 'reality_remote_port: ' | awk -F ': ' '{print $2}' )
  local reality_user_id=$( echo "$2" | grep 'reality_user_id: ' | awk -F ': ' '{print $2}' )
  local reality_public_key=$( echo "$2" | grep 'reality_public_key: ' | awk -F ': ' '{print $2}' )
  
  sed -i "s/{{local_port}}/${reality_local_port}/g" "$HOME/.config/xray/reality/config.json"
  sed -i "s/{{remote_host}}/${reality_remote_host}/g" "$HOME/.config/xray/reality/config.json"
  sed -i "s/{{remote_port}}/${reality_remote_port}/g" "$HOME/.config/xray/reality/config.json"
  sed -i "s/{{user_id}}/${reality_user_id}/g" "$HOME/.config/xray/reality/config.json"
  sed -i "s/{{public_key}}/${reality_public_key}/g" "$HOME/.config/xray/reality/config.json"
}
