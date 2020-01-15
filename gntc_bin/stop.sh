#!/bin/bash
ps -ef | grep gntc | awk '{ print $2 }' | sudo xargs kill -9
