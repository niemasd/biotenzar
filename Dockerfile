FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget unzip gcc g++ make libtbb-dev zlib1g zlib1g-dev python perl
RUN wget -q https://astuteinternet.dl.sourceforge.net/project/bowtie-bio/bowtie2/2.3.4.1/bowtie2-2.3.4.1-linux-x86_64.zip && unzip bowtie2-2.3.4.1-linux-x86_64.zip && rm bowtie2-2.3.4.1-linux-x86_64.zip
RUN mv bowtie2-2.3.4.1-linux-x86_64/bowtie* /usr/local/bin
RUN rm -rf bowtie2-2.3.4.1-linux-x86_64 && apt-get clean
