FROM phusion/baseimage:0.9.16
FROM tomcat:7-jre8
MAINTAINER Mat Kelly <mkelly@cs.odu.edu>

CMD ["/sbin/my_init"]

RUN apt-get update && apt-get -y install \
    git \
    maven2


RUN git clone https://github.com/iipc/openwayback.git openwayback
RUN git clone https://github.com/internetarchive/heritrix3.git heritrix
RUN git clone https://github.com/ikreymer/pywb.git pywb


#RUN cd openwayback
#RUN cd openwayback &&  mvn package
RUN cd heritrix && mvn package


# Cleanup apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
