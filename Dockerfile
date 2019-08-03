# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java-app (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        openjdk:8-jre-stretch

MAINTAINER Michael Parker <parker@pterodactyl.io>

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && useradd -d /home/container -m container

COPY ./java.policy /docker-java-home/jre/lib/security/java.policy

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
