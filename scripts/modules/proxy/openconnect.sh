#!/bin/bash

info() {
  echo -n "setup and install openconnect"
}

run() {
  sudo dnf install openconnect -y
}
