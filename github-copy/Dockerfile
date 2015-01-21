FROM radial/busyboxplus:curl

MAINTAINER Ric Lister, rlister@gmail.com

WORKDIR /app

ADD ghcp.sh /app/
RUN chmod 0755 ghcp.sh

ENTRYPOINT [ "/app/ghcp.sh" ]
