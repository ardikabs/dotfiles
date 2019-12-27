#!/usr/bin/sh
# -------------------------------------------
# Kubectl
# -------------------------------------------

# Load kubectl completion for zsh
if [ -f /usr/local/bin/kubectl ]; then
	source <(kubectl completion zsh)
fi
