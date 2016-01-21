#!/bin/sh

## write config file from environment vars
cat > config.js <<EOF
{
  "host": "${HOST:-0.0.0.0}",
  "port": ${PORT:-7777},
  "keyLength": ${KEY_LENGTH:-10},
  "maxLength": ${MAX_LENGTH:-400000},
  "staticMaxAge": ${STATIC_MAX_AGE:-86400},
  "recompressStaticAssets": ${RECOMPRESS_STATIC_ASSETS:-true},
  "logging": [
    {
      "level": "${LOGGING_LEVEL:-verbose}",
      "type": "${LOGGING_TYPE:-Console}",
      "colorize": ${LOGGING_COLORIZE:-false}
    }
  ],
  "keyGenerator": {
    "type": "${KEY_GENERATOR_TYPE:-phonetic}"
  },
  "storage": {
    "type": "${STORAGE_TYPE:-redis}",
    "path": "${STORAGE_PATH:-./data}",
    "host": "${STORAGE_HOST:-0.0.0.0}",
    "port": ${STORAGE_PORT:-6379},
    "db": ${STORAGE_DB:-2},
    "expire": ${STORAGE_EXPIRE:-2592000}
  },
  "documents": {
    "about": "./about.md"
  }
}
EOF

## run the server
exec /usr/local/bin/node ./server.js
