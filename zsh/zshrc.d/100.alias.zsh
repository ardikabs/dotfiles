#!/usr/bin/sh
# -------------------------------------------
# my custom alias
# -------------------------------------------

alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias tnew="tmux new-session -t"
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias p='/usr/local/bin/playground-tmux'