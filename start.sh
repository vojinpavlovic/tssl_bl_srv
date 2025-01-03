#!/bin/bash

# Run the .NET Core application with the provided arguments
dotnet TaleWorlds.Starter.DotNetCore.Linux.dll "_MODULES_*Native*Multiplayer*_MODULES_" \
  /dedicatedcustomserverconfigfile "../../Modules/Native/ds_server_config.txt" \
  /tickrate 240 \
  /dedicatedcustomserverauthtoken "$BL_SRV_TOKEN" \
  /dedicatedcustomserver 7210 \
  USER 0 \
  /playerhosteddedicatedserver
