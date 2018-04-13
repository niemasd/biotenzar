FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl g++ cmake zlib1g zlib1g-dev libbz2-dev python
RUN curl -s http://cab.spbu.ru/files/release3.11.1/SPAdes-3.11.1-Linux.tar.gz | tar -zx
RUN mv SPAdes-3.11.1-Linux/bin/* /usr/local/bin && mv SPAdes-3.11.1-Linux/share/* /usr/local/share
RUN rm -rf SPAdes-3.11.1-Linux && apt-get clean
