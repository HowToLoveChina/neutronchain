FROM alpine:3.5

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 https://github.com/ntc/go-ntc && \
  (cd go-ntc && make gntc) && \
  cp go-ntc/build/bin/gntc /gntc && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-ntc && rm -rf /var/cache/apk/*

EXPOSE 8545
EXPOSE 10101

ENTRYPOINT ["/gntc"]
