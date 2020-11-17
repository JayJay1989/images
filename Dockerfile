# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        jenkins/jenkins:lts

LABEL       author="Jonas Lateur" maintainer="jonas@lateur.pro"

RUN         apk add --no-cache --update libc6-compat boost-dev openssl-dev \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]