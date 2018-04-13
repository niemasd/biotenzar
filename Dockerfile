FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget unzip default-jdk
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip && unzip Trimmomatic-0.36.zip && rm Trimmomatic-0.36.zip
RUN mv Trimmomatic-0.36/trimmomatic-0.36.jar /usr/local/bin
RUN printf '#!/usr/bin/env bash\njava -jar /usr/local/bin/trimmomatic-0.36.jar\n' > trimmomatic && chmod a+x trimmomatic && mv trimmomatic /usr/local/bin
RUN rm -rf Trimmomatic-0.36 && apt-get clean
