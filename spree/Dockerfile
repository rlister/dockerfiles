## generate and run a rails app with github.com/spree/spree installed
##
## docker build -t rlister/spree .
## docker run -it -p 3000:3000 rlister/spree

FROM rlister/ruby:2.1.2

MAINTAINER Ric Lister, rlister@gmail.com

RUN apt-get update && apt-get install -yq \
    git \
    nodejs \
    imagemagick \
    libsqlite3-dev \
    sqlite3

RUN echo "gem: --no-rdoc --no-ri" >> ~/.gemrc
RUN gem install rails -v 4.0.5
RUN gem install spree

RUN rails _4.0.5_ new /app -s
RUN spree install -A /app

WORKDIR /app

EXPOSE 3000

ENTRYPOINT [ "bin/bundle", "exec" ]

CMD [ "rails", "server" ]
