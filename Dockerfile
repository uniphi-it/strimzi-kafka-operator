FROM quay.io/strimzi/kafka:0.22.1-kafka-2.7.0
USER root

#####
# Add Debezium connectoes
#####
RUN mkdir /opt/kafka/plugins
WORKDIR /opt/kafka/plugins
RUN curl https://uniphi-harddrive.s3.us-east-2.amazonaws.com/debezium-connector-mysql-1.3.1.Final-plugin.tar.gz -o debezium-connector-mysql-1.3.1.Final-plugin.tar.gz && \
    tar zxvf debezium-connector-mysql-1.3.1.Final-plugin.tar.gz && \
    rm -rf debezium-connector-mysql-1.3.1.Final-plugin.tar.gz
RUN curl https://uniphi-harddrive.s3.us-east-2.amazonaws.com/debezium-connector-postgres-1.3.0.Final-plugin.tar.gz -o debezium-connector-postgres-1.3.0.Final-plugin.tar.gz && \
    tar zxvf debezium-connector-postgres-1.3.0.Final-plugin.tar.gz && \
    rm -rf debezium-connector-postgres-1.3.0.Final-plugin.tar.gz
COPY TimestampConverter-1.2.3.jar debezium-connector-mysql/


WORKDIR $KAFKA_HOME

USER 1001
