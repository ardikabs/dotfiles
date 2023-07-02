#!/usr/bin/env bash
# -------------------------------------------
# remote kubernetes
# -------------------------------------------

remote.k8s-connect() {
  readonly tempdir="/tmp/remote-kubernetes"
  mkdir -p "${tempdir}"

  if [ -f "${tempdir}/kubernetes-master.pid" ]; then
    kill -15 "$(cat "${tempdir}/kubernetes-master.pid")" >/dev/null 2>&1
  fi

  ssh_cmd="ssh -fNT -L 6443:172.18.0.10:6443 ${PERSONAL_REMOTE_HOST}"
  if eval "${ssh_cmd}"; then
    pgrep -f "${ssh_cmd}" >"${tempdir}/kubernetes-master.pid"
    return 0
  fi

  return 1
}
