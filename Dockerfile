FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget default-jdk
RUN wget -qO- https://github.com/CompEvol/beast2/releases/download/v2.5.0/BEAST.v2.5.0.Linux.tgz | tar -zx
RUN mv beast /usr/local/bin/beast_files && ln -s /usr/local/bin/beast_files/bin/* /usr/local/bin
RUN apt-get clean
