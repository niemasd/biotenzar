FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y rsync libkrb5-dev
RUN rsync -aP rsync://hgdownload.soe.ucsc.edu/genome/admin/exe/linux.x86_64/ /usr/local/bin
RUN apt-get clean
