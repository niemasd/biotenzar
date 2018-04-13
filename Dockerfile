FROM debian:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y pypy wget git
RUN wget https://bootstrap.pypa.io/get-pip.py && pypy get-pip.py 
RUN for f in easy_install easy_install-2.7 pip pip2 pip2.7 wheel; do mv /usr/local/bin/$f /usr/local/bin/pypy-$f; done
RUN pypy-pip install PyGLtools
RUN git clone https://github.com/billgreenwald/pgltools.git && mv pgltools /usr/local/bin/pgltools_files && ln -s /usr/local/bin/pgltools_files/sh/pgltools /usr/local/bin/pgltools
RUN rm get-pip.py && apt-get clean
