FROM ruby:2.4.0-slim

MAINTAINER developers@8layertech.com

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PATH=/usr/src/app/bin:$PATH

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    build-essential cmake pkg-config git nodejs mysql-client libmysqlclient-dev && \
    apt-get autoremove

RUN bundle install

COPY . /usr/src/app
