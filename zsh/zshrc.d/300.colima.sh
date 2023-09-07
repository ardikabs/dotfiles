#!/usr/bin/env bash
# 3xx meant script that only run for MacOSX
# -------------------------------------------
# colima, a replacement of Docker runtime in MacOS
# -------------------------------------------

if [[ "$(uname)" == "Darwin" ]]; then
  export DOCKER_HOST=unix://$HOME/.colima/default/docker.sock

  # Load colima completion for zsh
  if type colima >/dev/null 2>&1; then
    # shellcheck disable=SC1090
    source <(colima completion zsh)
  fi
fi
