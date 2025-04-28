#!/bin/bash

info() {
  echo -n "install Datagrip"
}

run() {
  local applications_path="$HOME/Applications"
  local version="2024.3.5"
  local datagrip_url="https://download-cdn.jetbrains.com/datagrip/datagrip-${version}.tar.gz"
  
  if ! result=$(download_file $1 $datagrip_url); then echo "$result" && return 1; fi
  tar -C $applications_path -xzf $result && mv DataGrip-${version} DataGrip && rm -rf "$result"

  local ja_netfilter_url="https://dl4.soft98.ir/programing/ja-netfilter-202x.zip"

  if ! result=$(download_file $1 $ja_netfilter_url); then echo "$result" && return 1; fi
  unzip -d $applications_path $result && rm -rf "$result"

# TODO: add following into $applications_path/Datagrip/bin/datagrip64.vmoptions
#   -javaagent:$applications_path/ja-netfilter/ja-netfilter.jar=jetbrains
# --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
# --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED
}
