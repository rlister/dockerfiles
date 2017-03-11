FROM alpine:3.3

MAINTAINER rlister@gmail.com

ENV LS_VERSION 2.3.1

## install logstash and its dependencies
RUN apk -U upgrade && \
    apk add -U bash openjdk8-jre-base openssl curl ca-certificates && \
    cd /tmp && \
    wget -q http://download.elastic.co/logstash/logstash/logstash-${LS_VERSION}.tar.gz && \
    mkdir -p /app && \
    tar zxf /tmp/logstash-${LS_VERSION}.tar.gz -C /app/ && \
    rm -rf /tmp/* /var/cache/apk/*

WORKDIR /app/logstash-${LS_VERSION}

## avoid OpenSSL::X509::StoreError in jvm
RUN curl -sOJL http://curl.haxx.se/ca/cacert.pem
ENV SSL_CERT_FILE /app/logstash-${LS_VERSION}/cacert.pem

## install output plugin for AWS elasticsearch service
RUN bin/logstash-plugin install logstash-output-amazon_es

ENTRYPOINT [ "bin/logstash" ]