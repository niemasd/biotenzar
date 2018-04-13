FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl make g++ python libboost-all-dev zlib1g zlib1g-dev
RUN curl -s http://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.tar.gz | tar -zx
RUN cd tophat-2.1.1 && ./configure --prefix=/usr/local && make && make install
RUN cd ..
RUN rm -rf tophat-2.1.1 && apt-get clean
