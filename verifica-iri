#!/bin/bash

PORT=14265

# 8 minutes to wait to iri main package to go up.
TRIALS=60

while ! lsof -i :$PORT
do
    [ $TRIALS -le 0 ] && exit -1

    sleep 5

    let TRIALS--
done

java -jar iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar Coordinator localhost 14700
