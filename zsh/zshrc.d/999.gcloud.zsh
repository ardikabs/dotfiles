#!/usr/bin/sh
# -------------------------------------------
# Google Cloud
# -------------------------------------------

# The next line updates PATH for the Google Cloud SDK.
if [ -f /usr/local/google-cloud-sdk/path.zsh.inc ]; then
	source /usr/local/google-cloud-sdk/path.zsh.inc
fi

# The next line enables shell command completion for gcloud.
if [ -f /usr/local/google-cloud-sdk/completion.zsh.inc ]; then
	source /usr/local/google-cloud-sdk/completion.zsh.inc
fi
