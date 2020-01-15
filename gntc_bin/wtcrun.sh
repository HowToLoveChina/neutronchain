#!/bin/sh
if [ ! -d "./data/gntc" ]; then
	./bin/gntc --datadir ./data/ init ./settings/ntc.json
fi
if [ "$1" = "--mine" ]; then
./bin/gntc --networkid 15 --datadir ./data/ --identity "ntc" $1 --etherbase $2 console
else
./bin/gntc --networkid 15 --datadir ./data/ --identity "ntc" console
fi
