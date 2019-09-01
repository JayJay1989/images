FROM		mcr.microsoft.com/dotnet/core/aspnet:2.1-stretch-slim

MAINTAINER	Jonas Lateur <jonas@lateur.pro>

RUN			apt-get update -y &&  apt-get install -y tar && useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]