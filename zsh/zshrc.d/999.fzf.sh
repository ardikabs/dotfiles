#!/usr/bin/env bash
# -------------------------------------------
# fd & fzh
# https://github.com/junegunn/fzf
# https://github.com/sharkdp/fd
# -------------------------------------------

# Source: https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236 {{

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  if [ -n "${TMUX}" ]; then
    fzf-tmux --height 70% "$@" --border
  else
    fzf --height 50% "$@" --border
  fi
}

# git files
_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

# git branchs
# shellcheck disable=SC2001
_gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview "git log --oneline --graph --date=short --color=always --pretty='format:%C(auto)%cd %h%d %s' $(sed s/^..// <<< {} | cut -d" " -f1) | head -"$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

# git tags
_gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

# git history
_gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

# git remote
_gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

# shellcheck disable=SC2034
join-lines() {
  local item
  while read -r item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in "$@"; do
    eval "fzf-g$c-widget() { local result=\$(_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper f b t r h
unset -f bind-git-helper

# }}

_FZF_BIND="f3:execute(bat --style=numbers {} || less -f {}),"
_FZF_BIND+="f2:toggle-preview,"
_FZF_BIND+="ctrl-a:select-all+accept,"
_FZF_BIND+="ctrl-y:execute-silent(echo {+} | xclip -sel c -i),"
_FZF_BIND+="ctrl-x:execute(rm -i {+})+abort,"
_FZF_BIND+="ctrl-u:half-page-up,"
_FZF_BIND+="ctrl-d:half-page-down,"
_FZF_BIND+="alt-k:preview-up,"
_FZF_BIND+="alt-j:preview-down,"
_FZF_BIND+="ctrl-f:preview-page-up,"
_FZF_BIND+="ctrl-b:preview-page-down"

export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1
    --reverse --multi --inline-info
    --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file ||
        (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300'
    --preview-window='right:hidden:wrap'
    --bind='${_FZF_BIND}'
"

FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard || fd --type f --type l ${FD_OPTIONS}"
export FZF_CTRL_T_COMMAND="fd ${FD_OPTIONS}"
export FZF_ALT_C_COMMAND="fd --type d ${FD_OPTIONS}"


# shellcheck disable=SC1090
[ -f "${HOME}"/.fzf.zsh ] && source "${HOME}"/.fzf.zsh
