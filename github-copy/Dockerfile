FROM radial/busyboxplus:curl

MAINTAINER Ric Lister, rlister@gmail.com

WORKDIR /app

ADD ghcp /app/
RUN chmod 0755 ghcp
ADD ghcat /app/
RUN chmod 0755 ghcat

ENTRYPOINT [ "/app/ghcp" ]
