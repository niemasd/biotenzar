FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y git gcc make libz-dev
RUN git clone https://github.com/lh3/bwa.git
RUN cd bwa && make && mv bwa /usr/local/bin && mv bwa.1 /usr/local/share/man/man1 && mandb
RUN cd ..
RUN rm -rf bwa && apt-get clean
