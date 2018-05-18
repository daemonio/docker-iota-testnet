#!/bin/bash

sh verifica-iri.sh &

java -jar iri-1.4.2.4.jar --testnet --remote --testnet-no-coo-validation --snapshot=Snapshot.txt -p 14265
