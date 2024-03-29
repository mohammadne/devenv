#!/bin/bash

info() {
    echo -n "install fonts"
}

run() {
    sudo dnf install -qy fontconfig
    
    local _fonts_to_be_installed=("FiraCode")
    local _font_home="$HOME/.local/share/fonts"
    local _font_repository="https://github.com/ryanoasis/nerd-fonts"
    local _font_repository_release="v3.1.1"
    
    for font in "${_fonts_to_be_installed[@]}"; do
        local _font_path="$_font_home/$font"
        if [ -d $_font_path ]; then
            print_warning $1 "font directory for $font already exist."
            continue
        fi
        mkdir -p $_font_path
        
        local url="$_font_repository/releases/download/$_font_repository_release/$font.tar.xz"
        if ! result=$(download_file $1 $url); then echo "$result" && return 1; fi
        sudo tar -C $_font_path -xf $result && rm -rf "$result"
    done
    
    # reset font cache
    if (command -v fc-cache &> /dev/null) ; then
        fc-cache -f "$font_home"
    fi
}

# TODO: use new release download from zip file
# https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
# curl -> unzip -> delete original
function _fira_code() {
    font_family="FiraCode"
    font_weights="Bold Medium Regular Light"
    
    
    
    
    
    
    if [ -d $font_home ]; then
        print_warning $1 "font directory for $font_family already exist."
        return
    fi
    
    mkdir -p $font_home && cd $font_home
    
    for weight in $font_weights; do
        print_warning $1 "$font_repository/blob/$font_repository_release/patched-fonts/$font_family/$weight/complete/Fira%20Code%20$weight%20Nerd%20Font%20Complete.ttf"
        curl -SLo "$weight.ttf" "$font_repository/blob/$font_repository_release/patched-fonts/$font_family/$weight/complete/Fira%20Code%20$weight%20Nerd%20Font%20Complete.ttf"
    done
    
    # reset font cache
    if (command -v fc-cache &> /dev/null) ; then
        fc-cache -f "$font_home"
    fi
}
