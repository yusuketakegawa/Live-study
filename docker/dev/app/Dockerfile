FROM ruby:2.6.5
ENV APP_ROOT /var/www/Live-study


RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    vim \
    default-mysql-client && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR $APP_ROOT


RUN gem install bundler 



RUN apt-get update -y && apt-get install -y nginx supervisor
RUN mkdir -p /var/log/supervisor
RUN groupadd nginx
RUN useradd -g nginx nginx
ADD app/nginx/nginx.conf /etc/nginx/nginx.conf
ADD app/nginx/dev.live-study.work.conf /etc/nginx/conf.d/dev.live-study.work.conf

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
