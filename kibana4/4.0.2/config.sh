#!/bin/sh

## substitute values in config file if any of these env vars are set
[ -z "$PORT" ]              || sed -ri "s|^(port):.*|\1: ${PORT}|"                               config/kibana.yml
[ -z "$HOST" ]              || sed -ri "s|^(host):.*|\1: \"${HOST}\"|"                           config/kibana.yml
[ -z "$ELASTICSEARCH_URL" ] || sed -ri "s|^(elasticsearch_url):.*|\1: \"${ELASTICSEARCH_URL}\"|" config/kibana.yml
[ -z "$KIBANA_INDEX" ]      || sed -ri "s|^(kibana_index):.*|\1: \"${KIBANA_INDEX}\"|"           config/kibana.yml
[ -z "$DEFAULT_APP_ID" ]    || sed -ri "s|^(default_app_id):.*|\1: \"${DEFAULT_APP_ID}\"|"       config/kibana.yml
[ -z "$REQUEST_TIMEOUT" ]   || sed -ri "s|^(request_timeout):.*|\1: ${REQUEST_TIMEOUT}|"         config/kibana.yml
[ -z "$SHARD_TIMEOUT" ]     || sed -ri "s|^(shard_timeout):.*|\1: ${SHARD_TIMEOUT}|"             config/kibana.yml
[ -z "$VERIFY_SSL" ]        || sed -ri "s|^(verify_ssl):.*|\1: ${VERIFY_SSL}|"                   config/kibana.yml

## run our arguments so we can use this as entrypoint
[ $# -eq 0 ] || exec $*
