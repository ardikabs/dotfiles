#!/usr/bin/env bash
# -------------------------------------------
# Golang
# -------------------------------------------

GOPATH="$(go env GOPATH)"
GOROOT="$(asdf which go)"
export GO111MODULE=on
export GOROOT="${GOROOT%%/bin*}"
export PATH="$PATH:$GOPATH/bin"
export CGO_ENABLED=1
