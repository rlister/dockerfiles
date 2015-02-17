#!/bin/bash

## make sure this script bails on any failures
set -eo pipefail

## how to get to etcd from inside container
export ETCD=${ETCD:-http://172.17.42.1:4001}

## wait until we can make initial nginx config
until ./confd -verbose -onetime -node $ETCD -confdir /app ; do
  echo "confd waiting to create initial nginx config"
  sleep 5
done

## run confd to poll etcd for changes
echo "confd polling etcd ..."
./confd -verbose -interval 10 -node $ETCD -confdir /app &

## run nginx in foreground
nginx -g 'daemon off;'
