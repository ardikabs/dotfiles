#!/usr/bin/env bash

export _HOOK_KUBECTL_CONFIG_MATCH=0

# shellcheck disable=SC2181
_hook_kubectl_config_pre() {
  cmd=$(echo "${1}" | awk '{ print $1 }')
  ctx=$(echo "${1}" | awk '{ print $2 }')

  cmd=$(type "${cmd}" 2>/dev/null)
  if [ $? -eq 0 ]; then
    if grep -ow "kubectl" <<< "${cmd}" >/dev/null 2>&1; then
      if [ "${ctx}" = "ctx" ] && [[ ${KUBECONFIG} =~ \.kubeconfig$ ]]; then
        unset KUBECONFIG
        export _HOOK_KUBECTL_CONFIG_MATCH=1
      fi
    fi
  fi
}

# shellcheck disable=SC2086
_hook_kubectl_config_post() {
  if [ "${_HOOK_KUBECTL_CONFIG_MATCH}" -eq 1 ]; then
    _ctx_kubeconfig=/tmp/$(kubectl config current-context | tr -s ' ').kubeconfig

    kubectl config view --raw > $_ctx_kubeconfig
    export KUBECONFIG=${_ctx_kubeconfig}

    export _HOOK_KUBECTL_CONFIG_MATCH=0
  fi
}

add-zsh-hook preexec _hook_kubectl_config_pre
add-zsh-hook precmd _hook_kubectl_config_post
