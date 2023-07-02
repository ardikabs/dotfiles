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