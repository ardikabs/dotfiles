#!/usr/bin/sh
# -------------------------------------------
# Python
# -------------------------------------------

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)