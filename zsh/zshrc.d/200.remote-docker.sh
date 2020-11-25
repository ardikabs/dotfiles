#!/usr/bin/env bash
# -------------------------------------------
# remote docker
# -------------------------------------------

remote.docker() {
  readonly tempdir="/tmp/remote-docker"
  mkdir -p "${tempdir}"

  if [ -f "${tempdir}/remote-docker.pid" ]; then
    kill -15 "$(cat "${tempdir}/remote-docker.pid")" >/dev/null 2>&1
    /bin/rm -rf "${tempdir}/docker.sock"
  fi

  ssh_cmd="ssh -fNT -L ${tempdir}/docker.sock:/var/run/docker.sock playground.ardikabs.com"
  if eval "${ssh_cmd}"; then
    pgrep -f "${ssh_cmd}" > "${tempdir}"/remote-docker.pid
    export DOCKER_HOST="unix://${tempdir}/docker.sock"
  fi
}

remote.docker-aws() {
  readonly tempdir="/tmp/remote-docker-aws"
  mkdir -p "${tempdir}"

  if [ -f "${tempdir}/remote-docker.pid" ]; then
    kill -15 "$(cat "${tempdir}/remote-docker.pid")" >/dev/null 2>&1
    /bin/rm -rf "${tempdir}/docker.sock"
  fi

  ssh_cmd="ssh -fNT -L ${tempdir}/docker.sock:/var/run/docker.sock aws.playground.ardikabs.com"
  if eval "${ssh_cmd}"; then
    pgrep -f "${ssh_cmd}" > "${tempdir}"/remote-docker.pid
    export DOCKER_HOST="unix://${tempdir}/docker.sock"
  fi
}