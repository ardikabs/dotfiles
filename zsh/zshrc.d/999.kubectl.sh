#!/usr/bin/env bash
# -------------------------------------------
# Kubectl
# -------------------------------------------

# Load kubectl completion for zsh
if which kubectl > /dev/null 2>&1; then
	# shellcheck disable=SC1090
	source <(kubectl completion zsh)
fi

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"