FROM ubuntu:xenial

RUN \
  apt-get update && apt-get upgrade -q -y && \
  apt-get install -y --no-install-recommends golang git make gcc libc-dev ca-certificates && \
  git clone --depth 1 https://github.com/ntc/go-ntc && \
  (cd go-ntc && make gntc) && \
  cp go-ntc/build/bin/gntc /gntc && \
  apt-get remove -y golang git make gcc libc-dev && apt autoremove -y && apt-get clean && \
  rm -rf /go-ntc

EXPOSE 8545
EXPOSE 10101

ENTRYPOINT ["/gntc"]
