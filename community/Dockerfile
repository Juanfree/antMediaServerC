FROM ubuntu:18.04

ARG AntMediaServer

WORKDIR /home

RUN apt-get update \
    && apt-get install -y curl libcap2 wget net-tools \
    && apt-get autoclean \
    && apt-get clean \
    && apt-get autoremove

ADD ./app .

RUN ./install_ant-media-server.sh antMediaServerCommunity.zip

ENTRYPOINT ["/usr/local/antmedia/start.sh"]