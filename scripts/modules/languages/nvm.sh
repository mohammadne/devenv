#!/bin/bash

info() {
  echo -n "install nodejs and its dependencies"
}

run() {
  sudo dnf install nodejs -yq
}
