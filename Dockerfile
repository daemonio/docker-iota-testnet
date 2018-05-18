FROM openjdk:jre-slim
MAINTAINER daemonio
EXPOSE 14265
RUN apt-get update && apt-get install -y lsof wget && \
    wget https://github.com/daemonio/docker-iota-testnet/releases/download/v1.0/iri-1.4.2.1.jar
COPY iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar .
COPY Snapshot.txt .
COPY executa-iri.sh .
COPY verifica-iri.sh .
CMD ["sh", "executa-iri.sh"]
