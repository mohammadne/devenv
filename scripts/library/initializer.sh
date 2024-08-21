#!/bin/bash

# parameter 1: module - string
# parameter 2: initializing - boolean
function start_initializing() {
  if [ "$2" -eq 0 ]; then
    return
  fi
  
  ssh-keygen -t ed25519 -f $HOME/.ssh/id_ed25519 -N "" -C "" > /dev/null
  print_message $1 $(cat $HOME/.ssh/id_ed25519.pub)
  print_message $1 "Copy and add the above ssh-key to your github account. Press Enter to continue..."
  read
}
