FROM centos:7
MAINTAINER Simon Lauger <simon@lauger.de>

LABEL org.label-schema.url="https://github.com/slauger/dockerfiles" \
      org.label-schema.name="mod-gearman-worker"

ENV RELEASE_RPM="https://labs.consol.de/repo/stable/rhel7/x86_64/labs-consol-stable.rhel7.noarch.rpm"
ENV SERVER="localhost:4730"
ENV KEY="changeit"

RUN yum upgrade -y && \
    yum -y install ${RELEASE_RPM} && \
    yum install -y mod_gearman && \
    yum clean all && \
    rm -rf /var/cache/yum/*

USER naemon

CMD ["/usr/bin/mod_gearman_worker", "--logmode=stdout", "--p1_file=/usr/share/mod_gearman/mod_gearman_p1.pl", "--debug=3", "--debug-result", "--server=${SERVER}", "--key=${KEY}"]
