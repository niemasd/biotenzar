FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget make g++ zlib1g zlib1g-dev python
RUN wget -qO- https://github.com/arq5x/bedtools2/releases/download/v2.27.1/bedtools-2.27.1.tar.gz | tar -zx
RUN cd bedtools2 && make && mv bin/* /usr/local/bin
RUN cd ..
RUN rm -rf bedtools2 && apt-get clean
