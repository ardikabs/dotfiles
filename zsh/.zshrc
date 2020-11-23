export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
export GPG_TTY=$(tty)

source ~/.local/zshrc.d/.init
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
	git
	sudo
	kubectl
	virtualenv
	gpg-agent
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# do not edit this file. put files in the dir below.
for FN in $HOME/.local/zshrc.d/*.zsh; do
	source $FN
done