#!/bin/bash

PORT=14265
TRIALS=12

while ! lsof -i :$PORT
do
    [ $TRIALS -le 0 ] && exit -1

    sleep 5

    let TRIALS--
done

java -jar target/iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar Coordinator localhost 14265
