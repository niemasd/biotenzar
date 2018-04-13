FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y g++ wget perl zlib1g zlib1g-dev pkg-config man-db make
RUN wget -qO- https://github.com/vcftools/vcftools/releases/download/v0.1.15/vcftools-0.1.15.tar.gz | tar -zx
RUN cd vcftools-0.1.15 && ./configure --prefix=/usr/local && make && make install && mandb
RUN cd ..
RUN rm -rf vcftools-0.1.15 && apt-get clean
