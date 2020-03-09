#!/usr/bin/sh
# -------------------------------------------
# my custom alias
# -------------------------------------------

alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias ssno='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias p='/usr/local/bin/playground-tmux'

alias t=tmux
alias ta="t a -t"
alias tn="t new -t"
alias tls="t ls"