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
    return 0
  fi

  return 1
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
    return 0
  fi

  return 1
}

docker-remote-port-forward() {
  mkdir -p /tmp/docker-remote-port-forward

  case $1 in
    *:*)
    if [[ -n "${DOCKER_HOST}" ]]; then
      target_port="$(echo "$1"| cut -d: -f1)"
      destination_port="$(echo "$1"| cut -d: -f2)"

      if [ -f "/tmp/docker-remote-port-forward/${target_port}.pid" ]; then
        kill -15 "$(cat "/tmp/docker-remote-port-forward/${target_port}.pid")" >/dev/null 2>&1
      fi

      ssh_cmd="ssh -fNT -L 127.0.0.1:${target_port}:127.0.0.1:${destination_port} playground.ardikabs.com"
      if eval "${ssh_cmd}"; then
        pgrep -f "${ssh_cmd}" > "/tmp/docker-remote-port-forward/${target_port}.pid"
        return 0
      fi
    fi
    ;;
    close)
      shift 1
      target_port="$(echo "$1"| cut -d: -f1)"
      if [ -f "/tmp/docker-remote-port-forward/${target_port}.pid" ]; then
        kill -15 "$(cat "/tmp/docker-remote-port-forward/${target_port}.pid")" >/dev/null 2>&1
      fi
      return 0
    ;;
    closeall)
      for pid in /tmp/docker-remote-port-forward/*.pid; do
        kill -15 "$(cat "${pid}")"
        rm -rf "${pid}"
      done
      return 0
    ;;
  esac
  return 1
}