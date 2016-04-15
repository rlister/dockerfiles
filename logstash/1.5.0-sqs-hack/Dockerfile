FROM debian:jessie

MAINTAINER Ric Lister <rlister@gmail.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -yq \
    openjdk-7-jre-headless \
    wget

ENV LS_VERSION 1.5.0
WORKDIR /app

RUN cd /tmp && \
    wget -q http://download.elastic.co/logstash/logstash/logstash-${LS_VERSION}.tar.gz && \
    tar zxf /tmp/logstash-${LS_VERSION}.tar.gz -C /app --strip-components=1 && \
    rm -f /tmp/logstash-${LS_VERSION}.tar.gz

## remove shipped sqs plugin and replace with my nasty hacked fork
RUN bin/plugin uninstall logstash-input-sqs && \
    (echo 'gem "logstash-input-sqs", github: "rlister/logstash-input-sqs"' >> Gemfile) && \
    apt-get install -yq git && \
    bin/plugin install --no-verify

ENTRYPOINT [ "bin/logstash" ]
