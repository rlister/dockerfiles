FROM debian:jessie

MAINTAINER Ric Lister, rlister@gmail.com

RUN apt-get update && apt-get install -y \
    build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

ADD http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz /tmp/

RUN tar -zxf /tmp/ruby-2.1.3.tar.gz && \
    (cd ruby-2.1.3 && ./configure --disable-install-doc && make install) && \
    rm -rf /tmp/ruby-2.1.3.tar.gz && rm -rf ruby-2.1.3

RUN gem install bundler --no-rdoc --no-ri
