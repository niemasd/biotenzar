FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget perl unzip default-jdk
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip && unzip fastqc_v0.11.7.zip && rm fastqc_v0.11.7.zip
RUN mv FastQC /usr/local/bin && chmod a+x /usr/local/bin/FastQC/fastqc && ln -s /usr/local/bin/FastQC/fastqc /usr/local/bin/fastqc
RUN apt-get clean
