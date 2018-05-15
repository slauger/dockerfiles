FROM centos:7
MAINTAINER Simon Lauger <simon@lauger.de>

LABEL org.label-schema.url="https://github.com/slauger/dockerfiles" \
      org.label-schema.name="octocatalog-diff"

ENV GPG_KEYSERVER="hkp://keys.gnupg.net"
ENV GPG_KEYS="409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB"
ENV RUBY_VERSION="2.4"

RUN yum upgrade -y && \
    yum -y install libyaml make cmake gcc which && \
    gpg --keyserver ${GPG_KEYSERVER} --recv-keys ${GPG_KEYS} && \
    curl -sSL https://get.rvm.io | bash -s stable

RUN /bin/bash -l -c "rvm requirements" && \
    /bin/bash -l -c "rvm install ${RUBY_VERSION}" && \
    /bin/bash -l -c "gem install octocatalog-diff --no-ri --no-rdoc" 

RUN yum remove --setopt=tsflags=noscripts -y patch autoconf automake bison bzip2 gcc-c++ \
    libffi-devel libtool patch readline-devel sqlite-devel zlib-devel libyaml-devel \
    openssl-devel make cmake gcc && \
    yum clean all && \
    rm -rf /var/cache/yum/*

CMD /bin/bash
