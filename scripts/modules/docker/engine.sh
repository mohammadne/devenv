#!/bin/bash

info() {
    echo -n "install docker engine (client and daemon)"
}

run() {
    sudo dnf -y install dnf-plugins-core
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    
    sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    
    sudo systemctl start docker

    sudo groupadd docker # Create the docker group.
    sudo usermod -aG docker $USER # Add your user to the docker group.
    newgrp docker # Actiate the changes
}

# add docker contexts
