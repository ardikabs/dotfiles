#!/usr/bin/env bash
# -------------------------------------------
# Python
# -------------------------------------------

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"
eval "$(pyenv init --path)"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"