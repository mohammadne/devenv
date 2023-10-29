#!/bin/bash

function system_architecture() {
	if ! command -v uname &> /dev/null; then
		echo "Linux with uname is not installed, there is nothing to do"
		return 1
	fi

	architecture="$(uname --m)";
	case "$architecture" in
		# amd64
		x86_64) echo 'x86_64' ;;

		# arm32v6
		armhf) echo 'armel' ;;

		# arm32v7
		armv7) echo 'armhf' ;;

		# arm64v8
		aarch64) echo 'aarch64' ;;

		*) echo >&2 "error: unsupported architecture ($architecture)"; exit 1 ;;
	esac;
}
