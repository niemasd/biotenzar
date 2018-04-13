FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y bzip2 cmake curl default-jdk gcc git g++ less libboost-all-dev libbz2-dev liblzma-dev libncurses5-dev libtbb-dev libz-dev make man-db perl pkg-config python python-pip unzip wget zlib1g zlib1g-dev

# BCFtools
RUN wget -qO- https://github.com/samtools/bcftools/releases/download/1.8/bcftools-1.8.tar.bz2 | tar -jx
RUN cd bcftools-1.8 && ./configure --prefix=/usr/local && make && make install
RUN cd ..
RUN rm -rf bcftools-1.8

# bedtools
RUN wget -qO- https://github.com/arq5x/bedtools2/releases/download/v2.27.1/bedtools-2.27.1.tar.gz | tar -zx
RUN cd bedtools2 && make && mv bin/* /usr/local/bin
RUN cd ..
RUN rm -rf bedtools2

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
RUN cd bwa && make && mv bwa /usr/local/bin && mkdir -p /usr/local/share/man/man1 && mv bwa.1 /usr/local/share/man/man1
RUN cd ..
RUN rm -rf bwa

# Cufflinks
RUN curl -s http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz | tar -zx
RUN rm cufflinks-2.2.1.Linux_x86_64/AUTHORS cufflinks-2.2.1.Linux_x86_64/LICENSE cufflinks-2.2.1.Linux_x86_64/README
RUN mv cufflinks-2.2.1.Linux_x86_64/* /usr/local/bin
RUN rm -rf cufflinks-2.2.1.Linux_x86_64

# FastTree
RUN curl http://www.microbesonline.org/fasttree/FastTree.c > FastTree.c
RUN gcc -DUSE_DOUBLE -DOPENMP -fopenmp -O3 -finline-functions -funroll-loops -Wall -o FastTree FastTree.c -lm
RUN mv FastTree /usr/local/bin && rm FastTree.c

# FastQC
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip && unzip fastqc_v0.11.7.zip && rm fastqc_v0.11.7.zip
RUN mv FastQC /usr/local/bin && chmod a+x /usr/local/bin/FastQC/fastqc && ln -s /usr/local/bin/FastQC/fastqc /usr/local/bin/fastqc

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

# TopHat
RUN curl -s http://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.tar.gz | tar -zx
RUN cd tophat-2.1.1 && ./configure --prefix=/usr/local && make && make install
RUN cd ..
RUN rm -rf tophat-2.1.1

# VCFtools
RUN wget -qO- https://github.com/vcftools/vcftools/releases/download/v0.1.15/vcftools-0.1.15.tar.gz | tar -zx
RUN cd vcftools-0.1.15 && ./configure --prefix=/usr/local && make && make install
RUN cd ..
RUN rm -rf vcftools-0.1.15

# clean up
RUN mandb && apt-get clean
