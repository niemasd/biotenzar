FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget make gcc
RUN wget -qO- https://github.com/rambaut/Seq-Gen/archive/1.3.4.tar.gz | tar -zx
RUN cd Seq-Gen-1.3.4/source && make && mv seq-gen /usr/local/bin
RUN cd ../..
RUN rm -rf Seq-Gen-1.3.4 && apt-get clean
