FROM jeanblanchard/busybox-java

MAINTAINER Ric Lister, rlister@gmail.com

## busybox wget cannot do https, so grab curl binary
ENV CURL_VERSION 7.30.0
RUN (wget -O - http://www.magicermine.com/demos/curl/curl/curl-${CURL_VERSION}.ermine.tar.bz2 | bunzip2 -c - | tar xf -) \
    && mv /curl-${CURL_VERSION}.ermine/curl.ermine /bin/curl \
    && rm -rf /curl-${CURL_VERSION}.ermine

## install riemann
ENV RIEMANN_VERSION 0.2.10
RUN curl -skL https://aphyr.com/riemann/riemann-${RIEMANN_VERSION}.tar.bz2 | bunzip2 | tar -x && \
    mv /riemann-${RIEMANN_VERSION} /app

WORKDIR /app

## hack shell wrapper to use busybox sh
RUN sed -ie 's/env bash/env sh/' bin/riemann

## hack default config to listen on all interfaces
RUN sed -ie 's/127.0.0.1/0.0.0.0/' etc/riemann.config

EXPOSE 5555/tcp 5555/udp 5556

CMD [ "bin/riemann", "etc/riemann.config" ]
