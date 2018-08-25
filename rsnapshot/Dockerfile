FROM centos:7
MAINTAINER Simon Lauger <simon@lauger.de>

LABEL org.label-schema.url="https://github.com/slauger/dockerfiles" \
      org.label-schema.name="rsnapshot"

RUN yum upgrade -y && \
    yum install -y openssh epel-release && \
    yum install -y rsnapshot && \
    yum clean all && \
    rm -rf /var/cache/yum/*

