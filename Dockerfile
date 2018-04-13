FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y gcc g++ libssl-dev libcrypto++9v5 libcurl3-dev python3 python3-pip cmake make git python3-numpy python3-scipy python3-biopython python3-hyphy python3-six cython python3-tornado
RUN git clone https://github.com/veg/tn93.git && cd tn93 && cmake ./ && make install
RUN cd ..
RUN pip3 install hivtrace
RUN rm -rf tn93 && apt-get clean
