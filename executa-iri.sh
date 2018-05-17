#!/bin/bash

nohup java -jar iri-1.4.2.1.jar -p 14265 --testnet --remote &

PORT=14265
TRIALS=60

while ! lsof -i :$PORT
do
    [ $TRIALS -le 0 ] && exit -1

    sleep 5

    let TRIALS--
done

java -jar iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar Coordinator localhost 14700
