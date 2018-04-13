FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl g++ cmake zlib1g zlib1g-dev libbz2-dev
RUN curl -s http://cab.spbu.ru/files/release3.11.1/SPAdes-3.11.1.tar.gz | tar -zx
RUN cd SPAdes-3.11.1
RUN cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/usr/local" "build_spades/src" && make && make install
RUN cd ..
RUN rm -rf SPAdes-3.11.1 && apt-get clean
