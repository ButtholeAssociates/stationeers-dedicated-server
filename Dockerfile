FROM steamcmd/steamcmd:ubuntu-20
LABEL MAINTAINER https://github.com/ButtholeAssociates/stationeers-dedicated-server
LABEL AUTHOR slessardjr

# Link to Guide
# https://stationeers-wiki.com/Dedicated_Server_Guide

# Link To Official Docs
# https://github.com/rocket2guns/StationeersDedicatedServerGuide

ARG PORT_META_SERVER=8081
ARG PORT_STEAM_UPDATE=27015
ARG PORT_GAME=27016

#Use this if you want to use the beta branch.
ENV STEAMCMD_EXTRA_OPS=""

# Dir for Stationeers to store it's data
ENV GAME_DATA_DIR="/stationeers/data"

# Dir for SteamCMD to use where it will download data
ENV GAME_STEAM_DIR="/stationeers/steam"

#
ENV LOG_FILE="$GAME_DATA_DIR/stationeers_log.txt"
ENV SAVE_NAME="Stationeers"
ENV SETTINGS_PATH="$GAME_DATA_DIR/stationeers_settings.xml"
ENV WORLD_TYPE="mars"

## Stationeers Settings
ENV AUTO_SAVE=true
ENV GAME_PORT=$PORT_GAME
ENV SAVE_INTERVAL=300
ENV SAVE_PATH="$GAME_DATA_DIR"
ENV SERVER_AUTH_SECRET="stationeers"
ENV SERVER_MAX_PLAYERS=13
ENV SERVER_NAME="Stationeers Docker -- ButtholeGaming"
ENV SERVER_PASSWORD="stationeers"
ENV SERVER_VISIBLE=true
ENV START_LOCAL_HOST=true
ENV UPNP_ENABLED=false

COPY docker-entrypoint.sh /

#VOLUME [$GAME_DATA_DIR, $GAME_STEAM_DIR]

EXPOSE $PORT_META_SERVER/tcp $PORT_STEAM_UPDATE/udp $PORT_GAME/udp 

WORKDIR $GAME_STEAM_DIR

#Use this for testing only
#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "rocketstation_DedicatedServer.x86_64" ]