FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
        ioquake3-server \
        && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 27960 quake
RUN useradd --system --gid 27960 --uid 27960 --create-home --home-dir /quake quake
USER quake:quake
WORKDIR /quake
EXPOSE 27960/udp

CMD /usr/lib/ioquake3/ioq3ded +set dedicated 1 +set fs_game cpma +exec cfg/server.cfg
