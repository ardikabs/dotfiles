#!/usr/bin/sh
# -------------------------------------------
# remote docker
# -------------------------------------------

remote.docker() {
  readonly tempdir="/tmp/remote-docker"
  mkdir -p "${tempdir}"

  if [ -f "${tempdir}/remote-docker.pid" ]; then
    kill -15 "$(cat "${tempdir}/remote-docker.pid")"
    /bin/rm -rf "${tempdir}/docker.sock"
  fi

  ssh -fNT -L ${tempdir}/docker.sock:/var/run/docker.sock playground.ardikabs.com
  echo $(pgrep -f 'ssh.*docker.sock') > "${tempdir}"/remote-docker.pid
  export DOCKER_HOST="unix://${tempdir}/docker.sock"
}