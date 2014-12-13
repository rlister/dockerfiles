FROM debian:jessie

MAINTAINER Ric Lister, rlister@gmail.com

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -yq \
    git \
    nodejs npm

RUN git clone https://github.com/seejohnrun/haste-server.git /app
WORKDIR /app
RUN npm install

ADD ./app.sh /app/
RUN chmod 755 app.sh

EXPOSE 7777

CMD [ "./app.sh" ]
