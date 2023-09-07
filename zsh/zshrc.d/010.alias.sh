#!/usr/bin/env bash
# -------------------------------------------
# my custom alias
# -------------------------------------------

alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias ssno='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

alias t=tmux
alias ta="t a -t"
alias tn="t new -s"
alias tls="t ls"
alias tks="t kill-session -t"

alias less='less -F'
alias grep='grep --color'
alias ls='ls -hF --color=tty'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias tree='tree -C'

alias ..='cd ..'
alias .1='cd ..'
alias ...='cd ../..'
alias .2='cd ../..'
alias ....='cd ../../..'
alias .3='cd ../../..'
alias .....='cd ../../../..'
alias .4='cd ../../../..'
alias ......='cd ../../../../..'
alias .5='cd ../../../../..'
alias .......='cd ../../../../../..'
alias .6='cd ../../../../../..'
alias .7='cd ../../../../../../..'
alias .8='cd ../../../../../../../..'
alias .9='cd ../../../../../../../../..'
