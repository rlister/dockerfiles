FROM debian:jessie

MAINTAINER Ric Lister, rlister@gmail.com

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -yq nginx && \
    rm -rf /var/lib/apt/lists/*

## clean up unwanted configs
RUN rm /etc/nginx/sites-enabled/default

## run in foreground
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

## log to stdout
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443
CMD [ "nginx" ]
