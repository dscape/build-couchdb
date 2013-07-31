# CouchDB
#
# VERSION  0.0.0

FROM       ubuntu
MAINTAINER Nuno Job "nunojobpinto@gmail.com"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get upgrade
RUN apt-get -y install help2man make gcc zlib1g-dev libssl-dev rake git-core

RUN cd ~/
RUN git clone git://github.com/iriscouch/build-couchdb
RUN cd build-couchdb
RUN git submodule init
RUN git submodule update
RUN rake
RUN . build/env.sh
RUN service couchdb start
