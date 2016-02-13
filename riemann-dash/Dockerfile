FROM rlister/ruby:2.1.5

MAINTAINER Ric Lister, rlister@gmail.com

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y \
    ca-certificates

RUN gem install --no-rdoc --no-ri riemann-dash thin 
RUN gem install --no-rdoc --no-ri fog -v 1.19.0

WORKDIR /app

ADD config.rb /app/

EXPOSE 4567

CMD [ "riemann-dash" ]
