#!/bin/sh

## substitute values in config file if any of these env vars are set
[ -z "$PORT" ]            || sed -ri "s|^(port):.*|\1: ${PORT}|"                       config/kibana.yml
[ -z "$HOST" ]            || sed -ri "s|^(host):.*|\1: \"${HOST}\"|"                   config/kibana.yml
[ -z "$ELASTICSEARCH" ]   || sed -ri "s|^(elasticsearch):.*|\1: \"${ELASTICSEARCH}\"|" config/kibana.yml
[ -z "$KIBANAINDEX" ]     || sed -ri "s|^(kibanaIndex):.*|\1: \"${KIBANAINDEX}\"|"     config/kibana.yml
[ -z "$DEFAULTAPPID" ]    || sed -ri "s|^(defaultAppId):.*|\1: \"${DEFAULTAPPID}\"|"   config/kibana.yml
[ -z "$REQUEST_TIMEOUT" ] || sed -ri "s|^(request_timeout):.*|\1: ${REQUEST_TIMEOUT}|" config/kibana.yml
[ -z "$SHARD_TIMEOUT" ]   || sed -ri "s|^(shard_timeout):.*|\1: ${SHARD_TIMEOUT}|"     config/kibana.yml
[ -z "$VERIFYSSL" ]       || sed -ri "s|^(verifySSL):.*|\1: ${VERIFYSSL}|"             config/kibana.yml

## run our arguments so we can use this as entrypoint
[ $# -eq 0 ] || exec $*
