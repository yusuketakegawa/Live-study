FROM ruby:2.6.5

RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  nodejs \
  vim \
  default-mysql-client 

WORKDIR /app


RUN gem install bundler 

EXPOSE 3000

FROM ubuntu:16.04

RUN apt-get update && apt-get install -y nginx supervisor
RUN mkdir -p /var/log/supervisor
RUN groupadd nginx
RUN useradd -g nginx nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/dev.live-study.work.conf /etc/nginx/conf.d/dev.live-study.work.conf

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
