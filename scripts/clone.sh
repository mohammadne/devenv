#!/bin/bash

devenv_directory="${1:-$HOME/Workspace/personal/devenv}"
mkdir -p "$(dirname $devenv_directory)"
git clone https://github.com/mohammadne/devenv.git $devenv_directory -q
cd $devenv_directory && git remote set-url origin git@github.com:mohammadne/devenv.git
