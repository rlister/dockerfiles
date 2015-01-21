FROM progrium/busybox

MAINTAINER Ric Lister, rlister@gmail.com

RUN opkg-install openssl-util

WORKDIR /app

ADD htpasswd.sh /app/
RUN chmod 0755 htpasswd.sh

ENV CRYPT apr1
ENV OUTPUT /dev/stdout

ENTRYPOINT [ "/app/htpasswd.sh" ]
