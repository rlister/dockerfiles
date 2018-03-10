FROM node:6-alpine

MAINTAINER Ric Lister, rlister@gmail.com

RUN apk -U upgrade \
    && apk add git

RUN git clone https://github.com/seejohnrun/haste-server.git /app
WORKDIR /app
RUN npm install

ADD ./app.sh /app/
RUN chmod 755 app.sh

EXPOSE 7777

ENV STORAGE_TYPE file

CMD [ "./app.sh" ]
