#!/bin/bash
k exec -it elyra-ai -c elyra-ai -- jupyter server list |grep -v running|awk -F"=" '{print $2}' |awk -F" ::" '{print $1}'
