#!/usr/bin/env bash
# -------------------------------------------
# Cloud-related command line
# Currently:
# 1. Google Cloud Platform
# 2. Amazon Web Services
# -------------------------------------------

gcloud_version=$(asdf current gcloud | tr -s ' ' | awk '{print $2}')
gcloud_dir=$ASDF_DIR/installs/gcloud/${gcloud_version}

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${gcloud_dir}/path.zsh.inc" ]; then
	# shellcheck disable=SC1090,SC1091
	source "${gcloud_dir}/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f "${gcloud_dir}/completion.zsh.inc" ]; then
	# shellcheck disable=SC1090,SC1091
	source "${gcloud_dir}/completion.zsh.inc"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f /usr/local/google-cloud-sdk/path.zsh.inc ]; then
	# shellcheck disable=SC1091
	source /usr/local/google-cloud-sdk/path.zsh.inc
fi

# The next line enables shell command completion for gcloud.
if [ -f /usr/local/google-cloud-sdk/completion.zsh.inc ]; then
	# shellcheck disable=SC1091
	source /usr/local/google-cloud-sdk/completion.zsh.inc
fi

if type aws_completer >/dev/null 2>&1; then
	complete -C aws_completer aws
fi