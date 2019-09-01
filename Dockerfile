FROM mcr.microsoft.com/dotnet/core/runtime-deps:2.1-alpine3.9

MAINTAINER Jonas Lateur <jonas@lateur.pro>

RUN apt-get update -y && useradd -d /home/container -m container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

copy ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash","/entrypoint.sh"]