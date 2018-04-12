FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
#RUN apt-get install -y gcc curl
RUN apt-get clean
