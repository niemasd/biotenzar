FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget bzip2 gcc libncurses5-dev zlib1g zlib1g-dev libbz2-dev liblzma-dev make
RUN wget -qO- https://github.com/samtools/bcftools/releases/download/1.8/bcftools-1.8.tar.bz2 | tar -jx
RUN cd bcftools-1.8 && ./configure --prefix=/usr/local && make && make install
RUN cd ..
RUN rm -rf bcftools-1.8 && apt-get clean
