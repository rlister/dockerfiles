FROM debian:jessie

MAINTAINER Ric Lister, rlister@gmail.com

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -yq \
    openjdk-7-jre-headless \
    wget

WORKDIR /app

ENV KIBANA_VERSION 4.0.0-beta3

RUN cd /tmp && \
    wget -q https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}.tar.gz && \
    tar zxf /tmp/kibana-${KIBANA_VERSION}.tar.gz -C /app --strip-components=1 && \
    rm -f /tmp/kibana-${KIBANA_VERSION}.tar.gz

EXPOSE 5601

## sub env vars into config file
ADD config.sh /app/
ENTRYPOINT [ "sh", "./config.sh" ]

CMD [ "bin/kibana" ]
