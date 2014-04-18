# Base image to future reuse under nested images

FROM ubuntu:13.10
MAINTAINER Sergey Shkolin <sergey@shkolin.net.ua>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq
RUN apt-get -yqq upgrade

RUN echo ${LOCAL_TIMEZONE:-Europe/Kiev} > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get install -yqq locales
RUN sed -i -e "s:# en_US.UTF-8 UTF-8:en_US.UTF-8 UTF-8:" /etc/locale.gen
RUN dpkg-reconfigure -f noninteractive locales

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
