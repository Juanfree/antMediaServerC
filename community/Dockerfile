FROM ubuntu:18.04

WORKDIR /home

ADD ./app .

RUN ./install_ant-media-server.sh antMediaServerCommunity.zip \
    && rm -f install_ant-media-server.sh antMediaServerCommunity.zip \
    && rm -f antMediaServerCommunity.zip

ENTRYPOINT ["/usr/local/antmedia/start.sh"]