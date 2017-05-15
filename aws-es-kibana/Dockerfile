FROM alpine:3.3

MAINTAINER Ric Lister <rlister@gmail.com>

RUN apk add --update nodejs && \
    npm install aws-es-kibana@1.0.5 -g

EXPOSE 9200

## need to bind eth0 inside container, not lo0
ENTRYPOINT [ "aws-es-kibana", "-b", "0.0.0.0" ]
