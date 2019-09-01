FROM		mcr.microsoft.com/dotnet/core/sdk:2.1-stretch

MAINTAINER	Jonas Lateur <jonas@lateur.pro>

RUN			apt-get update -y &&  apt-get install -y tar iproute && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]