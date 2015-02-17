FROM debian:jessie

MAINTAINER Ric Lister <rlister@gmail.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -yq \
    curl \
    nginx && \
    rm /etc/nginx/sites-enabled/default

WORKDIR /app

## install confd
ENV CONFD_RELEASE 0.7.1
RUN curl -Ls https://github.com/kelseyhightower/confd/releases/download/v${CONFD_RELEASE}/confd-${CONFD_RELEASE}-linux-amd64 -o confd && \
    chmod 0755 confd

## confd setup and runner
ADD app.sh /app/
RUN chmod 0755 app.sh

EXPOSE 80 443

CMD [ "/app/app.sh" ]
