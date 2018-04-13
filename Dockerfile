FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y bzip2 cmake curl gcc git g++ less libbz2-dev liblzma-dev libncurses5-dev libtbb-dev libz-dev make man-db perl python python-pip unzip wget zlib1g zlib1g-dev

# Bowtie
RUN wget -q https://cfhcable.dl.sourceforge.net/project/bowtie-bio/bowtie/1.2.2/bowtie-1.2.2-linux-x86_64.zip && unzip bowtie-1.2.2-linux-x86_64.zip && rm bowtie-1.2.2-linux-x86_64.zip
RUN mv bowtie-1.2.2-linux-x86_64/bowtie* /usr/local/bin
RUN rm -rf bowtie-1.2.2-linux-x86_64

# Bowtie2
RUN wget -q https://astuteinternet.dl.sourceforge.net/project/bowtie-bio/bowtie2/2.3.4.1/bowtie2-2.3.4.1-linux-x86_64.zip && unzip bowtie2-2.3.4.1-linux-x86_64.zip && rm bowtie2-2.3.4.1-linux-x86_64.zip
RUN mv bowtie2-2.3.4.1-linux-x86_64/bowtie* /usr/local/bin
RUN rm -rf bowtie2-2.3.4.1-linux-x86_64

# BWA
RUN git clone https://github.com/lh3/bwa.git
RUN cd bwa && make && mv bwa /usr/local/bin && mkdir -p /usr/local/share/man/man1 && mv bwa.1 /usr/local/share/man/man1 && mandb
RUN cd ..
RUN rm -rf bwa

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

# SAMtools
RUN wget -qO- https://github.com/samtools/samtools/releases/download/1.8/samtools-1.8.tar.bz2 | tar -jx
RUN cd samtools-1.8 && ./configure --prefix=/usr/local && make && make install
RUN cd ..
RUN rm -rf samtools-1.8

# SPAdes
RUN curl -s http://cab.spbu.ru/files/release3.11.1/SPAdes-3.11.1-Linux.tar.gz | tar -zx
RUN mv SPAdes-3.11.1-Linux/bin/* /usr/local/bin && mv SPAdes-3.11.1-Linux/share/* /usr/local/share
RUN rm -rf SPAdes-3.11.1-Linux

# clean up
RUN apt-get clean
