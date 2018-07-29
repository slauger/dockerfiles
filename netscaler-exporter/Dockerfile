FROM golang

ENV USERNAME="nsroot"
ENV PASSWORD="nsroot"

EXPOSE 9280

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN go get github.com/slauger/Citrix-NetScaler-Exporter && \
    cd ${GOPATH-$HOME/go}/src/github.com/slauger/Citrix-NetScaler-Exporter/ && \
    go build -o ${GOPATH-$HOME/go}/netscaler-exporter && \
    mv ${GOPATH-$HOME/go}/netscaler-exporter /usr/local/bin/netscaler-exporter && \
    rm -rf ${GOPATH-$HOME/go} && \
    chmod 755 /usr/local/bin/docker-entrypoint.sh

CMD ["/usr/local/bin/docker-entrypoint.sh"]
