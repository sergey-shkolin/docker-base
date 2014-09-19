FROM ubuntu:14.04
MAINTAINER Sergey Shkolin <sergey.shkolin@me.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get update -qq ; \
    apt-get -yqq upgrade

RUN apt-get install -y software-properties-common vim zip wget curl

RUN echo ${LOCAL_TIMEZONE:-Europe/Kiev} > /etc/timezone ; \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get autoremove -y ; \
    apt-get clean install
