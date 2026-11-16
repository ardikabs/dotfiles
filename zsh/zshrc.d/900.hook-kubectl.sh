# Only run in interactive Zsh shells
[[ -n "${ZSH_VERSION:-}" && -o interactive ]] || return 0

autoload -Uz add-zsh-hook

export KUBE_SHELL_PID=$$
typeset -g _KUBE_SESSION_HOLD=0

_hook_kubectl_preexec() {
  local -a words
  words=(${(z)3})

  # Only trigger on kubectl commands (also matches aliases like `k`)
  [[ "${words[1]:t}" == "kubectl" ]] || return 0

  if [[ "${words[2]:-}" == "session" ]]; then
    case "${words[3]:-}" in
      end)
        _KUBE_SESSION_HOLD=1
        return 0
        ;;
      start)
        _KUBE_SESSION_HOLD=0
        return 0
        ;;
    esac
  fi

  # Auto-initialize via kubectl-session on any kubectl stroke unless held
  # kubectl-session refers to https://github.com/ardikabs/libsh/blob/main/lib/kubectl-session
  if (( ! _KUBE_SESSION_HOLD )); then
    local session_file="/tmp/kubeconfig-session-${KUBE_SHELL_PID}"
    if [[ ! -f "$session_file" && -x /usr/local/bin/kubectl-session ]]; then
      /usr/local/bin/kubectl-session start >/dev/null
    fi
    [[ -f "$session_file" ]] && export KUBECONFIG="$session_file"
  fi
}

_sync_kube_session() {
  local session_file="/tmp/kubeconfig-session-${KUBE_SHELL_PID}"

  if [[ -f "$session_file" ]]; then
    if [[ "${KUBECONFIG:-}" != "$session_file" ]]; then
      export KUBECONFIG="$session_file"
    fi
  else
    if [[ "${KUBECONFIG:-}" == /tmp/kubeconfig-session-* ]]; then
      unset KUBECONFIG
    fi
  fi
}

_cleanup_kube_session() {
  rm -f "/tmp/kubeconfig-session-${KUBE_SHELL_PID}"
}

add-zsh-hook preexec _hook_kubectl_preexec
add-zsh-hook precmd _sync_kube_session
add-zsh-hook zshexit _cleanup_kube_session