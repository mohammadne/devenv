#!/bin/bash

info() {
	echo -n "install docker client binary"
}

run() {
    require_pacman go operator-sdk
    msg "$(go version)"

    msg "create go directories structure"
	local gopath
	gopath=$HOME/.cache/go
	[ -d "$gopath/pkg" ] || mkdir -p "$gopath/pkg"

    local gobin
	gobin=$HOME/.local/bin
	[ -d "$gobin" ] || mkdir -p "$gobin"

    msg "set go environments"
    go env -w GOPATH="$HOME/.cache/go"
	go env -w GOBIN="$HOME/.local/bin"
	go env -w GOPROXY="https://goproxy.io,goproxy.cn,direct"
	go env -w GONOSUMDB="gitlab.snapp.ir"
	go env -w GOPRIVATE="gitlab.snapp.ir"
	go env

    msg "fetch some good and useful go packages"
	require_go github.com/golangci/golangci-lint/cmd/golangci-lint
	require_go mvdan.cc/gofumpt
	require_go golang.org/x/tools/cmd/goimports
	require_go golang.org/x/tools/gopls
	require_go golang.org/dl/gotip
	require_go github.com/go-delve/delve/cmd/dlv
}
