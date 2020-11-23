#!/usr/bin/sh
# -------------------------------------------
# Kubectl
# -------------------------------------------

# Load kubectl completion for zsh
if which kubectl > /dev/null 2>&1; then
	source <(kubectl completion zsh)
fi

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"