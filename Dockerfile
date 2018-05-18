FROM debian
MAINTAINER daemonio
EXPOSE 14265
RUN apt-get update && apt-get install -y \
    procps wget vim lsof default-jre default-jdk && \
    wget \
    https://github.com/daemonio/docker-iota-testnet/raw/master/iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar
RUN wget https://github.com/daemonio/docker-iota-testnet/releases/download/v1.0/iri-1.4.2.4.jar
COPY Snapshot.txt .
COPY Snapshot.log .
COPY executa-iri.sh .
COPY verifica-iri.sh .
CMD ["sh", "executa-iri.sh"]
