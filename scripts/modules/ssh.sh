#!/bin/bash

info() {
	echo -n "install ssh"
}

run() {
    sudo apt install -qy openssh-client

    linker $1 "$dotfiles_directory/ssh" "$HOME/.ssh"
    _generate_ssh_keys
}

function _generate_ssh_keys() {
	# Use awk to extract and print unique IdentityFiles
	identity_files=($(awk '$1 == "IdentityFile" {print $2}' "$ssh_config_file" | sort -u))

	# Check if there are any IdentityFiles found
	if [ ${#identity_files[@]} -eq 0 ]; then
		echo "No IdentityFiles found in the SSH config file."
	fi

	for i in "${!identity_files[@]}"; do
		identity_file="${identity_files[$i]}"
		path="$HOME/.ssh/$identity_file"
		algorithm="${identity_file##*_}"

		if [ ! -f "$path" ]; then
			ssh-keygen -t $algorithm -f $path -N "" -C ""
		fi
	done

	message "ssh" "add your public ssh credentials to remote hosts"
}
