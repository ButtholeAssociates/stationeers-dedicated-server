FROM steamcmd/steamcmd:ubuntu-20
LABEL MAINTAINER https://github.com/ButtholeAssociates/stationeers-dedicated-server
LABEL AUTHOR slessardjr

# Link to Guide
# https://stationeers-wiki.com/Dedicated_Server_Guide

# Link To Official Docs
# https://github.com/rocket2guns/StationeersDedicatedServerGuide

ENV BRANCH=stable 
ENV GAME_DIR=""
ENV GAME_DATA_DIR=""
ENV AUTO_SAVE_INTERVAL=""
ENV WORLD_NAME=""
ENV WORLD_TYPE=""

COPY docker-entrypoint.sh /

#VOLUME $GAME_DATA_DIR

EXPOSE 8081/tcp 27015/udp 27016/udp 

WORKDIR $GAME_DIR

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["echo"]
#CMD [ "rocketstation_DedicatedServer.x86_64" ]