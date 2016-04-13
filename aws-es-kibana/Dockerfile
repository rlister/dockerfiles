FROM alpine:3.3

MAINTAINER Ric Lister <rlister@gmail.com>

RUN apk add --update nodejs && \
    npm install aws-es-kibana -g

## need to bind eth0 inside container, not lo0
RUN sed -i.bak s/127\.0\.0\.1/0\.0\.0\.0/ /usr/lib/node_modules/aws-es-kibana/index.js

EXPOSE 9200

ENTRYPOINT [ "aws-es-kibana" ]