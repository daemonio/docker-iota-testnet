#!/bin/bash

sh verifica-iri.sh &

java -jar iri-1.4.2.1.jar -p 14265 --testnet --remote
