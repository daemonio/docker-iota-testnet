FROM debian
MAINTAINER daemonio
EXPOSE 14265
RUN apt-get update && apt-get install -y \
    procps wget vim lsof default-jre default-jdk && \
    wget \
    https://github.com/daemonio/docker-iota-testnet/raw/master/iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar
COPY wallet-values.txt .
RUN cat wallet-values.txt | java -jar iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar SnapshotBuilder
RUN wget https://github.com/iotaledger/iri/releases/download/v1.4.2.1/iri-1.4.2.1.jar
COPY roda-servidor.sh .
COPY espera-e-coordinator.sh .
CMD ["sh", "./espera-e-coordinator.sh"]
CMD ["java", "-jar", "iri-1.4.2.1.jar", "-p", "14265", "--testnet", "--remote"]
#RUN java -jar iota-testnet-tools-0.1-SNAPSHOT-jar-with-dependencies.jar Coordinator localhost 14265

