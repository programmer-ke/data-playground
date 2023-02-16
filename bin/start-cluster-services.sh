#!/usr/bin/env bash
set -e

start-dfs.sh  # hdfs service
sleep 2
start-yarn.sh # yarn
sleep 2
mapred --daemon start historyserver  # hadoop history server
