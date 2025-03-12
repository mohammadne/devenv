#!/bin/bash

info() {
  echo -n "install Postman"
}

run() {
  sudo dnf install openssl -yq

  local applications_path="$HOME/Applications"
  local url="https://dl.pstmn.io/download/latest/linux_64"

  if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  tar -C $applications_path -xzf $result && rm -rf "$result"

  local desktop_entry_file="$HOME/.local/share/applications/postman.desktop"
  if [ ! -f "$desktop_entry_file" ]; then
    cat <<EOF > "$desktop_entry_file"
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=$applications_path/Postman/Postman
Icon=$applications_path/Postman/app/icons/icon_128x128.png
Terminal=false
Type=Application
Categories=Development;
EOF
  fi
}
