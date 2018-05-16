FROM debian
MAINTAINER daemonio
EXPOSE 14265
RUN apt-get update && apt-get install -y procps wget vim git maven default-jre default-jdk
RUN wget https://github.com/daemonio/docker-iota-testnet/raw/master/iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar
RUN cat wallet-values.txt | java -jar iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar SnapshotBuilder
RUN wget https://github.com/iotaledger/iri/releases/download/v1.4.2.1/iri-1.4.2.1.jar
COPY roda-servidor.sh .
CMD ["sh", "./roda-servidor.sh"]
RUN java -jar target/iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar Coordinator localhost 14265
