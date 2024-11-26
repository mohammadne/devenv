#!/bin/bash

# parameter 1: module - string
# parameter 2: source path - string
# parameter 3: destination path - string
function copier() {
  local module=$1
  local src_path=$2
  local dst_path=$3
  
  # Check if the path does not exist
  if [ ! -e "$src_path" ]; then
    print_error $module "file or directory ($src_path) not exists to be copied"
    exit 1
  fi
  
  # create parent directory if missing
  mkdir -p "$(dirname "$dst_path")"
  
  # Check if the destination already exists
  if [ -e "$dst_path" ]; then
    if [ $backup = true ]; then
      print_warning $module "backup from pre-exsisting dst_path file (directory)"
      random_tail=$(tr -dc 'a-z0-9' </dev/urandom | head -c 5)
      cp -Rf $dst_path "$dst_path.backup-$random_tail" 2> /dev/null
    fi
    
    print_warning $module "remove pre-exsisting dst_path file (directory)"
    rm -Rf "$dst_path"
  fi

  cp -R "$src_path" "$dst_path"
}
