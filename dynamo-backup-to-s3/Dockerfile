FROM alpine:3.2

MAINTAINER Ric Lister <rlister@gmail.com>

RUN apk add --update nodejs && \
    npm install dynamo-backup-to-s3 -g

ENTRYPOINT [ "dynamo-backup-to-s3" ]
