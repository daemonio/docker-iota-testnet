#!/bin/bash

sh verifica-iri.sh &

rm -rf testenetbd*
java -jar iri-1.4.2.1.jar --testnet --remote -p 14265
