#!/bin/bash

info() {
  echo -n "install DbVisulizer"
}

run() {
  # https://www.dbvis.com/product_download/dbvis-24.2.1/media/dbvis_linux_24_2_1.rpm
  # sudo rpm -i dbvis_linux_24_2_1.rpm
  
  
  
  # local binary_path="$HOME/Programs/dbvisulizer"
  # local version="3.17.0"
  # local url="https://github.com/Praqma/helmsman/releases/download/v${version}/helmsman_${version}_linux_amd64.tar.gz"
  
  # if check_versioned_binary $1 $binary_path $version "-v"; then return; fi
  # if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
  # sudo tar -C $(dirname $binary_path) -xzf $result "helmsman" && rm -rf "$result"
}
