FROM debian:jessie

MAINTAINER Ric Lister, rlister@gmail.com

RUN apt-get update && \
    apt-get install -y wget

## install sensu
RUN wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | apt-key add - && \
    echo "deb http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list && \
    apt-get update -o Dir::Etc::sourcelist="sources.list.d/sensu.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0" && \
    apt-get install -y sensu

WORKDIR /app

CMD [ "/opt/sensu/bin/sensu-client", "-c", "config.json", "-d", "conf.d" ]
