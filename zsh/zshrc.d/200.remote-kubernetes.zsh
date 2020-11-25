#!/usr/bin/sh
# -------------------------------------------
# remote kubernetes
# -------------------------------------------

remote.kubernetes() {
  readonly tempdir="/tmp/remote-kubernetes"
  mkdir -p "${tempdir}"

  if [ -f "${tempdir}/kubernetes-master.pid" ]; then
    kill -15 "$(cat "${tempdir}/kubernetes-master.pid")"
  fi

  ssh -fNT -L 6443:172.18.0.10:6443 playground.k8s.ardikabs.com
  echo $(pgrep -f 'ssh.*playground.k8s.ardikabs.com') > "${tempdir}/kubernetes-master.pid"
}