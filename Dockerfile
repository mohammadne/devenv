FROM ubuntu:22.04

RUN apt update && apt install -y \
    sudo ca-certificates git curl

ENV WORKDIR="/opt/workspace"

# Set the working directory inside the container
# Clone the current Git repository into the container
COPY . $WORKDIR/devenv

RUN /opt/workspace/devenv/scripts/install.sh \
    --set "DOTFILES_DIRECTORY=$WORKDIR/dotfiles" \
    "zsh" "vim" "tmux" "kubernetes/kubectl" "docker/install-binary"

WORKDIR $WORKDIR

SHELL ["/bin/bash", "-c"]
