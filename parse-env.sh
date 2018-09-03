#!/bin/bash
# Internal script for parsing common.env. Run by other executable scripts

env_dir="${BASH_SOURCE%/*}"
if [[ ! -d "$env_dir" ]]; then env_dir="$PWD"; fi
env_file="$env_dir/common.env"
if [ -f $env_file ]; then
  source $env_file
  export ENV_FILE="$env_file"
fi

# target platform info
export LINUX_DISTR=${LINUX_DISTR:-centos}
export LINUX_DISTR_VER=${LINUX_DISTR_VER:-'7.5.1804'}

export HOST_IP=${HOST_IP:-'auto'}
if [[ $HOST_IP == 'auto' ]] ; then
  default_interface=`ip route show | grep "default via" | awk '{print $5}'`
  export HOST_IP=`ip address show dev $default_interface | head -3 | tail -1 | tr "/" " " | awk '{print $2}'`
fi

export CONTRAIL_VERSION=${CONTRAIL_VERSION:-'5.0'}
export CONTRAIL_CONTAINER_TAG=${CONTRAIL_CONTAINER_TAG:-$CONTRAIL_VERSION}

export CONTRAIL_REGISTRY=${CONTRAIL_REGISTRY:-'auto'}
default_registry_ip=${_CONTRAIL_REGISTRY_IP:-${HOST_IP}}
if [[ $CONTRAIL_REGISTRY == 'auto' ]] ; then
  export CONTRAIL_REGISTRY="${default_registry_ip}:5000"
fi
