# Run the steam command and update always
steamcmd \
  +@sSteamCmdForcePlatformType windows \
  +force_install_dir /dedicated-server \
  +login anonymous \
  +app_update 3937860 validate \
  +quit

# Change working directory temporarily and use wine to run the server.exe
pushd /dedicated-server/BoatGame/Binaries/Win64 > /dev/null
wine BoatGameServer-Win64-Shipping.exe
popd > /dev/null