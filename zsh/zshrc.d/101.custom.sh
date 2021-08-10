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
    --ike-proposal aes256-sha1-modp1024
}

ipsec_vpn_cleanup() {
  echo >&2 "cleaning ipsec vpn session..."
  docker rm -f "$(docker ps -aq --filter label=app=ipsec)" >/dev/null 2>&1
}