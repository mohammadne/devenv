#!/bin/bash

info() {
	echo -n "install kubectl client binary"
}

run() {
    require_pacman rust

	# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	# add $HOME/.cargo/bin to path

    mkdir -p "$HOME/.cargo" || true
    cp "$dotfiles_root/rust/config.toml" "$HOME/.cargo/config.toml"

    msg 'install cargo plugins'
	cargo install cargo-edit cargo-expand
}
