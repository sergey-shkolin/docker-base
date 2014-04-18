# Base image to future reuse under nested images

FROM ubuntu:13.10
MAINTAINER Sergey Shkolin <sergey@shkolin.net.ua>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq
RUN apt-get -yqq upgrade

RUN echo ${LOCAL_TIMEZONE:-Europe/Kiev} > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
