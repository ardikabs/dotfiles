#!/usr/bin/env bash
# -------------------------------------------
# pre script to be invoked before else
# -------------------------------------------

# ###############################
#
# Reserved Filename
# - 000.prescript.sh : pre script to be invoked before else
# - 00{1..9} reserved by maintainer
# - {900..998} reserved by maintainer
# - 999.postscript.sh : : post script to be invoked after else
#
#
# Definitions
# - 010 - 099 prefixed: the non-execution scripts, such as alias.
# - 100 - 199 prefixed: the most important script/function to be executed
# - 200 - 299 prefixed: the executor scripts, executor as in executing a long running process; such as port-forwarding, establish vpn tunnel
# - 300 - 399 prefixed: undefined yet
# - 400 - 499 prefixed: undefined yet
# - 500 - 899 prefixed: the helper script for particular tools
# - 900 - 998 prefixed: the shell hooks scripts
#
# ###############################

# shellcheck disable=SC2034
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
bindkey '^ ' autosuggest-accept

# shellcheck disable=SC1090,SC1091
source "${ZSH_CUSTOM}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

export PS_FORMAT="pid,ppid,user,pri,ni,vsz,rss,pcpu,pmem,tty,stat,args"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/git/cmd:$PATH"
