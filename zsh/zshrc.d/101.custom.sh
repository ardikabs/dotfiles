#!/usr/bin/env bash
# -------------------------------------------
# my custom helper function
# -------------------------------------------

totp() {
  local secret
  secret="SUPER_SECRET_TOTP"

  echo -n "$(oathtool --base32 --totp $secret)"
}

# shellcheck disable=SC2086
ipsec_vpn() {
  USER="ardika.saputro"
  HOST="${1:-home}.vpn.ardikabs.io"

  docker rm -f "$(docker ps -aq --filter name=$HOST)" >/dev/null 2>&1

  docker run --rm -itd \
    --net=host \
    --label app=ipsec \
    --cap-add=NET_ADMIN \
    -e VPN_USER=$USER \
    -e VPN_HOST="$HOST" \
    -e VPN_PASSWORD="$(totp)" \
    --name="$HOST" \
    ardikabs/strongswan \
    --profile ikev2-eap
}

ipsec_vpn_cleanup() {
  echo >&2 "cleaning ipsec vpn session..."
  docker rm -f "$(docker ps -aq --filter label=app=ipsec)" >/dev/null 2>&1
}

ssh_tunnel() {
  [ -f /tmp/jumpbox.pid ] && kill -15 "$(cat /tmp/jumpbox.pid 2>/dev/null)" 2>/dev/null
  if ssh -q -fN -L6443:172.18.1.2:6443 -L8443:172.18.2.3:6443 jumpbox; then
    pgrep -f 'ssh.*jumpbox' > /tmp/jumpbox.pid
  fi

  if nc -zv 127.0.0.1 6443 >/dev/null 2>&1 \
    && nc -zv 127.0.0.1 8443 >/dev/null 2>&1; then
    echo >&2 'message: successfully connected to the jumpbox network'
  else
    echo >&2 'error: failed to connect to the jumpbox network'
  fi
}