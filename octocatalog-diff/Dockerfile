FROM centos:7
MAINTAINER Simon Lauger <simon@lauger.de>

ARG PUPPET_VERSION="5"

LABEL org.label-schema.url="https://github.com/slauger/dockerfiles" \
      org.label-schema.name="octocatalog-diff"

RUN yum upgrade -y && \
    yum groupinstall -y "Development Tools" && \
    yum install -y openssl openssl-devel libcurl libcurl-devel cmake

RUN yum install -y "http://yum.puppetlabs.com/puppet${PUPPET_VERSION}/puppet${PUPPET_VERSION}-release-el-7.noarch.rpm" && \
    yum install -y puppet-agent && \
    yum clean all && \
    rm -rf /var/cache/yum/*

RUN /opt/puppetlabs/puppet/bin/gem install octocatalog-diff --no-ri --no-rdoc

ENTRYPOINT ["/opt/puppetlabs/puppet/bin/octocatalog-diff"]
