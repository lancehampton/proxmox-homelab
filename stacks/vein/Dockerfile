FROM alpine:latest AS builder

# Download SteamCMD
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd_linux.tar.gz && \
    mkdir -p /steamcmd && \
    tar -xvzf /tmp/steamcmd_linux.tar.gz -C /steamcmd

FROM tobix/wine:stable

# Create steam user with specific UID to match host
RUN useradd -u 1000 -m -s /bin/bash steam

# Copy SteamCMD from the builder stage
COPY --from=builder --chown=steam:steam /steamcmd /home/steam/steamcmd

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Create and set ownership of the game directory
RUN mkdir -p /home/steam/vein-dedicated-server && \
    chown steam:steam /home/steam/vein-dedicated-server

USER steam

ENTRYPOINT [ "/entrypoint.sh" ]