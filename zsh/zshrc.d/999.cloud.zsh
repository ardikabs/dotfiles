#!/usr/bin/sh
# -------------------------------------------
# Cloud-related command line
# Currently:
# 1. Google Cloud Platform
# 2. Amazon Web Services
# -------------------------------------------

# The next line updates PATH for the Google Cloud SDK.
if [ -f /usr/local/google-cloud-sdk/path.zsh.inc ]; then
	source /usr/local/google-cloud-sdk/path.zsh.inc
fi

# The next line enables shell command completion for gcloud.
if [ -f /usr/local/google-cloud-sdk/completion.zsh.inc ]; then
	source /usr/local/google-cloud-sdk/completion.zsh.inc
fi

if type aws_completer >/dev/null 2>&1; then
	complete -C aws_completer aws
fi