FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y gcc curl
RUN curl -s https://mafft.cbrc.jp/alignment/software/mafft-7.394-with-extensions-src.tgz | tar -zx
RUN cd mafft-7.394-with-extensions/core && make clean && make && make install
RUN cd ../extensions  && make clean && make && make install
RUN apt-get clean
