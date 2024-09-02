#!/usr/bin/env bash
# -------------------------------------------
# Cloud-related for Amazon Web Service
# -------------------------------------------

export AWS_SDK_LOAD_CONFIG=1
export AWS_REGION=ap-southeast-1

if type aws_completer >/dev/null 2>&1; then
  complete -C aws_completer aws
fi

aws_eni() {
  TYPE=$1

  aws ec2 describe-instance-types \
    --filters "Name=instance-type,Values=$TYPE.*" \
    --query "InstanceTypes[].{ \
        Type: InstanceType, \
        MaxENI: NetworkInfo.MaximumNetworkInterfaces, \
        IPv4addrPerENI: NetworkInfo.Ipv4AddressesPerInterface}" \
    --output table
}
