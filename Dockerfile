FROM ubuntu
FROM tomcat:7-jre8
MAINTAINER Mat Kelly <mkelly@cs.odu.edu>

RUN apt-get update && apt-get -y install \
    git \
    maven \
    python \
    python-setuptools

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN git clone https://github.com/iipc/openwayback.git openwayback
RUN git clone https://github.com/internetarchive/heritrix3.git heritrix
RUN git clone https://github.com/ikreymer/pywb.git pywb


#RUN cd openwayback
RUN cd openwayback/wayback-webapp &&  mvn package
#RUN cd heritrix && mvn package

RUN cd pywb && python setup.py install && wayback 


# Cleanup apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
