FROM ubuntu:22.04

RUN apt update && apt install -y \
    sudo ca-certificates git curl

ENV WORKDIR="/opt/workspace"

COPY . $WORKDIR/devenv

RUN /opt/workspace/devenv/scripts/install.sh \
    --set "DOTFILES_DIRECTORY=$WORKDIR/dotfiles" \
    "zsh" "vim" "tmux" \
    "docker/client-binary" \
    "kubernetes/helm" "kubernetes/helmsman" "kubernetes/kind" "kubernetes/kubectl" "kubernetes/sops" "kubernetes/telepresence" \
    "languages/go"

WORKDIR $WORKDIR

CMD [ "zsh" ]
