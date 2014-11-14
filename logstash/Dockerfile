FROM debian:jessie

MAINTAINER Ric Lister, rlister@gmail.com

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -yq \
    openjdk-7-jre-headless \
    wget

WORKDIR /app

RUN cd /tmp && \
    wget -q https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar zxf /tmp/logstash-1.4.2.tar.gz -C /app --strip-components=1 && \
    rm -f /tmp/logstash-1.4.2.tar.gz

RUN bin/plugin install contrib

ENTRYPOINT [ "bin/logstash" ]
