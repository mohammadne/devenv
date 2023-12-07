#!/bin/bash

__help="
Install modules based on role of the environment you are passing.

Usage: $(basename $0) ROLE [OPTIONS]

Roles:
  desktop                     Install modules for desktop environment with GUI
  server                      Install modules for server environment without GUI
  container                   Install modules for building OCI Image (normally can be used in CI)

Options:
  --help                      Show help menu
"

# error if argument is not equal to one
if [ "$#" -ne 1 ]; then
    echo "$__help" && exit 1
fi

case $1 in
    --help) echo "$__help"; exit 0 ;;

    desktop)
        arguments=(
            --set "DOTFILES_DIRECTORY=$WORKDIR/dotfiles"
            --set "GRAPHICAL=true"
            "zsh" "vim" "tmux"
            "packages/development"
            "docker/client-binary"
            "kubernetes/helm" "kubernetes/helmsman" "kubernetes/kind" "kubernetes/kubectl" "kubernetes/sops" "kubernetes/telepresence"
            "languages/go" "languages/rust"
        )
        ;;

    server)
        arguments=(
            --set "DOTFILES_DIRECTORY=$WORKDIR/dotfiles"
            --set "GRAPHICAL=false"
            "zsh" "vim" "tmux"
            "packages/development"
            "docker/client-binary"
            "kubernetes/helm" "kubernetes/helmsman" "kubernetes/kind" "kubernetes/kubectl" "kubernetes/sops" "kubernetes/telepresence"
            "languages/go" "languages/rust"
        )
        ;;

    container)
        arguments=(
            --set "DOTFILES_DIRECTORY=$WORKDIR/dotfiles"
            --set "GRAPHICAL=false"
            "zsh" "vim" "tmux"
            "packages/development"
            "docker/client-binary"
            "kubernetes/helm" "kubernetes/helmsman" "kubernetes/kind" "kubernetes/kubectl" "kubernetes/sops" "kubernetes/telepresence"
            "languages/go" "languages/rust"
        )
        ;;

    *) echo "$__help"; exit 1 ;;
esac

# findout scripts directory path
scripts_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")"/. && pwd)"

source "$scripts_directory/main.sh" "${arguments[@]}"
