FROM debian:jessie
MAINTAINER Ric Lister <rlister@gmail.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -yq nginx && \
    rm -rf /var/lib/apt/lists/* && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    chown -R www-data:www-data /var/lib/nginx

VOLUME [ "/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html" ]

WORKDIR /etc/nginx

EXPOSE 80
EXPOSE 443

CMD [ "nginx" ]
