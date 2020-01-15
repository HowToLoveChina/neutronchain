#!/bin/sh
if [ ! -d "./data" ]; then
	 ./bin/gntc --datadir ./data/ init ./settings/ntc.json
fi
if [ "$1" = "--mine" ]; then
	nohup ./bin/gntc --networkid 15 --datadir ./data/ --identity "ntc" $1 --etherbase $2 > gntc.log 2>&1 &
else
	nohup ./bin/gntc --networkid 15 --datadir ./data/ --identity "ntc" > gntc.log 2>&1 &
fi
