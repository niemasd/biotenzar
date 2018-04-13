FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y curl gcc g++ make wget

# FastTree
RUN curl http://www.microbesonline.org/fasttree/FastTree.c > FastTree.c
RUN gcc -DUSE_DOUBLE -DOPENMP -fopenmp -O3 -finline-functions -funroll-loops -Wall -o FastTree FastTree.c -lm
RUN mv FastTree /usr/local/bin && rm FastTree.c

# MAFFT
RUN curl -s https://mafft.cbrc.jp/alignment/software/mafft-7.394-with-extensions-src.tgz | tar -zx
RUN cd mafft-7.394-with-extensions/core && make clean && make && make install
RUN cd ../..
RUN cd mafft-7.394-with-extensions/extensions && make clean && make && make install
RUN cd ../..
RUN rm -rf mafft-7.394-with-extensions

# clean up
RUN apt-get clean
