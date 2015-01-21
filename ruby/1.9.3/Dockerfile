FROM debian:jessie

MAINTAINER Ric Lister, rlister@gmail.com

RUN apt-get update && apt-get install -y \
    build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev

ENV RUBY_VERSION 1.9.3-p551

ADD http://cache.ruby-lang.org/pub/ruby/1.9/ruby-${RUBY_VERSION}.tar.gz /tmp/

RUN tar -zxf /tmp/ruby-${RUBY_VERSION}.tar.gz && \
    (cd ruby-${RUBY_VERSION} && ./configure --disable-install-doc && make install) && \
    rm -rf /tmp/ruby-${RUBY_VERSION}.tar.gz && rm -rf ruby-${RUBY_VERSION}

RUN gem install bundler --no-rdoc --no-ri
