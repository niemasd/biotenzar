FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl make gcc
RUN curl -s http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2.tar.gz | tar -zx
RUN cd hmmer-3.1b2 && ./configure --prefix=/usr/local && make && make install
RUN cd ..
RUN rm -rf hmmer-3.1b2 && apt-get clean
