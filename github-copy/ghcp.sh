#!/bin/sh

## loop each pair of args as a src path and dest dir
while [ $# -gt 0 ]
do
  src=$1;  shift
  dest=$1; shift
  mkdir -p "$dest"
  (
    cd "$dest" && \
      /usr/bin/curl -sOL \
        -H "Authorization: token $TOKEN" \
        -H 'Accept: application/vnd.github.v3.raw' \
        "https://api.github.com/repos/${REPO}/contents/${src}"
  )
done
