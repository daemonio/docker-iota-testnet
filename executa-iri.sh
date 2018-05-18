#!/bin/bash

sh verifica-iri.sh &

java -jar iri-1.4.2.4.jar -p 14265 --testnet --snapshot=Snapshot.txt --remote
