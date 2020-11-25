#!/usr/bin/env bash
# -------------------------------------------
# zsh default
# -------------------------------------------

export ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
bindkey '^ ' autosuggest-accept

# shellcheck disable=SC1090
source "${ZSH_CUSTOM}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

export PS_FORMAT="pid,ppid,user,pri,ni,vsz,rss,pcpu,pmem,tty,stat,args"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
