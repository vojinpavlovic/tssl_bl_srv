# Use Debian slim as the base image
FROM debian:bullseye-slim

# Set environment variables
ENV STEAMCMDDIR=/steamcmd
ENV BANNERLORDDIR=/tssl
ENV PATH="$PATH:/usr/share/dotnet"

# Install Linux dependencies and add Microsoft repository
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    apt-transport-https \
    ca-certificates \
    curl \
    tar \
    libgl1-mesa-glx \
    lib32gcc-s1 \
    lib32stdc++6 \
    libcurl4 \
    libssl1.1 \
    gnupg \
    unzip \
    cmake \
    pkg-config \
    g++ \
    mesa-utils \
    libglu1-mesa-dev \
    freeglut3 \
    freeglut3-dev \
    mesa-common-dev \
    libglew-dev \
    libglfw3-dev \
    libglm-dev \
    libao-dev \
    libmpg123-dev && \
    rm -rf /var/lib/apt/lists/*

# Add Microsoft package repository
RUN wget https://packages.microsoft.com/config/debian/11/prod.list && \
    mv prod.list /etc/apt/sources.list.d/microsoft-prod.list && \
    wget https://packages.microsoft.com/keys/microsoft.asc && \
    apt-key add microsoft.asc && \
    apt-get update

# Install .NET SDK
RUN apt-get install -y dotnet-sdk-6.0

# Add i386 architecture for 32-bit libraries
RUN dpkg --add-architecture i386

# Install SteamCMD
RUN mkdir -p ${STEAMCMDDIR} && \
    curl -o ${STEAMCMDDIR}/steamcmd_linux.tar.gz https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf ${STEAMCMDDIR}/steamcmd_linux.tar.gz -C ${STEAMCMDDIR} && \
    rm ${STEAMCMDDIR}/steamcmd_linux.tar.gz

# Create Bannerlord server directory
RUN mkdir -p ${BANNERLORDDIR}

# Set working directory to SteamCMD
WORKDIR ${STEAMCMDDIR}

# Install Bannerlord server using SteamCMD
RUN ./steamcmd.sh +force_install_dir ${BANNERLORDDIR} +login anonymous +app_update 1863440 validate +quit

# Set working directory to Bannerlord server directory
WORKDIR ${BANNERLORDDIR}/bin/Linux64_Shipping_Server

# Copy the runtime files to the Bannerlord server directory
RUN cp -R /usr/share/dotnet/shared/Microsoft.AspNetCore.App/6.0.36/. ${BANNERLORDDIR}/bin/Linux64_Shipping_Server/

# Copy the configuration file from the host to the container
COPY /cfg/tssl_groupfighting.txt ${BANNERLORDDIR}/Modules/Native/tssl_groupfighting.txt

# Copy the map files from the host to the container
COPY /maps/tssl_groupfight_0001 ${BANNERLORDDIR}/Modules/Native/SceneObj/tssl_groupfight_0001

# Expose TCP port 7210
EXPOSE 7210/tcp

# Expose UDP port 7210
EXPOSE 7210/udp

# Run the server
CMD [ \
    "dotnet", \
    "TaleWorlds.Starter.DotNetCore.Linux.dll", \
    "_MODULES_*Native*Multiplayer*_MODULES_", \
    "/dedicatedcustomserverconfigfile", \
    "../../Modules/Native/tssl_groupfighting.txt", \
    "/tickrate", \
    "240", \
    "/dedicatedcustomserverauthtoken", \
    "FkHLd0ru7ehKWdKgdJmXR5oZ3XV483IaQnVX/Zv5uXrAWRIJmqTlUWprxuKXBCqZJKQ387Jdbo8xDLPr9FBhPWo1BCC7HIzmHeumVaHArlZl6JMjzRKGJXMZFjoN/Hr5z8DSMau2NO2VmYM3UGEv9eRjZ+wiyrpbQJd54wRYWc3qsE5zYmlvXxuts9GgJ69pJ/OEhcM/29ZTW1rftk1JbkQTCyexlf2MDZGoOPnNnyn35lux5TZPMfv0TpBlZXz0AczH616vf50NwSGG+L5Baw==", \
    "/dedicatedcustomserver", \
    "7210", \
    "USER", \
    "0", \
    "/playerhosteddedicatedserver" \
]
