#!/usr/bin/sh
# -------------------------------------------
# my custom alias
# -------------------------------------------

alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias tnew="tmux new-session -t"
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

function syseng(){
	ssh -l syseng $1
}

function cloudeng(){
	ssh -l cloudeng $1
}

