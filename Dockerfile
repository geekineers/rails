FROM ruby:2.4.0-slim

MAINTAINER developers@8layertech.com

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    build-essential cmake pkg-config git nodejs mysql-client libmysqlclient-dev && \
    apt-get autoremove

ENV RAILS_VERSION 5.0.1

RUN gem install rails --version "$RAILS_VERSION"
