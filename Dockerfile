# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc & screen support)
# Minimum Panel Version: 0.6.0
# ----------------------------------

FROM        openjdk:11.0.6-jre-slim

LABEL       author="JayJay1989BE" maintainer="jonas@lateur.pro"

RUN apt-get update -y \
 && apt-get install -y apt-utils curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 screen\
 && useradd -d /home/container -m container\
 && usermod -aG sudo container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
