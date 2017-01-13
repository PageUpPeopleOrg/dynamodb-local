FROM openjdk:8-jre-alpine
MAINTAINER Colin Scott

RUN mkdir /var/dynamodb
WORKDIR /var/dynamodb

EXPOSE 8000

RUN wget -O /var/dynamodb/dynamodb_local http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz
RUN tar xfz /var/dynamodb/dynamodb_local

ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar", "-dbPath", "/var/dynamodb_db"]
CMD ["-port", "8000", "-sharedDb"]

VOLUME ["/var/dynamodb_db", "/var/dynamodb"]
