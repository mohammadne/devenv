#!/bin/bash

yes_to_all=${yes_to_all:-false}

# linker does the soft linking, it has a yes_to_all parameter which you can use to skip the question phase
# parameter 1: module name - string which is used only in logs.
# parameter 2: source path - string
# parameter 3: destination path - string
function linker() {
	local module=$1
	local src_path=$2
	local dst_path=$3

	# Check if the path does not exist
	if [ ! -e "$src_path" ]; then
		message "$module" "$src_path not exists as a file or directory to be linked"
		return
	fi

	# create parent directory if missed
	parent_directory="$(dirname "$dst_path")"
	mkdir -p $parent_directory

	if [ -e "$dst_path" ] || [ -d "$dst_path" ] || [ -L "$dst_path" ]; then
		# skips if dst_path points to the correct src_path file (directory)
		if [[ $src_path = $(readlink "$dst_path") ]]; then
			message "$module" "$dst_path has already existed and points to the correct source"
			return
		fi

		# remove and backup old dst_path file (directory)
		message "$module" "$dst_path has already existed but points to an incorrect source"
		if yes_or_no "$module" "do you want to remove $dst_path?"; then
			if yes_or_no "$module" "do you want to backup old $dst_path?"; then
				cp -Rf $dst_path "$dst_path.backup" 2> /dev/null
			fi

			rm -Rf "$dst_path"
			action "$module" "$dst_path is removed successfully"
		else
			return
		fi
	fi

	ln -s "$src_path" "$dst_path"
	action "$module" "Symbolic link created successfully from $src_path to $dst_path"
}
