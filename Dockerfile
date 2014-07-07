# Base image to future reuse under nested images

FROM ubuntu:14.04
MAINTAINER Sergey Shkolin <sergey@shkolin.net.ua>

ENV DEBIAN_FRONTEND noninteractive

# Update package repository
RUN apt-get update -qq
RUN apt-get -yqq upgrade

# Required packages
RUN apt-get install -y software-properties-common vim zip wget curl

RUN echo ${LOCAL_TIMEZONE:-Europe/Kiev} > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Removed unnecessary packages
RUN apt-get autoremove -y

# Clear package repository cache
RUN apt-get clean install
