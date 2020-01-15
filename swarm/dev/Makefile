.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/ntc/go-ntc/cmd/swarm
	go build -o bin/gntc     github.com/ntc/go-ntc/cmd/gntc
	go build -o bin/bootnode github.com/ntc/go-ntc/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/ntc/go-ntc/swarm/...
