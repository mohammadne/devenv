#!/bin/bash

info() {
	echo -n "install fonts"
}

run() {
    _fira_code
}


function _fira_code() {
    font_family="FiraCode"
    font_weights="Bold SemiBold Medium Regular Light"

    font_repository="https://github.com/ryanoasis/nerd-fonts"
    font_repository_release="v2.1.0"

    font_home="~/.local/share/fonts/$font_family"

    if [ -d $font_home ]; then
        print_warning $1 "font directory for $font_family already exist."
        return
    fi

    mkdir -p $font_home && cd $font_home

    for weight in $font_weights; do
        curl -fLo "$weight.ttf" "$font_repository/blob/$font_repository_release/patched-fonts/$font_family/$weight/complete/Fira%20Code%20$weight%20Nerd%20Font%20Complete.ttf"
    done

    # reset font cache
    if (command -v fc-cache &> /dev/null) ; then
        fc-cache -f "$font_home"
    fi
}
