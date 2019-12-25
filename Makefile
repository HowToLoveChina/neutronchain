# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: gntc android ios gntc-cross swarm evm all test clean
.PHONY: gntc-linux gntc-linux-386 gntc-linux-amd64 gntc-linux-mips64 gntc-linux-mips64le
.PHONY: gntc-linux-arm gntc-linux-arm-5 gntc-linux-arm-6 gntc-linux-arm-7 gntc-linux-arm64
.PHONY: gntc-darwin gntc-darwin-386 gntc-darwin-amd64
.PHONY: gntc-windows gntc-windows-386 gntc-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

gntc:
	build/env.sh go run build/ci.go install ./cmd/gntc
	@echo "Done building."
	@echo "Run \"$(GOBIN)/gntc\" to launch gntc."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/gntc.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/Gntc.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/jteeuwen/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go install ./cmd/abigen

# Cross Compilation Targets (xgo)

gntc-cross: gntc-linux gntc-darwin gntc-windows gntc-android gntc-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/gntc-*

gntc-linux: gntc-linux-386 gntc-linux-amd64 gntc-linux-arm gntc-linux-mips64 gntc-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-*

gntc-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/gntc
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep 386

gntc-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/gntc
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep amd64

gntc-linux-arm: gntc-linux-arm-5 gntc-linux-arm-6 gntc-linux-arm-7 gntc-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep arm

gntc-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/gntc
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep arm-5

gntc-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/gntc
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep arm-6

gntc-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/gntc
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep arm-7

gntc-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/gntc
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep arm64

gntc-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/gntc
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep mips

gntc-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/gntc
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep mipsle

gntc-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/gntc
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep mips64

gntc-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/gntc
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/gntc-linux-* | grep mips64le

gntc-darwin: gntc-darwin-386 gntc-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/gntc-darwin-*

gntc-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/gntc
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-darwin-* | grep 386

gntc-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/gntc
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-darwin-* | grep amd64

gntc-windows: gntc-windows-386 gntc-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/gntc-windows-*

gntc-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/gntc
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-windows-* | grep 386

gntc-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/gntc
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/gntc-windows-* | grep amd64
