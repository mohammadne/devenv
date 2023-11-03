#!/bin/bash

info() {
	echo -n "install rust language"
}

run() {
    require_pacman rust

	# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	# add $HOME/.cargo/bin to path

    mkdir -p "$HOME/.cargo" || true
    cp "$dotfiles_root/rust/config.toml" "$HOME/.cargo/config.toml"
}

_install_rust_dependencies() {
    msg 'install cargo plugins'
	cargo install cargo-edit cargo-expand
    cargo install tokei # statistics about your codes
    cargo install --features=ssl websocat # webSocket client
    cargo install bandwhich # displaying network utilization
    cargo install dua-cli  # disk Usage Analyzer
}
