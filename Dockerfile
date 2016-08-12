FROM python:3.4-slim

MAINTAINER Mevin Babu "mevinbabuc@gmail.com"

EXPOSE 8000

ENV HOME /root
ENV APP_HOME /application/

RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential \
        apt-transport-https \
        ca-certificates \
        gnupg \
        curl \
        git \
        libpq-dev \
        libxml2-dev \
        libxslt1-dev \
        openssh-client \
        file \
        libtiff5-dev \
        libjpeg-dev \
        zlib1g-dev \
        libfreetype6-dev \
        liblcms2-dev \
        tcl8.6-dev \
        tk8.6-dev \
        python-tk

# Clean up APT and bundler when done.
RUN rm -rf /usr/share/doc \
           /usr/share/man \
           /usr/share/groff \
           /usr/share/info \
           /usr/share/lintian \
           /usr/share/linda \
           /usr/share/locale/ \
           /var/cache/man

# Clean up APT when done.
RUN apt-get clean
RUN apt-get autoclean
RUN apt-get autoremove
RUN rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*

RUN mkdir -p $HOME/.ssh
ADD id_rsa $HOME/.ssh/id_rsa
RUN chmod 600 $HOME/.ssh/id_rsa && chmod 700 $HOME/.ssh
RUN ssh-keyscan github.com >> $HOME/.ssh/known_hosts

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD requirements_dev.txt $APP_HOME
RUN pip install -r requirements_dev.txt

RUN rm -rf requirements_dev.txt

RUN rm -rf id_rsa
RUN rm -rf $HOME/.ssh

ADD . $APP_HOME

