FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget unzip gcc g++ make libtbb-dev zlib1g zlib1g-dev python
RUN wget -q https://cfhcable.dl.sourceforge.net/project/bowtie-bio/bowtie/1.2.2/bowtie-1.2.2-linux-x86_64.zip && unzip bowtie-1.2.2-linux-x86_64.zip && rm bowtie-1.2.2-linux-x86_64.zip
RUN mv bowtie-1.2.2-linux-x86_64/bowtie* /usr/local/bin
RUN rm -rf bowtie-1.2.2-linux-x86_64 && apt-get clean
