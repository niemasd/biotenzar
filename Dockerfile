FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget default-jdk
RUN wget -qO- https://github.com/beast-dev/beast-mcmc/releases/download/v1.8.4/BEASTv1.8.4.tgz | tar -zx
RUN mv BEASTv1.8.4 /usr/local/bin && ln -s /usr/local/bin/BEASTv1.8.4/bin/* /usr/local/bin
RUN apt-get clean
