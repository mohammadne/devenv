#!/bin/bash

info() {
  echo -n "install python3 and its dependencies"
}

run() {
  sudo dnf install python3 python3-pip -yq # install pip package manager
  pip3 install --upgrade pip # update user-local version of pip
  
  pip3 install flask
  
  #   local packages=(flake8 pep8-naming pipenv poetry hatch pdm black)
  #   for package in "${packages[@]}"; do
  #     if python -mpip install --user --pre -U "$package"; then
  #       msg "$package installation succeeded"
  #     else
  #       msg "$package installation failed"
  #     fi
  #   done
}
