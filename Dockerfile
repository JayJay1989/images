# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java-app (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        openjdk:8-jre-slim

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

RUN echo $'grant {\n\
  permission java.security.AllPermission;\n\
  };' >> /docker-java-home/jre/lib/security/java.policy

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
