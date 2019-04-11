FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install curl make libdigest-md5-file-perl libsoap-lite-perl libxml-libxml-simple-perl libjson-perl --no-install-recommends -y && \
    apt-get clean && \
    cd /usr/local/src/ && \
    curl -o check_nwc_health-7.6.tar.gz https://labs.consol.de/assets/downloads/nagios/check_nwc_health-7.6.tar.gz && \
    tar vxzf check_nwc_health-7.6.tar.gz && \
    rm check_nwc_health-7.6.tar.gz && \
    cd check_nwc_health-7.6 && \
    ./configure && \
    make && \
    mv plugins-scripts/check_nwc_health /usr/local/bin/check_nwc_health && \
    cd && \
    rm -rf /usr/local/src/check_nwc_health-7.6

ENTRYPOINT ["/usr/local/bin/check_nwc_health"]
