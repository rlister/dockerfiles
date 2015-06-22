FROM debian:jessie

MAINTAINER Ric Lister <rlister@gmail.com>

ADD http://nginx.org/keys/nginx_signing.key /tmp/

RUN apt-key add /tmp/nginx_signing.key && \
    rm -f /tmp/nginx_signing.key && \
    (echo 'deb http://nginx.org/packages/debian/ jessie nginx' >> /etc/apt/sources.list) && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -yq nginx && \
    rm -rf /var/lib/apt/lists/* && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf

VOLUME [ "/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html" ]

WORKDIR /etc/nginx

EXPOSE 80 443

CMD [ "nginx" ]
