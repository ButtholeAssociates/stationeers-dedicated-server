#!/bin/bash
#set -x
set -eo pipefail

steamcmd +force_install_dir $GAME_STEAM_DIR +login anonymous +app_update 600760 $STEAMCMD_EXTRA_OPS validate +quit

if [[ "$1" = "rocketstation_DedicatedServer.x86_64" ]]; then
  export PATH=$GAME_STEAM_DIR:$PATH

  exec "$@" \
    -loadlatest "$SAVE_NAME" "$WORLD_TYPE" \
    -logFile "$LOG_FILE" \
    -settingspath "$SETTINGS_PATH" \
    -settings \
      AutoSave "$AUTO_SAVE" \
      GamePort "$GAME_PORT" \
      SaveInterval "$SAVE_INTERVAL" \
      SavePath "$SAVE_PATH" \
      ServerAuthSecret "$SERVER_AUTH_SECRET" \
      ServerMaxPlayers "$SERVER_MAX_PLAYERS" \
      ServerName "$SERVER_NAME" \
      ServerPassword "$SERVER_PASSWORD" \
      ServerVisible "$SERVER_VISIBLE" \
      StartLocalHost "$START_LOCAL_HOST" \
      UPNPEnabled "$UPNP_ENABLED"

else
  exec "$@"
fi