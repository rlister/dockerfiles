FROM debian:jessie

MAINTAINER Ric Lister <rlister@gmail.com>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -yq \
    build-essential \
    zlib1g-dev \
    libssl-dev \
    libreadline6-dev \
    libyaml-dev \
    libffi-dev

ENV RUBY_MAJOR_VERSION 2.2
ENV RUBY_VERSION 2.2.3

ADD http://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR_VERSION}/ruby-${RUBY_VERSION}.tar.gz /tmp/

RUN tar -zxf /tmp/ruby-${RUBY_VERSION}.tar.gz && \
    (cd ruby-${RUBY_VERSION} && ./configure --disable-install-doc && make install) && \
    rm -rf /tmp/ruby-${RUBY_VERSION}.tar.gz && rm -rf ruby-${RUBY_VERSION}

RUN gem install bundler --no-rdoc --no-ri
